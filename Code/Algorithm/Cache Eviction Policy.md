- **First-In-First-Out (FIFO)** implement via `RingBuffer` or `Queue`
- **Least Recently Used (LRU)** implement via `VecDeque`
  where recently used items get moved to front
  and if it's full `pop_back` to remove LRU item
- **Least Frequently Used (LFU)**
  keep track of usage frequencies, when full remove LFU item
  
  
