### $440\text{ hz}\to0\text{ hz}$ in $3$ seconds
- **Wrong** $\cos(2\pi\cdot440\cdot t\cdot(1-t/3))$
- **Correct** $\cos(2\pi\cdot440\cdot t\cdot(1-t/6))$
- **Pitch = [[Derivative]] inside $\cos$** `not whatever comes after 2pi`
##### Calculation
- pitch should be a function of $p(x)=1-t/3$
- pitch = derivative inside $\cos$, so we want derivative to be $f'(x)=p(x)=1-t/3$
- [[Integral|Integrate]] $f(t)=\int f'(t)=t-t^2/6\implies f(t)=t(1-t/6)$
### [[Useful Functions]]
``` rust
pub fn slide(t: f32, f0: f32, f1: f32, d: f32) -> f32 {
    let phase = (f0 + (f1 - f0) * t.min(d)) * t.min(d) / (2.0 * d);
    phase + (t > d) as i32 as f32 * f1 * (t - d)
}
```
