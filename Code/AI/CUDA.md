- **Kernel** [[GPU Architecture]] code block
- **Host** CPU
- `__global__` kernel called from device or host via 
   - `func<<blocks, block_threads>>()`
- `__device__` called from `__global__` or `__device__`
### Variables
- `blockIdx, blockDim` they are type `dim3`
- `threadIdx`
- `gridDim`
### Functions
- `cudaMalloc((void **)&int_ptr, bytes)`
  - `cudaMallocManaged(ptr, bytes)` `CPU-GPU unified memory`
- `cudaFree(ptr)`
- `cudaMemcpy(dst, src, bytes, cudaMemcpyHostToDevice)`
- `cudaDeviceSynchronize()` `wait for GPU`
