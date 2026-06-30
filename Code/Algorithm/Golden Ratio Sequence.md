Pseudo-Random evenly spaced distribution useful for Monte-Carlo simulations
``` python
index = range(1, infinity)

# 1D
phi = 1.6180339887 # solve(x^2 == x + 1)
fract(phi^2 * index)  # => fract(2.618 * index) => fract(0.618 * index)

# 2D
phi2 = 1.32471795724 # solve(x^3 == x + 1)
fract(vec2(phi2, 1) / phi2^2 * index)

# 3D
phi3 = 1.22074408461 # solve(x^4 == x + 1)
fract(vec3(phi3^2, phi3, 1) / phi3^3 * index)

# 4D
phi4 = 1.16730397826 # solve(x^5 == x + 1)
fract(vec4(phi4^3, phi4^2, phi4, 1) / phi4^4 * index)
```
### Solve `phi` Using [[Halley's Method]]
$x^n=x+1\implies x^n-x-1=0$
- $f(x)=x^n-x-1$
- $f'(x)=nx^{n-1}-1$
- $f''(x)=n(n-1)x^{n-2}-1\implies f''(x)=(n^2-n)x^{n-2}$
- [[Halley's Method]] $x_{n+1}=x_n-\dfrac{2f(x_n)f'(x_n)}{2(f'(x_n))^2-f(x_n)f''(x_n)}$
- $x_{n+1}=x-\dfrac{2(x^n-x-1)(nx^{n-1}-1)}{2(nx^{n-1}-1)^2-(x^n-x-1)(n^2-n)x^{n-2}}$ `mostly canonical form`
