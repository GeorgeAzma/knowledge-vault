``` rust
struct RingBuffer {
    buf: Vec<f32>,
    head: usize,
}

impl RingBuffer {
    fn new(capacity: usize) -> Self {
        RingBuffer {
            buf: vec![0.0; capacity],
            head: 0,
        }
    }

    fn push(&mut self, sample: f32) {
        self.buf[self.head] = sample;
        self.head = (self.head + 1) % self.buf.len();
    }

    fn extend(&mut self, samples: &[f32]) {
        let len = self.buf.len();
        let n = samples.len();

        // If samples are larger than buffer, only keep the last `len` samples
        let samples = if n > len {
            &samples[n - len..]
        } else {
            samples
        };
        let n = samples.len();

        // How many samples can we write before hitting end of buffer
        let first_part = (len - self.head).min(n);
        let second_part = n - first_part;

        // Copy first contiguous chunk
        self.buf[self.head..self.head + first_part].copy_from_slice(&samples[..first_part]);

        // Copy second chunk if wrapping around
        if second_part > 0 {
            self.buf[..second_part].copy_from_slice(&samples[first_part..]);
        }

        self.head = (self.head + n) % len;
    }

    // Get a contiguous slice for FFT (oldest -> newest)
    fn as_contiguous(&self) -> Vec<f32> {
        let mut out = Vec::with_capacity(self.buf.len());
        out.extend_from_slice(&self.buf[self.head..]);
        out.extend_from_slice(&self.buf[..self.head]);
        out
    }
}
```