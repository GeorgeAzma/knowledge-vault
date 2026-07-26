linear transformation of spacetime such that speed of light is conserved

``` c
// only direction parallel to motion is scaled
// perpendicular velocity stays same
vec3 lorentz_boost(vec3 x, float t, vec3 vel) {
    float v = length(vel);
    vec3 n = normalize(vel);

    float beta = v / c; // normalize velocity coordinates
    float gamma = 1.0 / sqrt(1.0 - beta * beta);

    float ct = c * t; // normalize time coordinate

    float x_parallel = dot(x, n);
    
    float ct2 = gamma * (ct - beta * x_parallel);
    float x_parallel2 = gamma * (x_parallel - beta * ct);

    vec3 x2 = x + (x_parallel2 - x_parallel) * n;

    return x2; // also output transformed time separately
}
```
- $\beta=\dfrac{v}{c}$
    - $v$ velocity
    - $c$ [[Light|speed of light]]
### Explanation
rotation preserves $x^2+y^2$, because $\cos^2\theta+\sin^2\theta=1$
while lorentz booost preserves $t^2-x^2$
$\cosh^2\phi-\sinh^2\phi=1$, $\beta=\tanh\phi$, $\gamma=\cosh\phi$
using identity $1-\tanh^2\phi=\dfrac{1}{\cosh^2\phi}$ we get $\gamma=\dfrac{1}{\sqrt{1-\beta^2}}$
### Lorentz Contraction $L'=L\sqrt{1-\beta^2}$
### Relativistic Doppler Shift $f=f_\lambda(1-\beta\cos\theta)$
### Aberration $\cos\theta'=\dfrac{\cos\theta-\beta}{1-\beta\cos\theta}$
