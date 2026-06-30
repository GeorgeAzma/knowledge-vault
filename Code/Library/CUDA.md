https://docs.nvidia.com/cuda/cuda-programming-guide/part2.html
### Built-Ins
``` c++
// builtins (dim3: [u32; 3])
blockIdx: dim3; // thread block index
blockDim: dim3; // threads in a block
gridDim: dim3; // total thread block count
threadIdx: dim3; // thread index in a block
```
### Functions
``` c++
#include <cuda_runtime.h>

// callable from device/host
__global__ void vec_add(float* a, float* b, float* c) {}

//  callable from __global__ or __device__
__device__ void fn() {}

int main() {
    vec_add<<blocks, block_threads, shared_mem_bytes, stream>>()
    return 0;
}
```
### Memory
##### Allocate
``` c++
cudaMalloc((void**)&ptr, bytes) // GPU memory
cudaMallocManaged((void**)&ptr, bytes); // CPU-GPU unified memory
// best for CPU-GPU memcpy use, pinned memory
cudaMallocHost((void**)&ptr, bytes); // H2D: instant, D2H: fast
// cudaHostAlloc[Default/Portable/WriteCombined]
cudaHostAlloc((void**)&ptr, bytes, cudaHostAllocDefault); // same as cudaMallocHost
// pins memory across all CPU threads and GPUs
cudaHostAlloc((void**)&ptr, bytes, cudaHostAllocPortable);
// maps CPU memory to GPU memory, avoids copies
cudaHostAlloc((void**)&ptr, bytes, cudaHostAllocMapped);
// cudaHostRegister[Portable/Mapped/IoMemory/ReadOnly]
cudaHostRegister(ptr, bytes, cudaHostRegisterDefault)
```
##### Mem Ops
``` c++
// prefetches managed memory to the GPU to reduce page-fault-driven migration
cudaMemPrefetchAsync(ptr, N*sizeof(float), 0, 0);

// cudaMemcpyDefault for determining copy dst/src device using pointers
cudaMemcpy(dst, src, bytes, cudaMemcpyHostToDevice); // cudaMemcpyDeviceToHost
cudaMemcpy(dst, src, bytes, cudaMemcpyDefault); // infers tranfer direction from pointer
cudaMemcpyToSymbol(dst, src, count, cudaMemcpyHostToDevice); // copy to global/constant memory
cudaMemset(ptr, 0, bytes);
```
##### Async
``` c++
cudaStream_t stream;  
cudaStreamCreate(&stream);

cudaMemcpyAsync(gpu, cpu, size, cudaMemcpyHostToDevice, stream);

cudaStreamDestroy(stream);
```
##### Free
``` c++
cudaFree(ptr)
cudaFreeHost(ptr);
```
##### Shared Memory / Registers / Constant Memory
Accessible by all threads in a thread block, same as `L1` cache, located on SM, `~100K`
``` c++
__shared__ float shared_data[128];
shared_data[threadIdx.x] = input_data[blockDim.x * blockIdx.x + threadIdx.x]

_syncthreads(); // guarantees all of shared_data is written by all threads

// not ideal, since thread[0] will block all threads until it finishes calculating the sum
// only viable if summing is negligable compared to operations above
if (threadIdx.x == 0) {
    float sum = 0;
    for (int i = 0; i < blockDim.x; ++i)
        sum += shared_data[i];
    output_data[blockIdx.x] = sum;
}

// dynamic size based on <<,,shared_mem_bytes>> parameter during kernel launch
extern __shared__ float shared_data[]; // only 1 per kernel

// Access maximum shared memory size per SM and per thread block  
cudaDeviceProp dev_prop;
cudaGetDeviceProperties(&dev_prop, 0);
dev_prop.sharedMemPerMultiprocessor; // in bytes
dev_prop.sharedMemPerBlock; // in bytes
dev_prop.regsPerMultiprocessor;
dev_prop.regsPerBlock;

cudaFuncSetCacheConfig() // suggests L1 cache vs shared memory split to cuda runtime

__constant__ float coeffs[4]; // fast read-only, like uniforms in GLSL
float h_coeffs[4] = {1.0f, 2.0f, 3.0f, 4.0f};
cudaMemcpyToSymbol(coeffs, h_coeffs, sizeof(h_coeffs));
```
### Events
``` c++
cudaEvent_t start, stop;
cudaEventCreate(&start);
cudaEventCreate(&stop);
cudaEventRecord(start);

vec_add<<blocks, block_threads>>()

cudaEventRecord(stop); // [start] -> vec_add -> [stop]
cudaEventSynchronize(stop); // waits until [stop]

float ms = 0;
cudaEventElapsedTime(&ms, start, stop);

cudaEventDestroy(start);
cudaEventDestroy(stop);
```
### Libraries
do not forget to link `cublas.lib, cufft.lib, cudnn.lib, curand.lib, cusolver.lib`
##### `cuda_fp16.h`

