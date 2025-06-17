//Sum of two N-elements vectors using Unified Memory and Prefetching
//doing sin^2 + cos^2 = 1
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

//check to compensate for FP rep inaccuracy
const double epsilon = 1e-6; 

__global__ void vecAdd(double *a, double *b, double *c, int N){
    int tid = (blockIdx.x * blockDim.x) + threadIdx.x;
    if(tid < N)
        c[tid] = a[tid] + b[tid];
}

int main(int argc, char* argv[]){

    int N = 1 << 16; //default value: 2^16 = 65536

    //Input vector size argument handling
    if(argc == 1){
        printf("Usage: %s <vector_size>\n", argv[0]);
        printf("Using default size: %d\n", N);
    } else if(argc == 2){
        N = atoi(argv[1]);
        if(N <= 0){
            printf("Error: Vector size must be positive\n");
            return 1;
        }
        printf("Using vector size: %d\n", N);
    } else{
        printf("Error: Too many arguments\n");
        printf("Usage: %s <vector_size>\n", argv[0]);
        return 1;
    }

    //common host and device vectors (unified memory pointers)
    double *a, *b, *c;

    //size of each vector (in bytes)
    size_t bytes = N * sizeof(double);

    //Alocating unified memory for pointers
    cudaMallocManaged(&a, bytes);
    cudaMallocManaged(&b, bytes);
    cudaMallocManaged(&c, bytes);

    //Getting device ID for prefetching calls
    int gpu_id;
    cudaGetDevice(&gpu_id);

    //Setting hints about data and prefetching
    cudaMemAdvise(a, bytes, cudaMemAdviseSetPreferredLocation, cudaCpuDeviceId);
    cudaMemAdvise(b, bytes, cudaMemAdviseSetPreferredLocation, cudaCpuDeviceId);
    cudaMemPrefetchAsync(c, bytes, gpu_id);

    //Initializing input vectors to sin^2 and cos^2
    for(int i = 0; i < N; ++i){
        a[i] = sin(i) * sin(i);
        b[i] = cos(i) * cos(i);
    }

    //Prefetching 'a' and 'b' arrays to device
    cudaMemAdvise(a, bytes, cudaMemAdviseSetReadMostly, gpu_id);
    cudaMemAdvise(b, bytes, cudaMemAdviseSetReadMostly, gpu_id);
    cudaMemPrefetchAsync(a, bytes, gpu_id);
    cudaMemPrefetchAsync(b, bytes, gpu_id);

    //number of threads per thread block (blockSize)
    int NUM_THREADS = 1 << 10; //1024

    //number of thread blocks in grid (gridSize)
    //pad extra thread block to grid if N isnt perfectly divisible by NUM_THREADS
    int NUM_BLOCKS = (N + NUM_THREADS - 1) / NUM_THREADS;
    //alternatively int NUM_BLOCKS = ceil((float)n/NUM_THREADS)

    //Launching kernel on device
    //kernel calls are async --> host programs continues execution after call
    vecAdd<<<NUM_BLOCKS, NUM_THREADS>>>(a, b, c, N);

    //wait for all previous operations to complete before using values
    //need to explicitly do this cause we dont get the implicit sync of cudaMemcpy
    cudaDeviceSynchronize();

    //Prefetching to host
    cudaMemPrefetchAsync(a, bytes, cudaCpuDeviceId);
    cudaMemPrefetchAsync(b, bytes, cudaCpuDeviceId);
    cudaMemPrefetchAsync(c, bytes, cudaCpuDeviceId);

    //Result verification
    double sum = 0;
    for(int i = 0; i < N; ++i)
        sum += c[i];
    sum /= (double)N;
    if(fabs(sum - 1.0) < epsilon)
        printf("PASS\n");
    else
        printf("FAIL\n");
    
    //Free-ing unified memory
    cudaFree(a);
    cudaFree(b);
    cudaFree(c);
}
