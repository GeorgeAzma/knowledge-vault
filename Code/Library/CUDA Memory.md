### Allocate
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
### Mem Ops
``` c++
// prefetches managed memory to the GPU to reduce page-fault-driven migration
cudaMemPrefetchAsync(ptr, N*sizeof(float), 0, 0);

// cudaMemcpyDefault for determining copy dst/src device using pointers
cudaMemcpy(dst, src, bytes, cudaMemcpyHostToDevice); // cudaMemcpyDeviceToHost
cudaMemcpy(dst, src, bytes, cudaMemcpyDefault); // infers tranfer direction from pointer
cudaMemcpyToSymbol(dst, src, count, cudaMemcpyHostToDevice); // copy to global/constant memory
cudaMemset(ptr, 0, bytes);
```
### Async
``` c++
cudaStream_t stream;  
cudaStreamCreate(&stream);

cudaMemcpyAsync(gpu, cpu, size, cudaMemcpyHostToDevice, stream);

cudaStreamDestroy(stream);
```
### Free
``` c++
cudaFree(ptr)
cudaFreeHost(ptr);
```
### Shared Memory
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

cudaFuncSetCacheConfig() // suggests L1 cache vs shared memory split to cuda runtime
```
### Constant Memory
``` c++
__constant__ float coeffs[4]; // fast read-only, like uniforms in GLSL
float h_coeffs[4] = {1.0f, 2.0f, 3.0f, 4.0f};
cudaMemcpyToSymbol(coeffs, h_coeffs, sizeof(h_coeffs));
```
