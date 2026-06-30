Normalizes over `(C,H,W)` per sample, like [[Group Normalization]] with `groups = 1`
### Formula $\gamma_i\cdot\dfrac{x_i}{\sqrt{\dfrac{1}{n}\sum (x_i-\mu)^2+\epsilon}}$
- $\gamma_i$ learnable scaling parameter
