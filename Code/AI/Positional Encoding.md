Add's position to [[Word Embedding]][[s]] 
```Rust
fn encode_position(pos: usize, n: usize) -> Vec<f32> {
    let mut encoding = vec![0.0; n];
    let scale = -10000.0.ln() * 2.0 / n as f32;
    for i in (0..n).step_by(2) {
        let x = pos as f32 * (i as f32 * scale).exp();
        let (sin, cos) = x.sin_cos();
        encoding[i + 0] = cos;
        encoding[i + 1] = sin;
    }
    encoding
}
```
You can also train a [[Neural Network]] to generate positional encodings `learned embeddings`
