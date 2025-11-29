#include <cuda_runtime.h>
#include <cstdio>
#include <cmath>
#include <algorithm>

// Minimal Flash Attention forward kernel
__global__ void forward_kernel(
    const float* Q, const float* K, const float* V,
    const int N, const int d,
    const int Tc, const int Tr,
    const int Bc, const int Br,
    const float softmax_scale,
    float* l, float *m, float* O
){
    int tx = threadIdx.x;
    int bx = blockIdx.x;  //batch index
    int by = blockIdx.y;  //head index

    int qkv_offset = (bx * gridDim.y * N * d) + (by * N * d);
    int lm_offset = (bx * gridDim.y * N) + (by * N);

    extern __shared__ float sram[];
    int tile_size = Bc * d;
    float* Qi = sram;
    float* Kj = &sram[tile_size];
    float* Vj = &sram[tile_size * 2];
    float* S = &sram[tile_size * 3];

    for(int j = 0; j < Tc; j++){
        for(int x = 0; x < d; x++){
            Kj[(tx * d) + x] = K[qkv_offset + (tile_size * j) + (tx * d) + x];
            Vj[(tx * d) + x] = V[qkv_offset + (tile_size * j) + (tx * d) + x];
        }
        __syncthreads();

        for(int i = 0; i < Tr; i++){
            for(int x = 0; x < d; x++){
                Qi[(tx * d) + x] = Q[qkv_offset + (tile_size * i) + (tx * d) + x];
            }

            float row_m_prev = m[lm_offset + (Br * i) + tx];
            float row_l_prev = l[lm_offset + (Br * i) + tx];

            float row_m = -INFINITY;
            for(int y = 0; y < Bc; y++){
                float sum = 0;
                for(int x = 0; x < d; x++){
                    sum += Qi[(tx * d) + x] * Kj[(y * d) + x];
                }
                sum *= softmax_scale;
                S[(Bc * tx) + y] = sum;
                if(sum > row_m)
                    row_m = sum;
            }

            float row_l = 0;
            for(int y = 0; y < Bc; y++){
                S[(Bc * tx) + y] = __expf(S[(Bc * tx) + y] - row_m);
                row_l += S[(Bc * tx) + y];
            }

            float row_m_new = max(row_m_prev, row_m);
            float row_l_new = (__expf(row_m_prev - row_m_new) * row_l_prev) +
                             (__expf(row_m - row_m_new) * row_l);

            for(int x = 0; x < d; x++){
                float pv = 0;
                for(int y = 0; y < Bc; y++){
                    pv += S[(Bc * tx) + y] * Vj[(y * d) + x];
                }
                O[qkv_offset + (tile_size * i) + (tx * d) + x] =
                    (1 / row_l_new) *
                    ((row_l_prev * __expf(row_m_prev - row_m_new) *
                      O[qkv_offset + (tile_size * i) + (tx * d) + x]) +
                     (__expf(row_m - row_m_new) * pv));
            }

            m[lm_offset + (Br * i) + tx] = row_m_new;
            l[lm_offset + (Br * i) + tx] = row_l_new;
        }
        __syncthreads();
    }
}

// Host-side kernel launcher
void launch_forward_kernel(
    const float* d_Q, const float* d_K, const float* d_V,
    int B, int nh, int N, int d,
    float* d_O
) {
    const int Bc = 32;
    const int Br = 32;
    const int Tc = (N + Bc - 1) / Bc;
    const int Tr = (N + Br - 1) / Br;
    const float softmax_scale = 1.0f / sqrtf((float)d);

    // Allocate running statistics
    float* d_l; float* d_m;
    cudaMalloc(&d_l, B * nh * N * sizeof(float));
    cudaMalloc(&d_m, B * nh * N * sizeof(float));
    cudaMemset(d_l, 0, B * nh * N * sizeof(float));
    cudaMemset(d_m, 0xff, B * nh * N * sizeof(float)); // -INFINITY

    const int sram_size = (3 * Bc * d * sizeof(float)) + (Bc * Br * sizeof(float));

    int max_sram_size;
    cudaDeviceGetAttribute(&max_sram_size, cudaDevAttrMaxSharedMemoryPerBlock, 0);
    printf("Max shared memory: %d, requested shared memory: %d\n",
           max_sram_size, sram_size);

    dim3 grid_dim(B, nh);
    dim3 block_dim(Bc);

    forward_kernel<<<grid_dim, block_dim, sram_size>>>(
        d_Q, d_K, d_V, N, d, Tc, Tr, Bc, Br, softmax_scale,
        d_l, d_m, d_O
    );

    cudaFree(d_l);
    cudaFree(d_m);
}

int main() {
    // Example dimensions
    const int B = 1;    // batch size
    const int nh = 1;   // number of heads
    const int N = 32;   // sequence length
    const int d = 32;   // head dimension

    size_t qkv_size = B * nh * N * d * sizeof(float);

    // Allocate host memory
    float* h_Q = new float[B * nh * N * d];
    float* h_K = new float[B * nh * N * d];
    float* h_V = new float[B * nh * N * d];
    float* h_O = new float[B * nh * N * d];

    // Initialize Q, K, V with some values
    for (int i = 0; i < B * nh * N * d; ++i) {
        h_Q[i] = 1.0f; // or random values
        h_K[i] = 1.0f;
        h_V[i] = 1.0f;
    }

    // Allocate device memory
    float *d_Q, *d_K, *d_V, *d_O;
    cudaMalloc(&d_Q, qkv_size);
    cudaMalloc(&d_K, qkv_size);
    cudaMalloc(&d_V, qkv_size);
    cudaMalloc(&d_O, qkv_size);

    // Copy Q, K, V to device
    cudaMemcpy(d_Q, h_Q, qkv_size, cudaMemcpyHostToDevice);
    cudaMemcpy(d_K, h_K, qkv_size, cudaMemcpyHostToDevice);
    cudaMemcpy(d_V, h_V, qkv_size, cudaMemcpyHostToDevice);

    // Launch kernel
    launch_forward_kernel(d_Q, d_K, d_V, B, nh, N, d, d_O);

    // Copy output back to host
    cudaMemcpy(h_O, d_O, qkv_size, cudaMemcpyDeviceToHost);

    // Print first few output values
    printf("Output O (first 10 values):\n");
    for (int i = 0; i < 10; ++i) {
        printf("%f ", h_O[i]);
    }
    printf("\n");

    // Free memory
    delete[] h_Q;
    delete[] h_K;
    delete[] h_V;
    delete[] h_O;
    cudaFree(d_Q);
    cudaFree(d_K);
    cudaFree(d_V);
    cudaFree(d_O);

    return 0;
}
