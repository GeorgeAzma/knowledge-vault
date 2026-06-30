### Setup
``` c
// 1. Enable Features
vk::PhysicalDeviceRayTracingPipelineFeaturesKHR::default().ray_tracing_pipeline(true);
vk::PhysicalDeviceAccelerationStructureFeaturesKHR::default().acceleration_structure(true);
vk::PhysicalDeviceBufferDeviceAddressFeatures::default().buffer_device_address(true);

vk::PhysicalDeviceFeatures2::default()
    .push_next(&mut ray_tracing_pipeline_features)
    .push_next(&mut acceleration_structure_features)
    .push_next(&mut buffer_device_address_features);

// 2. Enable Extensions
let enabled_device_extensions = [
    ash::khr::deferred_host_operations::NAME.as_ptr(),
    ash::khr::acceleration_structure::NAME.as_ptr(),
    ash::khr::ray_tracing_pipeline::NAME.as_ptr(),
    // ash::khr::ray_query::NAME.as_ptr(),
];

// 3. Create Devices
let accel = ash::khr::acceleration_structure::Device::new(
    &device.physical_device().vulkan().instance,
    &device.device,
);
let rt_pipeline = ash::khr::ray_tracing_pipeline::Device::new(
    &device.physical_device().vulkan().instance,
    &device.device,
);
```
### BLAS
`Bottom Level Acceleration Structure`
- holds mesh geometry data `triangles (usually static)`
``` c
// 1. Setup Vertices & Indices
struct Vertex {
    position: [f32; 3],
}
let vertices = [
    Vertex { position: [-1.0, -1.0, 0.0] },
    Vertex { position: [1.0, -1.0, 0.0] },
    Vertex { position: [0.0, 1.0, 0.0] },
];
let indices = [0, 1, 2];

// 2. Create Vertex & Index Buffer
let index_buffer = device.create_buffer(
    data: &vertices
    usage_flags: SHADER_DEVICE_ADDRESS | ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY_KHR
);
let vertex_buffer = device.create_buffer(
    data: &indices
    usage_flags: SHADER_DEVICE_ADDRESS | ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY_KHR
);

// 3. Get Vertex & Index Buffer Device Address
device.get_buffer_device_address(&vk::BufferDeviceAddressInfo::default().buffer(rt_vertex_buffer.handle()));
device.get_buffer_device_address(&vk::BufferDeviceAddressInfo::default().buffer(rt_index_buffer.handle()));

// 4. Create Triangle Geometry Data For Bottom Level Acceleration Structure
let triangles = vk::AccelerationStructureGeometryTrianglesDataKHR::default()
    .vertex_format(vk::Format::R32G32B32_SFLOAT)
    .vertex_data(vk::DeviceOrHostAddressConstKHR {
        device_address: vertex_buffer_address,
    })
    .vertex_stride(size_of::<Vertex>() as u64)
    .max_vertex(vertices.len() as u32 - 1) // max vertex index, or vertex count - 1 if not using index buffer
    .index_type(vk::IndexType::UINT32)
    .index_data(vk::DeviceOrHostAddressConstKHR {
        device_address: index_buffer_address,
    });
    
let geometry = vk::AccelerationStructureGeometryKHR::default()
    .geometry_type(vk::GeometryTypeKHR::TRIANGLES)
    .geometry(vk::AccelerationStructureGeometryDataKHR { triangles })
    .flags(vk::GeometryFlagsKHR::OPAQUE);

// 5. Build BLAS Geometry
let mut build_geometry = vk::AccelerationStructureBuildGeometryInfoKHR::default()
    .ty(vk::AccelerationStructureTypeKHR::BOTTOM_LEVEL)
    .mode(vk::BuildAccelerationStructureModeKHR::BUILD)
    .geometries(std::slice::from_ref(&geometry))
    .flags(vk::BuildAccelerationStructureFlagsKHR::PREFER_FAST_TRACE);

// 5.1. Query BLAS Size (for buffer allocation)
let mut size_info = vk::AccelerationStructureBuildSizesInfoKHR::default();
unsafe {
    accel.get_acceleration_structure_build_sizes(
        vk::AccelerationStructureBuildTypeKHR::DEVICE,
        &build_geometry,
        &[1],
        &mut size_info,
    )
}; // returns: size_info.acceleration_structure_size, size_info.build_scratch_size

// 5.2 Create BLAS Buffer & Scratch Buffer
let blas_buffer = device.create_buffer(
    size: size_info.acceleration_structure_size,
    usage: SHADER_DEVICE_ADDRESS | ACCELERATION_STRUCTURE_STORAGE_KHR
);

let scratch_buffer = device.create_buffer(
    size: size_info.build_scratch_size,
    usage: SHADER_DEVICE_ADDRESS | STORAGE_BUFFER
);
let scratch_buffer_address = device.get_buffer_device_address(&vk::BufferDeviceAddressInfo::default().buffer(scratch_buffer));
build_geometry.scratch_data = vk::DeviceOrHostAddressKHR { device_address: scratch_buffer_address };

// 6. Create BLAS
let blas = accel.create_acceleration_structure(
    &vk::AccelerationStructureCreateInfoKHR::default()
        .ty(vk::AccelerationStructureTypeKHR::BOTTOM_LEVEL)
        .buffer(blas_buffer)
        .size(size_info.acceleration_structure_size),
    allocation_callbacks,
);

// 6.1 Use BLAS for Build Geometry
build_geometry.dst_acceleration_structure = blas;

// 7. Get BLAS Address (used later for TLAS)
let blas_address = accel.get_acceleration_structure_device_address(
    &vk::AccelerationStructureDeviceAddressInfoKHR::default().acceleration_structure(blas),
);

// 8. Build BLAS (With Geometry)
let range = vk::AccelerationStructureBuildRangeInfoKHR {
    primitive_count: 1, // Triangles
    primitive_offset: 0,
    first_vertex: 0,
    transform_offset: 0,
};

cmd.begin();
accel.cmd_build_acceleration_structures(cmd, &[build_geometry], &[&[range]])
// vk::MemoryBarrier2::default()  
//     .src_stage_mask(vk::PipelineStageFlags2::ACCELERATION_STRUCTURE_BUILD_KHR)  
//     .src_access_mask(vk::AccessFlags2::ACCELERATION_STRUCTURE_WRITE_KHR)  
//     .dst_stage_mask(vk::PipelineStageFlags2::ACCELERATION_STRUCTURE_BUILD_KHR)  
//     .dst_access_mask(vk::AccessFlags2::ACCELERATION_STRUCTURE_READ_KHR);
cmd.submit(cmd);
```
### TLAS
`Top Level Acceleration Structure`
- holds instances of the same `Mesh + BLAS` with different transforms
``` c
// 1. Create Instance (will be added to TLAS)
let instance = vk::AccelerationStructureInstanceKHR {
    transform: vk::TransformMatrixKHR {
        matrix: [1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0],
    },
    instance_custom_index_and_mask: vk::Packed24_8::new(0, 0xff),
    instance_shader_binding_table_record_offset_and_flags: vk::Packed24_8::new(0, 0),
    acceleration_structure_reference: vk::AccelerationStructureReferenceKHR {
        device_handle: blas_address,
    },
};
let instances = [instance];

// 2. Create Instance Buffer
let instance_buffer = device.create_buffer(
    data: &instances,
    usage: SHADER_DEVICE_ADDRESS | ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY_KHR,
);
let instance_buffer_address = device.get_buffer_device_address(&vk::BufferDeviceAddressInfo::default().buffer(instance_buffer));

// 3. Create Geometry Instance Data
let instances_data = vk::AccelerationStructureGeometryInstancesDataKHR::default()
    .array_of_pointers(false)
    .data(vk::DeviceOrHostAddressConstKHR {
        device_address: instance_buffer_address,
    });

let geometry = vk::AccelerationStructureGeometryKHR::default()  
    .geometry_type(vk::GeometryTypeKHR::INSTANCES)  
    .geometry(vk::AccelerationStructureGeometryDataKHR { instances: instances_data });

// 4. Build TLAS
let mut build_geometry =
    vk::AccelerationStructureBuildGeometryInfoKHR::default()
        .ty(vk::AccelerationStructureTypeKHR::TOP_LEVEL)
        .mode(vk::BuildAccelerationStructureModeKHR::BUILD)
        .geometries(std::slice::from_ref(&geometry))
        .flags(vk::BuildAccelerationStructureFlagsKHR::PREFER_FAST_TRACE);

// 4.1 Query TLAS Size (for Allocating Buffers)
let mut size_info = vk::AccelerationStructureBuildSizesInfoKHR::default();
accel.get_acceleration_structure_build_sizes(
    vk::AccelerationStructureBuildTypeKHR::DEVICE,
    &build_geometry,
    &[1], // 1 instance
    &mut size_info,
);

// 4.2 Create TLAS Buffer & Scratch Buffer (or reuse scratch buffer from BLAS)
let tlas_buffer = device.create_buffer(
    size: size_info.acceleration_structure_size,
    usage: SHADER_DEVICE_ADDRESS | ACCELERATION_STRUCTURE_STORAGE_KHR
);
let scratch_buffer = device.create_buffer(
    size: size_info.build_scratch_szie,
    usage: SHADER_DEVICE_ADDRESS | STORAGE_BUFFER
);
let scratch_buffer_address = device.get_buffer_device_address(&vk::BufferDeviceAddressInfo::default().buffer(scratch_buffer));
build_geometry.scratch_data = vk::DeviceOrHostAddressKHR { device_address: scratch_buffer_address };

// 5. Create TLAS
let tlas = accel.create_acceleration_structure(  
    &vk::AccelerationStructureCreateInfoKHR::default()  
        .ty(vk::AccelerationStructureTypeKHR::TOP_LEVEL)  
        .buffer(tlas_buffer)  
        .size(size_info.acceleration_structure_size),  
    allocation_callbacks,  
);

// 6. Build TLAS
let range = vk::AccelerationStructureBuildRangeInfoKHR {  
    primitive_count: 1, // instances
    primitive_offset: 0,  
    first_vertex: 0,  
    transform_offset: 0,  
};

cmd.begin()
accel.cmd_build_acceleration_structures(cmd, &[build_geometry], &[&[range]]);
// vk::MemoryBarrier2::default()
//     .src_stage_mask(vk::PipelineStageFlags2::ACCELERATION_STRUCTURE_BUILD_KHR)
//     .src_access_mask(vk::AccessFlags2::ACCELERATION_STRUCTURE_WRITE_KHR)
//     .dst_stage_mask(vk::PipelineStageFlags2::RAY_TRACING_SHADER_KHR)
//     .dst_access_mask(vk::AccessFlags2::SHADER_READ_KHR); // avoids raytracer reading garbage
cmd.submit()
```
