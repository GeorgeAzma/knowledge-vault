[[RTX 3080]]
``` powershell
GPU Hardware
- GPU Device
  - Memory (10 GB) + Texture Memory
  - Streaming Multiprocessor (SM = 68) 
    (divide the submitted among SMs blocks)
    - Multiprocessor Memory
    - SIMD Cores
    - Warp Schedulers
    - Register File
    - Constant Cache
    - Texture Cache
    - Texture Mapping Unit = 272
    - Tensor Core = 272
    - Raytracing Core = 68
    - Render Output Unit = 96

GPU Software
- Kernel
- Device Memory
  - Block (Max = ~512)
    - Block Memory
    - Threads (Warp = 32)

Efficiency Tips:
- 1-8 blocks active per SM (68-544 blocks)
- 128-1024 threads per block (256 usually)
- max resident warps/SM are limited by registers + shared memory
```
