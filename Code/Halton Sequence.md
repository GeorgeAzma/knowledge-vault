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

> [!tip] [[Golden Ratio]] based sequence seems better
> - **1D** `fract(phi * phi * index)` 
>   `phi = solve(x^2 == x + 1) = 1.6180339887`
> - **2D** `fract(vec2(phi2, 1) / (phi2 * phi2) * index)` 
>   `phi2 = solve(x^3 == x + 1) = 1.32471795724`
> - **3D** `fract(vec3(phi3 * phi3, phi3, 1) / (phi3 * phi3 * phi3) * index)` 
>   `phi3 = solve(x^4 == x + 1) = 1.22074408461`
> - **4D** `fract(vec4(phi4 * phi4 * phi4, phi4 * phi4, phi4, 1) / (phi4 * phi4 * phi4 * phi4) * index)` 
>   `phi4 = solve(x^5 == x + 1) = 1.16730397826`
>   > [!note] index is from $1\to\infty$
