# RTX 3080
``` powershell
# Properties
api_version: 4210991
driver_version: 2415951872
vendor_id: 4318
device_id: 8710
device_type: DISCRETE_GPU
device_name: "NVIDIA GeForce RTX 3080"

# Limits
max_image_dimension1_d: 32768
max_image_dimension2_d: 32768
max_image_dimension3_d: 16384
max_image_dimension_cube: 32768
max_image_array_layers: 2048
max_texel_buffer_elements: 134217728 (128 Mega Pixels (1024))
max_uniform_buffer_range: 65536
max_push_constants_size: 256
max_sampler_allocation_count: 4000
buffer_image_granularity: 1024
sparse_address_space_size: 1099511627776 (1 TiB)
max_bound_descriptor_sets: 32
max_descriptor_set_uniform_buffers_dynamic: 15
max_descriptor_set_storage_buffers_dynamic: 16
max_vertex_input_attributes: 32
max_vertex_input_bindings: 32
max_vertex_input_attribute_offset: 2047
max_vertex_input_binding_stride: 2048
max_vertex_output_components: 128
max_tessellation_generation_level: 64
max_tessellation_patch_size: 32
max_tessellation_control_per_vertex_input_components: 128
max_tessellation_control_per_vertex_output_components: 128
max_tessellation_control_per_patch_output_components: 120
max_tessellation_control_total_output_components: 4216
max_tessellation_evaluation_input_components: 128
max_tessellation_evaluation_output_components: 128
max_geometry_shader_invocations: 32
max_geometry_input_components: 128
max_geometry_output_components: 128
max_geometry_output_vertices: 1024
max_geometry_total_output_components: 1024
max_fragment_input_components: 128
max_fragment_output_attachments: 8
max_fragment_dual_src_attachments: 1
max_compute_shared_memory_size: 49152
max_compute_work_group_count: (2147483647, 65535, 65535)
max_compute_work_group_invocations: 1024
max_compute_work_group_size: (1024, 1024, 64)
sub_pixel_precision_bits: 8
sub_texel_precision_bits: 8
mipmap_precision_bits: 8
max_sampler_lod_bias: 15.0
max_sampler_anisotropy: 16.0
max_viewports: 16
max_viewport_dimensions: 32768 x 32768
viewport_bounds_range: -65536.0 -> 65536.0
viewport_sub_pixel_bits: 8
min_memory_map_alignment: 64
min_texel_buffer_offset_alignment: 16
min_uniform_buffer_offset_alignment: 64
min_storage_buffer_offset_alignment: 16
min_texel_offset: -8
max_texel_offset: 7
min_texel_gather_offset: -32
max_texel_gather_offset: 31
min_interpolation_offset: -0.5
max_interpolation_offset: 0.4375
sub_pixel_interpolation_offset_bits: 4
max_framebuffer_width: 32768
max_framebuffer_height: 32768
max_framebuffer_layers: 2048
framebuffer_color_sample_counts: 8
framebuffer_depth_sample_counts: 8
framebuffer_stencil_sample_counts: 16
framebuffer_no_attachments_sample_counts: 16
max_color_attachments: 8
sampled_image_color_sample_counts: 8
sampled_image_integer_sample_counts: 8
sampled_image_depth_sample_counts: 8
sampled_image_stencil_sample_counts: 16
storage_image_sample_counts: 8
max_sample_mask_words: 1
timestamp_compute_and_graphics: 1
timestamp_period: 1.0
max_clip_distances: 8
max_cull_distances: 8
max_combined_clip_and_cull_distances: 8
discrete_queue_priorities: 2
point_size_range: 1.0 -> 2047.9375
line_width_range: 1.0 -> 64.0
point_size_granularity: 0.0625
line_width_granularity: 0.0625
strict_lines: 1
standard_sample_locations: 1
optimal_buffer_copy_offset_alignment: 1
optimal_buffer_copy_row_pitch_alignment: 1
non_coherent_atom_size: 64
sparse_properties: PhysicalDeviceSparseProperties {
    residency_standard2_d_block_shape: 1
    residency_standard2_d_multisample_block_shape: 1
    residency_standard3_d_block_shape: 1
    residency_aligned_mip_size: 0
    residency_non_resident_strict: 1
}

Heap[0]: 10053 MiB # GPU
Heap[1]: 16302 MiB # CPU
Heap[2]: 214 MiB # CPU/GPU
MemType[0]:    heap_index: 1, prop_flags: None
MemType[1..2]: heap_index: 0, prop_flags: DEVICE_LOCAL
MemType[3]:    heap_index: 1, prop_flags: HOST_[VISIBLE/COHERENT]
MemType[4]:    heap_index: 1, prop_flags: HOST_[VISIBLE/COHERENT/CACHED]
MemType[5]:    heap_index: 2, prop_flags: DEVICE_LOCAL | HOST_[VISIBLE/COHERENT]

# Features
robust_buffer_access
full_draw_index_uint32
image_cube_array
independent_blend
geometry_shader
tessellation_shader
sample_rate_shading
dual_src_blend
logic_op
multi_draw_indirect
draw_indirect_first_instance
depth_clamp
depth_bias_clamp
fill_mode_non_solid
depth_bounds
wide_lines
large_points
alpha_to_one
multi_viewport
sampler_anisotropy
texture_compression_bc
occlusion_query_precise
pipeline_statistics_query
vertex_pipeline_stores_and_atomics
fragment_stores_and_atomics
shader_tessellation_and_geometry_point_size
shader_image_gather_extended
shader_storage_image_extended_formats
shader_storage_image_multisample
shader_storage_image_read_without_format
shader_storage_image_write_without_format
shader_uniform_buffer_array_dynamic_indexing
shader_sampled_image_array_dynamic_indexing
shader_storage_buffer_array_dynamic_indexing
shader_storage_image_array_dynamic_indexing
shader_clip_distance
shader_cull_distance
shader_float64
shader_int64
shader_int16
shader_resource_residency
shader_resource_min_lod
sparse_binding
sparse_residency_buffer
sparse_residency_image2_d
sparse_residency_image3_d
sparse_residency2_samples
sparse_residency4_samples
sparse_residency8_samples
sparse_residency16_samples
sparse_residency_aliased
variable_multisample_rate
inherited_queries

# Extensions
KHR_16bit_storage
KHR_8bit_storage
KHR_acceleration_structure
KHR_bind_memory2
KHR_buffer_device_address
KHR_calibrated_timestamps
KHR_compute_shader_derivatives
KHR_cooperative_matrix
KHR_copy_commands2
KHR_create_renderpass2
KHR_dedicated_allocation
KHR_deferred_host_operations
KHR_depth_stencil_resolve
KHR_descriptor_update_template
KHR_device_group
KHR_draw_indirect_count
KHR_driver_properties
KHR_dynamic_rendering
KHR_dynamic_rendering_local_read
KHR_external_fence
KHR_external_fence_win32
KHR_external_memory
KHR_external_memory_win32
KHR_external_semaphore
KHR_external_semaphore_win32
KHR_format_feature_flags2
KHR_fragment_shader_barycentric
KHR_fragment_shading_rate
KHR_get_memory_requirements2
KHR_global_priority
KHR_image_format_list
KHR_imageless_framebuffer
KHR_index_type_uint8
KHR_line_rasterization
KHR_load_store_op_none
KHR_maintenance1
KHR_maintenance2
KHR_maintenance3
KHR_maintenance4
KHR_maintenance5
KHR_maintenance6
KHR_maintenance7
KHR_map_memory2
KHR_multiview
KHR_pipeline_binary
KHR_pipeline_executable_properties
KHR_pipeline_library
KHR_present_id
KHR_present_wait
KHR_push_descriptor
KHR_ray_query
KHR_ray_tracing_maintenance1
KHR_ray_tracing_pipeline
KHR_ray_tracing_position_fetch
KHR_relaxed_block_layout
KHR_sampler_mirror_clamp_to_edge
KHR_sampler_ycbcr_conversion
KHR_separate_depth_stencil_layouts
KHR_shader_atomic_int64
KHR_shader_clock
KHR_shader_draw_parameters
KHR_shader_expect_assume
KHR_shader_float16_int8
KHR_shader_float_controls
KHR_shader_float_controls2
KHR_shader_integer_dot_product
KHR_shader_maximal_reconvergence
KHR_shader_non_semantic_info
KHR_shader_quad_control
KHR_shader_relaxed_extended_instruction
KHR_shader_subgroup_extended_types
KHR_shader_subgroup_rotate
KHR_shader_subgroup_uniform_control_flow
KHR_shader_terminate_invocation
KHR_spirv_1_4
KHR_storage_buffer_storage_class
KHR_swapchain
KHR_swapchain_mutable_format
KHR_synchronization2
KHR_timeline_semaphore
KHR_uniform_buffer_standard_layout
KHR_variable_pointers
KHR_vertex_attribute_divisor
KHR_video_decode_av1
KHR_video_decode_h264
KHR_video_decode_h265
KHR_video_decode_queue
KHR_video_encode_h264
KHR_video_encode_h265
KHR_video_encode_quantization_map
KHR_video_encode_queue
KHR_video_maintenance1
KHR_video_maintenance2
KHR_video_queue
KHR_vulkan_memory_model
KHR_win32_keyed_mutex
KHR_workgroup_memory_explicit_layout
KHR_zero_initialize_workgroup_memory
EXT_4444_formats
EXT_attachment_feedback_loop_dynamic_state
EXT_attachment_feedback_loop_layout
EXT_blend_operation_advanced
EXT_border_color_swizzle
EXT_buffer_device_address
EXT_calibrated_timestamps
EXT_color_write_enable
EXT_conditional_rendering
EXT_conservative_rasterization
EXT_custom_border_color
EXT_depth_bias_control
EXT_depth_clamp_control
EXT_depth_clamp_zero_one
EXT_depth_clip_control
EXT_depth_clip_enable
EXT_depth_range_unrestricted
EXT_descriptor_buffer
EXT_descriptor_indexing
EXT_device_address_binding_report
EXT_device_fault
EXT_device_generated_commands
EXT_discard_rectangles
EXT_dynamic_rendering_unused_attachments
EXT_extended_dynamic_state
EXT_extended_dynamic_state2
EXT_extended_dynamic_state3
EXT_external_memory_host
EXT_fragment_shader_interlock
EXT_full_screen_exclusive
EXT_global_priority
EXT_global_priority_query
EXT_graphics_pipeline_library
EXT_hdr_metadata
EXT_host_image_copy
EXT_host_query_reset
EXT_image_2d_view_of_3d
EXT_image_robustness
EXT_image_sliced_view_of_3d
EXT_image_view_min_lod
EXT_index_type_uint8
EXT_inline_uniform_block
EXT_legacy_vertex_attributes
EXT_line_rasterization
EXT_load_store_op_none
EXT_memory_budget
EXT_memory_priority
EXT_mesh_shader
EXT_multi_draw
EXT_mutable_descriptor_type
EXT_nested_command_buffer
EXT_non_seamless_cube_map
EXT_opacity_micromap
EXT_pageable_device_local_memory
EXT_pci_bus_info
EXT_pipeline_creation_cache_control
EXT_pipeline_creation_feedback
EXT_pipeline_library_group_handles
EXT_pipeline_robustness
EXT_post_depth_coverage
EXT_present_mode_fifo_latest_ready
EXT_primitive_topology_list_restart
EXT_primitives_generated_query
EXT_private_data
EXT_provoking_vertex
EXT_queue_family_foreign
EXT_robustness2
EXT_sample_locations
EXT_sampler_filter_minmax
EXT_scalar_block_layout
EXT_separate_stencil_usage
EXT_shader_atomic_float
EXT_shader_demote_to_helper_invocation
EXT_shader_image_atomic_int64
EXT_shader_module_identifier
EXT_shader_object
EXT_shader_replicated_composites
EXT_shader_subgroup_ballot
EXT_shader_subgroup_vote
EXT_shader_viewport_index_layer
EXT_subgroup_size_control
EXT_swapchain_maintenance1
EXT_texel_buffer_alignment
EXT_tooling_info
EXT_transform_feedback
EXT_vertex_attribute_divisor
EXT_vertex_attribute_robustness
EXT_vertex_input_dynamic_state
EXT_ycbcr_2plane_444_formats
EXT_ycbcr_image_arrays
NV_acquire_winrt_display
NV_clip_space_w_scaling
NV_cluster_acceleration_structure
NV_compute_shader_derivatives
NV_cooperative_matrix
NV_cooperative_matrix2
NV_cooperative_vector
NV_copy_memory_indirect
NV_corner_sampled_image
NV_coverage_reduction_mode
NV_cuda_kernel_launch
NV_dedicated_allocation
NV_dedicated_allocation_image_aliasing
NV_descriptor_pool_overallocation
NV_device_diagnostic_checkpoints
NV_device_diagnostics_config
NV_device_generated_commands
NV_device_generated_commands_compute
NV_disk_cache_utils
NV_external_compute_queue
NV_external_memory
NV_external_memory_win32
NV_fill_rectangle
NV_fragment_coverage_to_color
NV_fragment_shader_barycentric
NV_fragment_shading_rate_enums
NV_framebuffer_mixed_samples
NV_geometry_shader_passthrough
NV_inherited_viewport_scissor
NV_internal_nvpresent
NV_linear_color_attachment
NV_low_latency
NV_low_latency2
NV_memory_decompression
NV_mesh_shader
NV_optical_flow
NV_partitioned_acceleration_structure
NV_present_metering
NV_raw_access_chains
NV_ray_tracing
NV_ray_tracing_invocation_reorder
NV_ray_tracing_motion_blur
NV_representative_fragment_test
NV_sample_mask_override_coverage
NV_scissor_exclusive
NV_shader_atomic_float16_vector
NV_shader_image_footprint
NV_shader_sm_builtins
NV_shader_subgroup_partitioned
NV_shading_rate_image
NV_viewport_array2
NV_viewport_swizzle
NV_win32_keyed_mutex
NVX_binary_import
NVX_image_view_handle
NVX_multiview_per_view_attributes
AMD_buffer_marker
GOOGLE_hlsl_functionality1
GOOGLE_user_type
```
# GTX 1060
``` powershell
# Image
max_image_dimension1_d: 32768
max_image_dimension2_d: 32768
max_image_dimension3_d: 16384
max_image_dimension_cube: 32768
max_image_array_layers: 2048
max_texel_buffer_elements: 134217728 (128 Mega Pixels (1024))

# Buffer
max_uniform_buffer_range: 65536
max_push_constants_size: 256
max_bound_descriptor_sets: 32
max_fragment_output_attachments: 8

# Compute
max_compute_shared_memory_size: 49152, (48 kiB)
max_compute_work_group_count: (2147483647, 65535, 65535)
max_compute_work_group_invocations: 1536
max_compute_work_group_size: (1536, 1024, 64)

# Alignment
buffer_image_granularity: 1024
min_memory_map_alignment: 64
min_uniform_buffer_offset_alignment: 256
min_storage_buffer_offset_alignment: 16

# Memory
Heap[0]: 2965 MiB # GPU
Heap[1]: 4056 MiB # CPU
Heap[2]: 214  MiB # CPU/GPU
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
KHR_swapchain
KHR_draw_indirect_count
KHR_multiview
KHR_dynamic_rendering
KHR_shader_float16_int8
KHR_shader_integer_dot_product
KHR_external_memory[_win32] (CUDA shared memory)
KHR_spirv_1_4
KHR_video_[en/de]code_h26[4/5]
KHR_video_queue
KHR_zero_initialize_workgroup_memory
KHR_buffer_device_address
KHR_index_type_uint8
KHR_line_rasterization
KHR_pipeline_library
KHR_shader_atomic_int64
KHR_pipeline_executable_properties
KHR_depth_stencil_resolve
KHR_descriptor_update_template
KHR_shader_clock (debug clock cycles)
EXT_transform_feedback
EXT_multi_draw
EXT_primitive_topology_list_restart
EXT_conditional_rendering
EXT_conservative_rasterization
EXT_pipeline_creation_cache_control
EXT_shader_module_identifier
```
