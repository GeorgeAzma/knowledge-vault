### Queue
##### Queue Family
group of queues that have same properties

### Synchronization
##### Wait Idle `gpu -> cpu`
```
queue.wait(); // wait for all queue commands
device.wait(); // wait for all gpu commands
```
##### Fence `gpu_cmds -> cpu`
```
queue.submit([gpu_cmd1])
queue.submit([gpu_cmd2], signal = fence)
fence.wait() // waits for gpu_cmd2 and previous queue submissions (gpu_cmd1)
```
##### Semaphore `gpu_cmds -> gpu_cmds`
- **Binary** can be signaled and waited on
```
queue.sumbit([gpu_cmd1], signal = semaphore)
queue.submit([gpu_cmd2], wait = semaphore) // executes when cmd1 is done 
```
- **Timeline** has integer, each time command is done it increments
  other commands can wait until integer reaches specific value
```
Binary -> schedules tasks in sequential order
Timeline -> pre-schedules lots of future tasks
```
##### Pipeline Barrier `gpu_cmds -> gpu_cmds`
##### Render pass subpass dependencies
like pipeline barrier for subpasses in render pass
##### Events `gpu_cmds -> gpu_cmds`
```
// previous commands
vkCmdSetEvent(cmd, src_stage); // signals event

// commands here free to execute

// wait for previous commands
vkCmdWaitEvents(cmd, dst_stage); // waits for event
```