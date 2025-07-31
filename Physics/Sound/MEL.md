Measures human perceived frequency distance between sounds
`Stands for Melody`
### Approx Formula $2595\log_{10}(1+\large\frac{x}{700}\small)$
![[MEL.webp|700]]

``` rust
pub fn mel(f: f32) -> f32 {
    2595.0 * (1.0 + FREQ as f32 / 700.0).log10()
}
pub fn inv_mel(m: f32) -> f32 {
    700.0 * 10f32.powf(m / 2595.0 - 1.0)
}
```
