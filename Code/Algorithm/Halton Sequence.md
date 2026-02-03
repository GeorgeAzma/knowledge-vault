![[Halton Points.webp]]
Pseudo-Random evenly spaced distribution useful for Monte-Carlo simulations
>[!note] Very fast to calculate for small $n$ but it's $O(n \log n)$ instead of usual $O(n)$

``` Python
# base can be any prime number (2, 3, 5, 7...)
def halton_sequence(index, base):
    result = 0
    f = 1.0 / base
    i = index
    while i > 0:
        result += f * (i % base)
        i //= base
        f /= base
    return result
```
> [!example]
> ``` Python
> points3D = []
> for i in range(100):
> 	points3D.append((halton_sequence(i, 2), halton_sequence(i, 3), halton_sequence(i, 5)))
> ```

### [[Golden Ratio]] Sequence
performs better
``` python
index = range(1, infinity)

# 1D
phi = solve(x^2 == x + 1) = 1.6180339887
fract(phi ** 2 * index) 

# 2D
phi2 = solve(x^3 == x + 1) = 1.32471795724
fract(vec2(phi2, 1) / phi2^2 * index)

# 3D
phi3 = solve(x^4 == x + 1) = 1.22074408461
fract(vec3(phi3^2, phi3, 1) / phi3^3 * index)

# 4D
phi4 = solve(x^5 == x + 1) = 1.16730397826
fract(vec4(phi4^3, phi4^2, phi4, 1) / phi4^4 * index) 
```
### Solve `phi` Using [[Halley's Method]]
$x^n=x+1\implies x^n-x-1=0$
- $f(x)=x^n-x-1$
- $f'(x)=nx^{n-1}-1$
- $f''(x)=n(n-1)x^{n-2}-1\implies f''(x)=(n^2-n)x^{n-2}$
- [[Halley's Method]] $x_{n+1}=x_n-\dfrac{2f(x_n)f'(x_n)}{2(f'(x_n))^2-f(x_n)f''(x_n)}$
- $x_{n+1}=x-\dfrac{2(x^n-x-1)(nx^{n-1}-1)}{2(nx^{n-1}-1)^2-(x^n-x-1)(n^2-n)x^{n-2}}$ `mostly canonical form`


