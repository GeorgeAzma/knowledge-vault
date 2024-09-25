It's a way to add position to the inputs of the [[Neural Network]]
There are many ways to do Positional Encoding, most popular is by using [[Sine and Cosine]]
```Rust
fn encode_position(position: usize, n: usize) -> Vec<f32> {
    let mut encoding = vec![0f32; n];
    let x = std::f32::consts::TAU * position as f32 / n as f32;
    for i in (0..n).step_by(2) {
        let (sin, cos) = ((i / 2 + 1) as f32 * x).sin_cos();
        encoding[i + 0] = cos;
        encoding[i + 1] = sin;
    }
    encoding
}
```
You can also train a [[Neural Network]] to generate positional encodings
