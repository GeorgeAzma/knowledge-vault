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
### GTX 1060 Vulkan
``` python
# Image
max_image_dimension1_d: 32768,
max_image_dimension2_d: 32768,
max_image_dimension3_d: 16384,
max_image_dimension_cube: 32768,
max_image_array_layers: 2048,
max_texel_buffer_elements: 134217728 (128 Mega Pixels (1024)),

# Buffer
max_uniform_buffer_range: 65536,
max_push_constants_size: 256,
max_bound_descriptor_sets: 32,
max_fragment_output_attachments: 8,

# Compute
max_compute_shared_memory_size: 49152, (48 kB)
max_compute_work_group_count: [2147483647, 65535, 65535],
max_compute_work_group_invocations: 1536,
max_compute_work_group_size: [1536, 1024, 64],

# Alignment
buffer_image_granularity: 1024,
min_memory_map_alignment: 64,
min_uniform_buffer_offset_alignment: 256,
min_storage_buffer_offset_alignment: 16,

# Memory
Heap[0]: 2965 MiB # GPU only
Heap[1]: 4056 MiB # CPU
Heap[2]: 214  MiB # CPU/GPU shared
MemType[0..6]: heap_idx: 1, prop_flags: None
MemType[7]:    heap_idx: 0, prop_flags: DEVICE_LOCAL
MemType[8]:    heap_idx: 1, prop_flags: HOST_[VISIBLE/COHERENT]
MemType[9]:    heap_idx: 1, prop_flags: HOST_[VISIBLE/COHERENT/CACHED]
MemType[10]:   heap_idx: 2, prop_flags: DEVICE_LOCAL | HOST_[VISIBLE/COHERENT]

# Features
image_cube_array
geometry_shader
tessellation_shader
multi_draw_indirect
draw_indirect_first_instance
fill_mode_non_solid
logic_op
sample_rate_shading
wide_lines
large_points
texture_compression_[etc2/astc_ldr/bc]
occlusion_query_precise
pipeline_statistics_query
[vertex/fragment]_pipeline_stores_and_atomics
shader_[float64/int64/int16]
shader_resource_residency
sparse_binding
multi_viewport

# Extensions
VK_KHR_swapchain
VK_KHR_draw_indirect_count
VK_KHR_multiview
VK_KHR_dynamic_rendering
VK_KHR_shader_float16_int8
VK_KHR_shader_integer_dot_product
VK_KHR_external_memory[_win32] (CUDA shared memory)
VK_KHR_spirv_1_4
VK_KHR_video_[en/de]code_h26[4/5]
VK_KHR_video_queue
VK_KHR_zero_initialize_workgroup_memory
VK_KHR_buffer_device_address
VK_KHR_index_type_uint8
VK_KHR_line_rasterization
VK_KHR_pipeline_library
VK_KHR_shader_atomic_int64
VK_KHR_pipeline_executable_properties
VK_KHR_depth_stencil_resolve
VK_KHR_descriptor_update_template
VK_KHR_shader_clock (debug clock cycles)
VK_EXT_transform_feedback
VK_EXT_multi_draw
VK_EXT_primitive_topology_list_restart
VK_EXT_conditional_rendering
VK_EXT_conservative_rasterization
VK_EXT_pipeline_creation_cache_control
VK_EXT_shader_module_identifier
```
