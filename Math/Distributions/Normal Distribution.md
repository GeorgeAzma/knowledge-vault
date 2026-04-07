---
aliases:
  - Gaussian Distribution
---
### [[Probability Density Function|PDF]] $N(\mu,\sigma)=\huge\frac{e^{\frac{-(x-\mu)^2}{2\sigma^2}}}{\sigma\sqrt{2\pi}}$
- $\mu$ [[Mean]]
- $\sigma$ [[Standard Deviation]] or $\sigma^2$ which is [[Variance]]
### Standard $\huge\sqrt{\frac{e^{-x^2}}{2\pi}}\normalsize=(2\pi e^{x^2})^{-0.5}$ where $\mu=0,\quad\sigma=1$
`rng.standard_gaussian() * stdev + mean`
### [[Cumulative Distribution Function|CDF]] $\Phi(\frac{x-\mu}{\sigma})=\frac{1+\operatorname{erf}(\frac{x-\mu}{\sigma\sqrt2})}{2}$
Used to find probability that sample is within range of $n$ [[Standard Deviation]][[s]]
- $\operatorname{erf}(x)$ [[Error Function]] 
> [!example] For standard normal distribution with $\mu=0$ and $\sigma=1$
> If probability of hypothesis being true is within $\sigma=5$
> It means that $p=\dfrac{1+\operatorname{erf}(\dfrac{x}{\sqrt2})}{2}=0.999999426697\%$
### Multivariate $p(x;\mu,\Sigma)=(2\pi)^{-\frac{n}{2}}|\Sigma|^{-\frac{1}{2}}\exp(-\frac{1}{2}(x-\mu)^T\Sigma^{-1}(x-\mu))$
- $\mu\in\mathbb{R}^n$ 
- $\Sigma\in\mathbb{R}^{n\times n}$ [[Covariance Matrix]]
youtu.be/wc7oZB15rYQ relates to [[Bayes' Theorem]]
### Properties
- $aX+b\sim\mathcal{N}(a\mu+b,~a^2\sigma^2)$ `linear transformation`
    - multivariate $Ax+b\sim\mathcal{N}(A\mu+b,~A\Sigma A^T)$
- $X\pm Y\sim\mathcal{N}(\mu_X\pm\mu_Y,~\sigma_X^2\pm\sigma_Y^2)$  `addition`
    - multivariate $x\pm y\sim\mathcal{N}(\mu_X\pm \mu_Y,~\Sigma_X\pm \Sigma_Y)$
- $XY\sim\mathcal{N}\left(\dfrac{\mu_X\sigma_Y^2+\mu_Y\sigma_X^2}{\sigma_X^2+\sigma_Y^2},~\dfrac{\sigma_X^2\sigma_Y^2}{\sigma_X^2+\sigma_Y^2}\right)$ `multiplication`
    - $XY\sim\mathcal{N}\left(\dfrac{\mu_X+\mu_Y}{2},~\dfrac{\sigma^2}{2}\right)$ `same stdev`

