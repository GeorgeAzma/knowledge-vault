$C^1$ continuous $3x^2-2x^3$
``` Rust
fn sstep(e0: f32, e1: f32, mut x: f32) -> f32 {
	x = ((x - e0) / (e1 - e0)).clamp(0.0, 1.0);
	x * x * (3.0 - 2.0 * x)
}
```
##### Quintic Smoothstep `smootherstep`
$C^2$ continuous $6x^5-15x^4+10x^3$
``` Rust
fn sstep(e0: f32, e1: f32, mut x: f32) -> f32 {
	x = clamp((x - e0) / (e1 - e0), 0.0, 1.0);
	x * x * x * (x * (6.0 * x - 15.0) + 10.0)
}
```
##### Septic Smoothstep
$C^3$ continuous $-20x^7+70x^6-84x^5+35x^4$
``` rust
fn sstep(e0: f32, e1: f32, mut x: f32) -> f32 {
	x = clamp((x - e0) / (e1 - e0), 0.0, 1.0);
	x * x * x * x * (x * (x * (70.0 - 20.0 * x) - 84.0) + 35.0)
}
```
##### Cosine Smoothstep
$C^\infty$ continuous
``` rust
fn sstep(e0: f32, e1: f32, mut x: f32) -> f32 {
	x = clamp((x - e0) / (e1 - e0), 0.0, 1.0);
	0.5 - 0.5 * cos(PI * x)
}
```
##### Inverse Smoothstep
``` rust
fn inv_sstep(e0: f32, e1: f32, mut x: f32) -> f32 {
    x = clamp((x - e0) / (e1 - e0), 0.0, 1.0);
    2.0 * x - x * x * (3.0 - 2.0 * x)
}
```
