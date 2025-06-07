``` powershell
GPU Hardware
- GPU Device
  - Memory + Texture Memory
  - Streaming Multiprocessor (SM) 
    (divide the submitted among SMs blocks)
    - Multiprocessor Memory
    - SIMD cores
    - Register file
    - Constant cache
    - Texture cache

GPU Software
- Kernel
- Device Memory
  - Block (Max = ~512)
    - Block Memory
    - Threads (Warp = 32)
```