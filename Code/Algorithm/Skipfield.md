Traverse contiguous data efficiently skipping removed elements
``` rust
#[derive(Debug)]
struct Skipfield {
    skipfield: Box<[usize]>,
}

impl Skipfield {
    fn new(size: usize) -> Self {
        Self {
            skipfield: unsafe { Box::new_zeroed_slice(size).assume_init() },
        }
    }

    fn remove(&mut self, idx: usize) {
        let mut block_start_idx = idx;
        let mut block_end_idx = idx;
        let mut block_size = 1;
        // left is erased block
        if idx > 0 {
            let left_skip = self.skipfield[idx - 1];
            if left_skip > 0 {
                block_start_idx = idx - left_skip;
                block_size += left_skip;
            }
        }
        // right is erased block
        if idx + 1 < self.skipfield.len() {
            let right_skip = self.skipfield[idx + 1];
            if right_skip > 0 {
                block_end_idx = idx + right_skip;
                block_size += right_skip;
            }
        }
        self.skipfield[block_start_idx] = block_size;
        self.skipfield[block_end_idx] = block_size;
    }
}
```
