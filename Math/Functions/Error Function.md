[[Probability]] of [[Normal Distribution|Normally Distributed]] $\mu=0,\sigma^2=0.5$ being in range $[-x,x]$
[[Cumulative Distribution Function|CDF]] of [[Normal Distribution]] $e^{-x^2}$, scaled by $\frac{2}{\sqrt\pi}$
### Formula $\operatorname{erf}(x)=\frac{2}{\sqrt{\pi}}\int_0^xe^{-t^2}dt$
> [!tip] 
> - $\large\operatorname{erf}(\frac{\alpha-\mu}{\sigma\sqrt2})$ is probability that sample is in range $[-\alpha;\alpha]$
> - **Approximations**
> 	  - $1-(1+x0.278393+x^20.230389+x^30.000972+x^40.078108)^{-4}$ $[0;\infty],\epsilon=5\times10^{-4}$ `use abs(x) and multiply by sign(x)`
> 	- $\tanh(\sqrt\pi\ln(2)x)$ $\epsilon=0.03$
> 	- $\Phi(x)=\frac{2}{\sqrt\pi}(x-\frac{x^3}{3}+\frac{x^5}{10}-\frac{x^7}{42}+\frac{x^9}{216})$ $[-1;1]$
