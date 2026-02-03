### [[Vulkan]] Comparison

| DirectX                              | Vulkan                                                        |
| ------------------------------------ | ------------------------------------------------------------- |
| `IDXGIAdapter`                       | `VkPhysicalDevice`                                            |
| `ID3D12Device`                       | `VkDevice`                                                    |
| `D3D_FEATURE_LEVEL`                  | `VkPhysicalDeviceFeatures`                                    |
| `IDXGISwapChain`                     | `VkSwapchainKHR`                                              |
| `SwapEffect: FLIP_DISCARD`           | `VK_PRESENT_MODE_FIFO_KHR`                                    |
| `ID3D12CommandQueue`                 | `VkQueue`                                                     |
| `D3D12_COMMAND_LIST_TYPE_DIRECT`     | `VK_QUEUE_GRAPHICS_BIT`                                       |
| `ID3D12CommandAllocator`             | `VkCommandPool`                                               |
| `ID3D12GraphicsCommandList`          | `VkCommandBuffer`                                             |
| `ExecuteCommandLists`                | `vkQueueSubmit`                                               |
| `WaitForSingleObject`                | `vkWaitForFences`                                             |
| `Signal`                             | `vkQueueSubmit(fence)`                                        |
| `ID3D12DescriptorHeap`               | `VkDescriptorPool`                                            |
| `CBV/SRV/UAV`                        | `VkDescriptorSet`                                             |
| `CPU/GPU handle`                     | `VkDescriptorSet`                                             |
| `ID3D12RootSignature`                | `VkPipelineLayout`                                            |
| `ID3D12PipelineState`                | `VkPipeline`                                                  |
| `D3D12_GRAPHICS_PIPELINE_STATE_DESC` | `VkGraphicsPipelineCreateInfo`                                |
| `D3D12_SHADER_BYTECODE`              | `VkShaderModule`                                              |
| `RenderTargetFormats`                | `VkPipelineColorBlendStateCreateInfo`<br>+ framebuffer format |
| `ID3D12Resource`                     | `VkBuffer`/`VkImage`                                          |
| `D3D12_HEAP_TYPE_DEFAULT`            | `VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT`                         |
| `D3D12_HEAP_TYPE_UPLOAD`             | `VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT`                         |
| `VertexBufferView`                   | `VkBuffer`+`VkVertexInputBindingDescription`                  |
| `IndexBufferView`                    | `VkBuffer`+`VkIndexType`                                      |
| `RenderTargetView`                   | `VkFramebuffer`+`VkImageView`                                 |
| `DepthStencilView`                   | `VkFramebuffer`+ depth attachment                             |
| `ClearRenderTargetView`              | `vkCmdClearAttachments`                                       |
| `ResourceBarrier`                    | `vkCmdPipelineBarrier`                                        |
| `D3D12_RESOURCE_STATE_RENDER_TARGET` | `VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL`                    |
| `D3D12_RESOURCE_STATE_PRESENT`       | `VK_IMAGE_LAYOUT_PRESENT_SRC_KHR`                             |

### Example
``` toml
windows = { version = "0.62.2", features = [
        "Win32_Foundation",
        "Win32_Graphics_Direct3D",
        "Win32_Graphics_Direct3D_Fxc",
        "Win32_Graphics_Direct3D12",
        "Win32_Graphics_Dxgi",
        "Win32_Graphics_Dxgi_Common",
        "Win32_UI",
        "Win32_UI_WindowsAndMessaging",
        "Win32_UI_Input",
        "Win32_UI_Input_KeyboardAndMouse",
        "Win32_System_Com",
        "Win32_System_Threading",
        "Win32_System_LibraryLoader",
        "Win32_System_Com_StructuredStorage",
        "Win32_System_Variant",
        "Win32_Security",
    ] 
}
```

``` rust
use windows::{
    Win32::{
        Foundation::{HINSTANCE, HWND, LPARAM, LRESULT, WPARAM},
        Graphics::{
            Direct3D::Fxc::D3DCompile, Direct3D::*, Direct3D12::*, Dxgi::Common::*, Dxgi::*,
        },
        System::{
            Com::*,
            LibraryLoader::*,
            Threading::{CreateEventW, INFINITE, Sleep, WaitForSingleObject},
        },
        UI::{Input::KeyboardAndMouse::*, WindowsAndMessaging::*},
    },
    core::*,
};

fn create_device() -> ResultAny<ID3D12Device> {
    let mut device: Option<ID3D12Device> = None;

    unsafe {
        let mut debug: Option<ID3D12Debug> = None;
        D3D12GetDebugInterface(&mut debug)?;
        debug.unwrap().EnableDebugLayer();

        D3D12CreateDevice(None, D3D_FEATURE_LEVEL_12_0, &mut device)
            .expect("D3D12CreateDevice failed")
    };

    Ok(device.unwrap())
}


fn create_cmd_queue(device: &ID3D12Device) -> ResultAny<ID3D12CommandQueue> {
    let desc = D3D12_COMMAND_QUEUE_DESC {
        Type: D3D12_COMMAND_LIST_TYPE_DIRECT, // DIRECT = Graphics
        Priority: D3D12_COMMAND_QUEUE_PRIORITY_NORMAL.0 as i32,
        Flags: D3D12_COMMAND_QUEUE_FLAG_NONE,
        NodeMask: 0,
    };

    unsafe { Ok(device.CreateCommandQueue(&desc)?) }
}


fn create_swapchain(hwnd: HWND, queue: &ID3D12CommandQueue, width: u32, height: u32) -> ResultAny<IDXGISwapChain3> {
    let factory: IDXGIFactory4 = unsafe { CreateDXGIFactory1()? };
    let desc = DXGI_SWAP_CHAIN_DESC1 {
        Width: width,
        Height: height,
        Format: DXGI_FORMAT_R8G8B8A8_UNORM,
        BufferCount: 2,
        BufferUsage: DXGI_USAGE_RENDER_TARGET_OUTPUT,
        SwapEffect: DXGI_SWAP_EFFECT_FLIP_DISCARD,
        SampleDesc: DXGI_SAMPLE_DESC {
            Count: 1,
            Quality: 0,
        },
        ..Default::default()
    };
    let sc1 = unsafe { factory.CreateSwapChainForHwnd(queue, hwnd, &desc, None, None)? };
    Ok(sc1.cast()?)
}

fn compile_shader(source: &str, entry: &str, target: &str) -> ResultAny<ID3DBlob> {
    use windows::core::PCSTR;

    let mut blob = None;
    let mut err = None;

    unsafe {
        D3DCompile(
            source.as_ptr() as *const _,
            source.len(),
            None,
            None,
            None,
            PCSTR(entry.as_ptr()),
            PCSTR(target.as_ptr()),
            0, // D3DCOMPILE_DEBUG, D3DCOMPILE_OPTIMIZATION_LEVEL3
            0,
            &mut blob,
            Some(&mut err),
        )?
    };

    if let Some(err) = err {
        let err_ptr = unsafe { err.GetBufferPointer() };
        let err_size = unsafe { err.GetBufferSize() };
        let err_msg = unsafe {
            std::str::from_utf8(std::slice::from_raw_parts(err_ptr as *const u8, err_size))
                .unwrap_or("Failed to decode error message")
        };
        eprintln!("Shader compilation error: {}", err_msg);
        Err(err_msg.into())
    } else {
        Ok(blob.unwrap())
    }
}
```