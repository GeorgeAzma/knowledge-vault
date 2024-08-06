``` Rust
fn sstep(e0: f32, e1: f32, mut x: f32) -> f32 {
	x = ((x - e0) / (e1 - e0)).clamp(0.0, 1.0);
	x * x * (3.0 - 2.0 * x)
}
```
### Smootherstep
``` Rust
fn sstep(e0: f32, e1: f32, mut x: f32) -> f32 {
	x = ((x - e0) / (e1 - e0)).clamp(0.0, 1.0);
	x * x * x * (x * (6.0 * x - 15.0) + 10.0)
}
```
