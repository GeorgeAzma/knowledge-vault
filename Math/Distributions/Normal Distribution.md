---
aliases:
  - Gaussian Distribution
---
### Formula $N(\mu,\sigma)=\huge\frac{e^{\frac{-(x-\mu)^2}{2\sigma^2}}}{\sigma\sqrt{2\pi}}$
- $\mu$ [[Mean]]
- $\sigma$ [[Standard Deviation]] or $\sigma^2$ which is [[Variance]]
### Standard $\huge\sqrt{\frac{e^{-x^2}}{2\pi}}\normalsize=(2\pi e^{x^2})^{-0.5}$
Gaussian distribution with $\mu=0$ and $\sigma=1$
> [!tip] RNG libraries provide random standard gaussian
> `random_gaussian = rng.next_gaussian() * stdev + mean`
### [[Cumulative Distribution Function|CDF]] $\Phi(\frac{x-\mu}{\sigma})=\frac{1+\operatorname{erf}(\frac{x-\mu}{\sigma\sqrt2})}{2}$
- $\operatorname{erf}(x)$ [[Error Function]] 
Can be used to find probability that sample is within range of $n$ [[Standard Deviation]][[s]]
> [!example] For standard normal distribution with $\mu=0$ and $\sigma=1$
> If someone says that probability of their hypothesis being true is within $\sigma=5$
> It means that $p=\large\frac{1+\operatorname{erf}(\frac{x}{\sqrt2})}{2}$
> which is $0.999999426697\%$, approximately 1 in 3.5 million that it's false
