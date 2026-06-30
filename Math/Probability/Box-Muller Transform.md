---
aliases:
  - Random Gaussian
---
Generates standard [[Normal Distribution|normally distributed]] random numbers from 2 uniformly $[0;1]$ distributed random numbers
### Formula $x=\sqrt{-2\ln U_1}\cos(2\pi U_2),\quad y=\sqrt{-2\ln U_1}\sin(2\pi U_2)$
$U_1,U_2\sim\mathcal{U}(0,1)$
### Gaussian To Uniform Circle $\sqrt{1-\exp(-\dfrac{|Z|^2}{2})}(\cos(\theta),\sin(\theta))$
### Gaussian To Uniform Square $(\text{erf}(\dfrac{x}{\sqrt{2}}),\text{erf}(\dfrac{y}{\sqrt{2}}))$
[[Normal Distribution]] [[Cumulative Distribution Function|CDF]] $\Phi(\dfrac{x-\mu}{\sigma})=\dfrac{1+\operatorname{erf}(\dfrac{x-\mu}{\sigma\sqrt2})}{2}$
So for standard distribution $\Phi(x)=\dfrac{1+\operatorname{erf}(\dfrac{x}{\sqrt2})}{2}$ this gives `[0; 1]` square
for `[-1; 1]` square $\Phi(x)=\operatorname{erf}(\dfrac{x}{\sqrt2})$