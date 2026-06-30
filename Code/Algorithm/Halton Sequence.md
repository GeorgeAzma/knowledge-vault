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
