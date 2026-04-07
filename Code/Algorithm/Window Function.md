Used in [[Fourier Transform]] to weight samples to avoid discontinuous edges

Good general window function is [[Hann Window]]
### Normalization
Applying window function to samples causes signal strength decrease
``` rust
// constant overlapp add (constant hop size)
fn cola_normalization(window: &[f32], hop_size: usize) -> Vec<f32> {
    let n = window.len();
    let mut norm = vec![0.0f32; n];
    let num_overlaps = (n + hop_size - 1) / hop_size;
    for k in 0..num_overlaps {
        let offset = k * hop_size;
        for i in 0..n {
            let j = (i + offset) % n;
            norm[i] += window[j] * window[j];
        }
    }

    norm
}

/// For windows that satisfy COLA (like Hann with hop = N/4),
/// the normalization is a constant. This returns that scalar.
fn cola_normalization_scalar(window: &[f32], hop_size: usize) -> f32 {
    let norm = cola_normalization(window, hop_size);
    norm.iter().sum::<f32>() / norm.len() as f32
}

window_norm = cola_normalization_scalar(window, hop_size);
window /= window_norm.sqrt();
```