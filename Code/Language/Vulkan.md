``` python
# ---------- Init ----------
entry = create_entry()
entry.create_instance(extensions, validation_layers)

physical_devices = instance.enumerate_physical_devices()
physical_device = physical_devices.select_physical_device(|pd| 
    based_on(pd.props pd.features, pd.mem_props, pd.extensions, pd.queue_family_props)
)

# ---------- Queue ----------
queue_family_index = physical_device.find_graphics_queue_family(instance)
queue_create_info = .QueueCreateInfo(queue_family_index, queue_count, queue_priorities)

device = instance.create_device([queue_create_info], enabled_extensions)

graphics_queue = device.get_device_queue(queue_family_index, queue_index);

# ---------- Window / Surface / Swapchain ----------
window = create_window(size, title) # 

surface_desc = .Win32SurfaceCreateInfoKHR(window.hwnd, window.hinstance);
win32_surface_instance = win32_surface::Instance::new(entry, instance);
win32_surface_instance.create_win32_surface(&surface_desc, allocation_callbacks)

# VkWin32SurfaceCreateInfoKHR(hwnd, hinstance)
surface = .create_surface(entry, instance, window.handle) 

surface_caps = physical_device.surface_capabilities(surface)
surface_format = physical_device.pick_surface_format(surface)
# MAILBOX, FIFO, FIFO_RELAXED, IMMEDIATE
present_mode = physical_device.pick_present_mode(surface)

swapchain_create_info = .SwapchainCreateInfo(surface, min_image_count, 
    image_format, image_colorspace, image_extent, image_usage, image_array_layers
    image_sharing_mode, pre_transform, composite_alpha, present_mode, clipped)
swapchain = swapchain_device.create_swapchain(swapchain_create_info)

swapchain_images = swapchain_device.get_swapchain_images(swapchain);

image_views = [device.create_image_view(img, VIEW_TYPE_2D, surface_format, 
    components, subresource_range) for img in swapchain_images]

# ---------- Render Pass ----------
color_attachment = .AttachmentDescription(format: surface_format, samples: 1, 
    load_op: CLEAR, store_op: STORE, initial_layout: UNDEFINED)
color_attachment_ref = .AttachmentReference(attachment: 0, layout: COLOR_ATTACHMENT_OPTIMAL)

subpass = .SubpassDescription(pipeline_bind_point: GRAPHICS, color_attachments: [color_attachment_ref],
    depth_attachment: None, resolve_attachments: [], input_attachments: [], preserve_attachments: [])

render_pass_info = .RenderPassCreateInfo(attachments: [color_attachment], 
    subpasses: [subpass], subpass_dependencies: None)
render_pass = device.create_render_pass(render_pass_info)

framebuffers = [
    device.create_framebuffer(render_pass, attachments: [img_view], width, height, layers: 1) 
        for img_view in image_views
]

cmd_pool = device.create_command_pool(queue_family_index, flags: RESET_COMMAND_BUFFER)
cmd_alloc_info = .CommandBufferAllocateInfo(cmd_pool, PRIMARY, count: len(framebuffers))
cmd_bufs = device.allocate_command_buffers(cmd_alloc_info)

# ---------- Recording ----------
cmd = cmd_bufs[i]
device.begin_command_buffer(cmd)

render_pass_begin_info = .RenderPassBeginInfo(render_pass, framebuffers[i], render_area, clear_values)
device.cmd_begin_render_pass(cmd, render_pass_begin_info, subpass_contents: INLINE)

device.cmd_bind_pipeline(cmd, PipelineBindPoint::GRAPHICS, pipeline)
device.cmd_draw(cmd, vertices: 3, instances: 1, 0, 0)

device.cmd_end_render_pass(cmd)
device.end_command_buffer(cmd)

# ---------- Sync ----------
image_available = device.create_semaphore();
render_finished = device.create_semaphore();
in_flight_fence = device.create_fence(flags: SIGNALED);

# ---------- Main Loop ----------
loop {
    device.wait_for_fences([in_flight_fence], True, u64::MAX);
    device.reset_fences([in_flight_fence]);

    (img_idx, _) = swapchain_device.acquire_next_image(
        swapchain,
        u64::MAX,
        image_available,
        Fence::null(),
    );

    submit_info = .SubmitInfo {
        wait_semaphores: [image_available],
        wait_dst_stage_mask: [COLOR_ATTACHMENT_OUTPUT],
        command_buffers: [cmd_buffers[img_idx]],
        signal_semaphores: [render_finished]
    };
    device.queue_submit(graphics_queue, [submit_info], in_flight_fence);

    present_info = .PresentInfoKHR {
        wait_semaphores: [render_finished],
        swapchains: [swapchain],
        image_indices: [img_idx]
    };
    swapchain_device.queue_present(graphics_queue, present_info);
}
```
### Concepts
###### entry
loads vulkan functions `from dll usually`
##### instance
specifies vulkan extensions and validation layers to use
used to create vulkan objects `physical_device, swapchain_device, surface_instance, debug_utils_instance...`
used to query `physical_device` properties, features...
##### physical_device
has `properties, features, memory_properties, queue_family_properties, device_extension_properties`
used to create `logical_device`
##### logical_device
executes gpu commands
has `queues` for execution
##### queue_family
queue with different properties/counts `x16 graphics | compute | present, x4 compute, x2 transfer...`
##### queue
actual queues created from `queue_family` that can queue gpu commands via `command_buffer`
##### command_buffer
contains gpu command list, executed using `queue`
assuming `queue` supports type of command to execute `graphics, compute`
##### attachment_description
- `format: surface_format` format attachment uses
- `samples: TYPE_1` sample count
- `load_op: CLEAR` attachment should be cleared before beggining subpass
- `store_op: STORE` attachment should be stored after ending subpass
- `stencil_load_op, stencil_store_op` ignored if color attachment
- `initial_layout: UNDEFINED` attachment should be in this layout before beggining render pass
- `final_layout: COLOR_ATTACHMENT_OPTIMAL` attachment is transitioned to this layout when render pass ends
##### attachment_reference
describes how subpass uses attachments
- `attachment: 0` index inside `render_pass_create_info.attachments` 
- `layout: COLOR_ATTACHMENT_OPTIMAL` layout used during subpass
##### subpass
- `pipeline_bind_point: GRAPHICS`
- `color_attachments, depth_attachment`
- `resolve_attachments` for resolving multisample attachments to singlesample anti-aliased attachments
- `preserve_attachments`
- `dependencies: VkSubpassDependency`
##### subpass dependency
- `src_subpass: VK_SUBPASS_EXTERNAL` subpass with resource
- `dst_subpass: 0` dependent subpass
- `src_stage_mask: PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT`
- `dst_stage_mask: PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT`
- `src_access_mask`
- `dst_access_mask: COLOR_ATTACHMENT_WRITE` how subpass uses depended resource
- `dependency_flags: BY_REGION`
##### render_pass
- `attachments` owned attachments, indexed by subpasses
- `subpasses`
- `dependencies` betwen subpasses
##### framebuffer
- `render_pass`
- `attachments` image views
- `width, height, layers`
##### render_pass_begin
- `renderPass`
- `framebuffer`
- `render_area: {(0, 0), extent}`
- `clear_values` how each render pass attachment clears
##### surface
surface to draw to. has supported formats `B8G8R8A8_UNORM...`
- `window_handle: HWND, HINSTANCE # on windows`
- `display_handle: () # on windows` 
##### swapchain
- `surface`
- `min_image_count`
- `image_color_space`
- `image_format`
- `image_extent: (width, height)`
- `image_array_layers: 1`
- `image_usage: COLOR | DESTINATION`
- `image_sharing_mode: EXCLUSIVE`
- `pre_transform: IDENTITY`
- `composite_alpha: OPAQUE` ignores image alpha as `1`
    - `PRE_MULTIPLIED` non-alpha image pixels are expected to already be multiplied by alpha in the app
    - `POST_MULTIPLIED` image pixels with alpha are multiplied by alpha by the compositer `commonly used`
    - `INHERIT` composite_alpha is set by the app using native window system `Win32 API`,
                         if set vulkan uses it, otherwise it uses platform-specific default
##### present
presents specific swapchain image index to graphics queue that supports presenting
`can present multiple swapchains at once`
- `wait_semaphores: [render_finished]`
- `swapchains: [swapchain]`
- `image_indices: [img_idx]`
`swapchain_instance.queue_present(graphics_queue, present_info)`
### [[Vulkan Synchronization]]
### [[Vulkan Primitive Types]]
