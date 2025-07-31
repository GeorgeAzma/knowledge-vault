[[Law of Sines]]
[[Law of Cosines]]
### $\cos x=\sum_{n=0}^\infty(-1)^n\frac{x^{2n}}{(2n)!}=\frac{e^{iz}+e^{-iz}}{2}$
### $\sin x=\sum_{n=0}^{\infty}(-1)^n\frac{x^{2n+1}}{(2n+1)!}=\frac{e^{iz}-e^{-iz}}{2i}$
Expressed using [[Maclaurin Series]]
> [!tip]
> - Use 16 for max $n$ for accurate $\sin$ and $\cos$ in range $[-2\pi;2\pi]$
> - Derived from [[Math/Algebra/Constants|Euler's Number]]
> - Complex form derived from [[Complex Number|Euler's Formula]]

``` rust
// slow
for i in 0..64 {
    let t = TAU * i as f32 / 64.0;
    let (s, c) = t.sin_cos();
}
// fast (rotate point)
let (c, s) = (1.0, 0.0);
let (b, a) = (TAU / 64.0).sin_cos();
for i in 0..64 {
    let ns = b * c + a * s;
    let nc = a * c - b * s;
    c = nc;
    s = ns;
}
```
