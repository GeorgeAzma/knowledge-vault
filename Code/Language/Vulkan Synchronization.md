### Synchronization
##### Wait Idle `gpu -> cpu`
``` python
queue.wait() # wait for all queue commands
device.wait() # wait for all gpu commands
```
##### Fence `gpu_cmds -> cpu`
``` python
queue.submit([gpu_cmd1])
queue.submit([gpu_cmd2], signal = fence)
fence.wait() # wait for gpu_cmd2 and prev queue submissions (gpu_cmd1)
```
##### Semaphore `gpu_cmds -> gpu_cmds`
- **Binary** can be signaled and waited on
``` python
queue.sumbit([gpu_cmd1], signal = semaphore)
queue.submit([gpu_cmd2], wait = semaphore) # executes when cmd1 is done 
```
- **Timeline** has integer, each time command is done it increments
  other commands can wait until integer reaches specific value
```
Binary -> schedules tasks in sequential order
Timeline -> pre-schedules lots of future tasks
```
##### Pipeline Barrier `gpu_cmds -> gpu_cmds`
``` python
src_stage: "color_attachment_output" # where ops must complete
src_access_mask: "color_attachment_write" # type of ops that must complete
old_layout: "color_attachment_optimal"
new_layout: "shader_read_only_optimal"
dst_stage: "fragment_shader" # which waits for ops to complete
dst_access_mask: "shader_read" # type of ops that wait for ops to complete
# what it does
wait(src_stage('src_access_mask'))
transition('old_layout', 'new_layout')
dst_stage('dst_access_mask')
```
``` python
# UNDEFINED -> COLOR_ATTACHMENT_OPTIMAL (before begin rendering)
src_access_mask = NONE
src_stage_mask = COLOR_ATTACHMENT_OUTPUT
dst_access_mask = COLOR_ATTACHMENT_WRITE
dst_stage_mask = COLOR_ATTACHMENT_OUTPUT
# COLOR_ATTACHMENT_OPTIMAL -> PRESENT_SRC_KHR (after end rendering)
src_stage = COLOR_ATTACHMENT_OUTPUT
src_access_mask = COLOR_ATTACHMENT_WRITE
dst_stage = BOTTOM_OF_PIPE
dst_access_mask = NONE
# Note: (UNDEFINED -> PRESENT_SRC) wouldn't work because 
# UNDEFINED is a hint that we don't care about prev image contents

# ensure CPU write is visible to GPU
pipeline_barrier(cmd, PIPELINE_STAGE_HOST, PIPELINE_STAGE_TRANSFER)
```
##### Render pass subpass dependencies
like pipeline barrier for subpasses in render pass
##### Events `gpu_cmds -> gpu_cmds`
``` python
vkCmdSetEvent(cmd, src_stage) # prev cmds
# cmds here free to execute
vkCmdWaitEvents(cmd, dst_stage) # wait for prev cmds
```
### Mapped Memory
``` python
# skip for HOST_COHERENT memory

# ensure CPU writes visible to GPU by invalidating CPU cache
# flush when submitting GPU work that depends on CPU memory
vkFlushMappedMemoryRanges(device, 1, &flush_range)

# ensure GPU writes visible to CPU by invalidating GPU cache
# invalidate when doing CPU work that depends on GPU memory
vkInvalidateMappedMemoryRanges(device, 1, &invalidate_range)
```
### Command Buffer
``` python
queue_submit(cmd, SubmitInfo {
    wait_semaphores: [swapchain_img_available]
    wait_dst_stage_masks [COLOR_ATTACHMENT_OUTPUT]
    signal_semaphores: [render_finished]
})
# what it does
render_until_stage(color_attachment_output)
wait(swapchain_img_available)
render_rest()
signal(render_finished)
```
