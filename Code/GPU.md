```
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
### GTX 1060
```
Performance:
  Pixel Rate    81.98 GPx/s
  Texture Rate  123   GTx/s
  FP32          3.935 TFLOPS
  Memory Bandw  192.2 GB/s

Clock:
  Base Clock  1506 MHz
  Bost Clock  1708 MHz
  Memr Clock  2002 MHz (8 Gbps effective)

Memory: 3 GB, GDDR5, 192 bit bus

Cache:
  L1  48   KB (per SM)
  L2  1536 KB

Units/Cores:
  Shading Units             1152
  Texture Mapping Units     72
  Render Output Units       48
  Streaming Multiprocessor  9

Power: 120W
Architecture: Pascal (GP106)
```
### RTX 4090
```
Performance:
  Pixel Rate    443.5 GPx/s
  Texture Rate  1290  GTx/s
  FP32          82.58 TFLOPS
  Memory Bandw  1.01 TB/s
  
Clock:
  Base Clock  2235 MHz
  Bost Clock  2520 MHz
  Memr Clock  1313 MHz (21 Gbps effective)

Memory: 24 GB, GDDR6X, 384 bit bus
  
Cache:
  L1  128 KB (per SM)
  L2  72 MB
  
Units/Cores:
  Shading Units             16384
  Texture Mapping Units     512
  Render Output Units       176
  Streaming Multiprocessor  128
  Ray Tracing Cores         128
  Tensor Cores              512

Power: 450W
Architecture: Ada Lovelace (AD102)
```
