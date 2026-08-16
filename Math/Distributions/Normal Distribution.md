---
aliases:
  - Gaussian Distribution
---
### [[Probability Density Function|PDF]] $\mathcal{N}(\mu,\sigma)=\dfrac{e^{\frac{-(x-\mu)^2}{2\sigma^2}}}{\sigma\sqrt{2\pi}}$
- $\mu$ [[Mean]]
- $\sigma$ [[Standard Deviation]] or $\sigma^2$ which is [[Variance]]
### Standard $\huge\sqrt{\frac{e^{-x^2}}{2\pi}}\normalsize=(2\pi e^{x^2})^{-0.5}$ where $\mu=0,\quad\sigma=1$
`rng.standard_gaussian() * stdev + mean`
### [[Cumulative Distribution Function|CDF]] $\Phi\left(\dfrac{x-\mu}{\sigma}\right)=\dfrac{1+\operatorname{erf}\left(\dfrac{x-\mu}{\sigma\sqrt2}\right)}{2}$
- $\operatorname{erf}(x)$ [[Error Function]] Used to find probability that sample is within range of $[-n;n]$ [[Standard Deviation|standard deviations]]
- $\Phi(\dfrac{x-\mu}{\sigma})=P(x\in[-\infty;n]) \text{ where } x\sim\mathcal{N}(\mu,\sigma)$ 
    - [[Cumulative Distribution Function|CDF]] of standard normal distribution is probability sample is withing range $[-\infty;n]$ 
    - lets try to convert $\text{erf}$ into $\Phi$, 
    - since $\mathcal{N}(x; \mu,\sigma)=\mathcal{N}(-x; \mu,\sigma)$ we can convert $\text{erf}=P(x\in[-n;n])$  to $\dfrac{\text{erf}}{2}=P(x\in[0;n])$ `use symmetry`
    - then use symmetry again to $P(x\in[-\infty;\infty])=1\implies P(x\in[-\infty;0])=\dfrac{1}{2}$
- now $\Phi(x)=P(x\in[-\infty;n])=P(x\in[-\infty;0])+P(x\in[0;n])=\dfrac{1}{2}+\dfrac{\text{erf}}{2}$
> [!example] For standard normal distribution with $\mu=0$ and $\sigma=1$
> If probability of hypothesis being true is within $\sigma=3$
> It means that [[p-value]] $p=\dfrac{1+\operatorname{erf}(\dfrac{x}{\sqrt2})}{2}\approx99.865\%$
### [[Cumulative Distribution Function#Inverse CDF $F {-1}(p),p in[0,1]$ `a.k.a. quantile`|Inverse CDF]] $\Phi^{-1}(x)=\mu+\sigma\sqrt{2}\text{erf}^{-1}(2p-1)$
### Multivariate $p(x;\mu,\Sigma)=(2\pi)^{-\frac{n}{2}}|\Sigma|^{-\frac{1}{2}}\exp(-\frac{1}{2}(x-\mu)^T\Sigma^{-1}(x-\mu))$
- $\mu\in\mathbb{R}^n$ 
- $\Sigma\in\mathbb{R}^{n\times n}$ [[Covariance Matrix]]
youtu.be/wc7oZB15rYQ relates to [[Bayes' Theorem]]
### Algebra
- $\mathcal{N}(x;\mu_1,\sigma_1^2)\cdot\mathcal{N}(x;\mu_2,\sigma_2^2)\propto\mathcal{N}\left(x;\dfrac{\mu_1\sigma_2^2+\mu_2\sigma_1^2}{\sigma_1^2+\sigma_2^2},~~\dfrac{\sigma_1^2\sigma_2^2}{\sigma_1^2+\sigma_2^2}\right)$ `Gaussian density product`
    - $\sigma_1=\sigma_2\implies\propto\mathcal{N}\left(x;~~\dfrac{\mu_1+\mu_2}{2},~~\dfrac{\sigma^2}{2}\right)$
##### Multivariate
- $A\mathbf{x}+B\mathbf{y}+\mathbf{c}\sim\mathcal{N}(A\mathbf{μ}_x+B\mathbf{μ}_y+\mathbf{c},~~A\Sigma_x A^T+B\Sigma_y B^T+A\Sigma_{xy} B^T+B\Sigma_{xy}^T A^T)$ `general form`
- $A\mathbf{x}+\mathbf{b}\sim\mathcal{N}(A\mathbf{μ}_x+\mathbf{b},~~A\Sigma_x A^T)$ `affine transformation`

- $\mathbf{x}\pm\mathbf{y}\sim\mathcal{N}(\mathbf{μ}_x\pm\mathbf{μ}_y,~~\Sigma_x+\Sigma_y\pm(\Sigma_{xy}​+\Sigma_{xy}^T​))$ `addition`
- $\mathbf{x}\mid\mathbf{y}\sim\mathcal{N}(\mathbf{μ}_x+\Sigma_{xy}\Sigma_y^{-1}(\mathbf{y}-\mathbf{μ}_y),~~\Sigma_x-\Sigma_{xy}\Sigma_y^{-1}\Sigma_{xy}^T)$
### [[Box-Muller Transform]]
### Code
``` c
// 2D multivariate gaussian described by 5 points
float gauss(vec2 uv, vec2 c, vec2 p0, vec2 p1, vec2 p2, vec2 p3) {
    vec2  d = uv - c;
    vec2 q0 = p0 - c;
    vec2 q1 = p1 - c;
    vec2 q2 = p2 - c;
    vec2 q3 = p3 - c;

    // covariance matrix: Σ = (1/N) * sum(qi * qi^T)
    // gives an ellipse that fits the spread of all 4 points
    mat2 sigma = (
        mat2(q0.x*q0.x, q0.x*q0.y,
             q0.x*q0.y, q0.y*q0.y) +
        mat2(q1.x*q1.x, q1.x*q1.y,
             q1.x*q1.y, q1.y*q1.y) +
        mat2(q2.x*q2.x, q2.x*q2.y,
             q2.x*q2.y, q2.y*q2.y) +
        mat2(q3.x*q3.x, q3.x*q3.y,
             q3.x*q3.y, q3.y*q3.y)
    ) * 0.25;

    return exp(-0.5 * dot(d, inverse(sigma) * d));
}
```
