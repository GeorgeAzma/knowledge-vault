### Setup
- `cargo add wgpu`
- `cargo add winit`
- `cargo add pollster` to keep main() non-async
- Create event loop `winit::EventLoop::new().unwrap()`
- Create window `winit::WindowBuilder::new().build(&event_loop).unwrap()`
- Create wgpu instance (specifying which backends to use (e.g. Vulkan, OpenGL))
- Create an adapter which will be used to choose GPU based on power preference
- Create a device and a command queue, specify features and limits
- Get surface capabilities using adapter
- Create a surface with width, height, Vsync options, format, alpha, srgb view
- Create a shader module
- Create a render pipeline layout, with bind group layouts and puch constant ranges
- Create a render pipeline, specify vertex shader, fragment shader, primitive state (e.g. topology, cull mode etc.), depth-stencil, multisample, multiview
- Run event loop, handle events
- Handle resize by resizing surface and doing surface.configure() after
- Request a redraw on Event::AboutToWait
- Update/Render in WindowEvent::RedrawRequested
	- Get current surface texture and create a view from it
	- Create a command encoder
	- Create a render pass using an encoder, specify view, resolve target, load/store ops, depth-stencil attachment
	- Set render pipeline for the render pass
	- Draw
	- Finish encoding commands and submit them as a command buffer
	- Present current surface texture