##### `cuBLAS.h`
##### `cuFFT.h`
##### `cuDNN.h`
##### `curand.h`
``` c++
curandGenerator_t gen;
curandCreateGenerator(&gen, CURAND_RNG_PSEUDO_XORWOW);
curandSetPseudoRandomGeneratorSeed(&gen, 42ULL);

curandGenerateUniform(gen, float_ptr, count); // curandGenerateNormal, curandGenerateLogNormal

curandDestroyGenerator(gen);

// per-thread random state
// curandStatePhilox4_32_10_t: best for parallel generates float4 (4 floats at a time) 
//                             use curand_uniform4 to avoid waste (64 bytes)
// curandStateMRG32k3a: highest quality, slowest (72 bytes)
// curandStateScrambledSobol32: Quasi-random, better convergence for Monte Carlo
curandState* d_states; // XORWOW: default (48 bytes)
cudaMalloc(&d_states, blocks * block_dim * sizeof(curandState));
__global__ void init_rng(curandState* states, uint64_t seed, size_t count) {
    size_t i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < count) curand_init(seed, i, 0, &states[i]); // (seed, sequence_id, offset)
}

__global__ void work(curandState* states, float* out, size_t count) {
    size_t i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i >= count) return;
    curandState local = states[i]; // copy to local — much faster
    out[i] = curand_uniform(&local);
    states[i] = local; // write back
}
```
##### `cusolver`
for [[LU Decomposition]], [[QR Decomposition]], [[Singular Value Decomposition]], [[Eigenvalue]]
``` c++
#include <cusolverDn.h>  // Dense
#include <cusolverSp.h>  // Sparse

cusolverDnHandle_t solver;
cusolverDnCreate(&solver);

// LU factorization (getrf) then solve (getrs)
// 1. Query workspace size
int lwork;
cusolverDnSgetrf_bufferSize(solver, N, N, d_A, N, &lwork);

// 2. Allocate workspace
float* d_work;
cudaMalloc(&d_work, lwork * sizeof(float));

// 3. Factorize
int* d_pivot, *d_info;
cudaMalloc(&d_pivot, N * sizeof(int));
cudaMalloc(&d_info, sizeof(int));
cusolverDnSgetrf(solver, N, N, d_A, N, d_work, d_pivot, d_info);

// 4. Solve Ax = b
cusolverDnSgetrs(solver, CUBLAS_OP_N, N, 1, d_A, N, d_pivot, d_b, N, d_info);

cusolverDnDestroy(solver);
```
### Intrinsics
``` c++
__syncthreads() // thread block barrier, threads in a block wait here until all threads are finished
```
### [[GPU Architecture]]

### VSCode Config
`c_cpp_properties.json`
``` json
{
    "configurations": [
        {
            "name": "Win32",
            "includePath": [
                "${workspaceFolder}/**",
                "${env:CUDA_PATH}/include",
                "C:/Program Files (x86)/Microsoft Visual Studio/18/BuildTools/VC/Tools/MSVC/14.51.36231/include"
            ],
            "defines": [
                "_DEBUG",
                "UNICODE",
                "_UNICODE"
            ],
            "windowsSdkVersion": "10.0.26100.0",
            "cStandard": "c17",
            "cppStandard": "c++26",
            "intelliSenseMode": "windows-msvc-x64",
            "compilerPath": "C:\\Program Files (x86)\\Microsoft Visual Studio\\18\\BuildTools\\VC\\Tools\\MSVC\\14.51.36231\\bin\\Hostx64\\x64\\cl.exe"
        }
    ],
    "version": 4
}
```