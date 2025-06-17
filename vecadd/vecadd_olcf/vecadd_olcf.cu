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

    //host vectors
    double *h_a, *h_b, *h_c;

    //device vectors
    double *d_a, *d_b, *d_c;

    //size of each vector (in bytes)
    size_t bytes = N * sizeof(double);

    //Allocating pinned memory on host for host vectors
    cudaMallocHost(&h_a, bytes); //alternatively: h_a = (double*)malloc(bytes);
    cudaMallocHost(&h_b, bytes);
    cudaMallocHost(&h_c, bytes);
    
    //Allocating memory on device for device vectors
    cudaMalloc(&d_a,bytes);
    cudaMalloc(&d_b, bytes);
    cudaMalloc(&d_c, bytes);

    //Initializing input vectors to sin^2 and cos^2
    for(int i = 0; i < N; ++i){
        h_a[i] = sin(i) * sin(i);
        h_b[i] = cos(i) * cos(i);
    }

    //Copying input data from host to device
    cudaMemcpy(d_a, h_a, bytes, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, h_b, bytes, cudaMemcpyHostToDevice);

    //number of threads per thread block (blockSize)
    int NUM_THREADS = 1 << 8; //256

    //number of thread blocks in grid (gridSize)
    //pad extra thread block to grid if N isnt perfectly divisible by NUM_THREADS
    int NUM_BLOCKS = (N + NUM_THREADS - 1) / NUM_THREADS;
    //alternatively int NUM_BLOCKS = ceil((float)n/NUM_THREADS)

    //Launching kernel on device
    //kernel calls are async --> host programs continues execution after call
    vecAdd<<<NUM_BLOCKS, NUM_THREADS>>>(d_a, d_b, d_c, N);

    //Copying output data from device to host
    //cudaMemcpy is a synchronous operation --> waits for kernel call to complete
    //acts as both memcpy + sync barrier
    cudaMemcpy(h_c, d_c, bytes, cudaMemcpyDeviceToHost);

    //Result verification
    double sum = 0;
    for(int i = 0; i < N; ++i)
        sum += h_c[i];
    sum /= (double)N;
    if(fabs(sum - 1.0) < epsilon)
        printf("PASS\n");
    else
        printf("FAIL\n");
    
    //Releasing device memory
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);

    //Releasing host memory
    free(h_a);
    free(h_b);
    free(h_c);
}
