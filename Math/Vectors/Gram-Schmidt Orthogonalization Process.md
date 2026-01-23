used to orthogonalize set of vectors
1. leave 1st vector as is, but normalize it, lets call this vector `x`
2. project 2nd vector `y` on 1st vector `x` using dot product `y_proj_x = dot(x,y) * x / |y|^2`
    - `since dot(x,y)=|x||y|cos(t), |y|/|y|^2 is cancelled out`
    - `so effectively this projects x onto normalized y`
3. subtract `x` projected part from `y -= y_proj_x`
4. project 3rd vector `z` onto `x` and `y` and subtract projections the same way
5. keep projecting new vectors onto existing orthogonalized vectors
### Projecting Functions
- functions behave like $n$-dimensional vectors where $n$ is sample count
    - because function can be defined as its output given $n$ input samples in some interval
    - and these $n$ output samples can be represented as a vector
- like vectors, we can compute **similarity** between functions using a **dot product**
- Therefore, Gram-Schmidt Orthogonalization Process also works for functions
- imagine sampling polynomial basis functions `1, x, x^2` $n$ times `lets say 3`
- that gives `1: [1, 1, 1], x: [0, 1, 2], x^2: [0, 1, 4]`
- think of these as non-orthogonal 3D vectors, which can be orthogonalized with Gram-Schmidt
- after orthogonalizing it, you can project any function with $n=3$ samples on polynomial bases
- which gives you magnitude along each dimension, similar to `x, y, z` but for polynomial bases
- which can be used to write best polynomial approximations for the function along sampled interval 
- `example: proj(f(x), poly(x)) = [0.3, 0.2, 0.5]` then `0.3 + 0.2x + 0.5x^2`

``` python
import numpy as np
from numpy.typing import NDArray as Tensor


def f(x) -> Tensor:
    return np.cos(np.sin(x)) ** 2 - np.sin(np.cos(np.exp(x)))


def gram_schmidt(x: Tensor, n: int) -> Tensor:
    # optional: remap x in [-1; 1] to avoid numbers exploding (functionally identical)
    # x = (2 * x - (min + max)) / (max - min)
    px = [x**i for i in range(n)]

    orthonormal_basis = []
    for p in px:
        for v in orthonormal_basis:
            proj = np.dot(p, v) * v / np.dot(v, v)
            p = p - proj
        p_norm = np.linalg.norm(p)
        if p_norm > 1e-10:
            orthonormal_basis.append(p / p_norm)

    return np.array(orthonormal_basis)


def approx_fn(x: Tensor, n: int) -> Tensor:
    basis = gram_schmidt(x, n)
    fx = f(x)

    # project f onto the orthonormal basis
    coeffs = np.array([np.dot(fx, p) for p in basis])

    # reconstruct approximation
    f_approx = np.array(sum(c * p for c, p in zip(coeffs, basis)))
    return f_approx


import matplotlib.pyplot as plt

x = np.linspace(-10, 3, 500)
fn = approx_fn(x, 64)

plt.plot(x, fn)
plt.plot(x, f(x))
plt.show()
```