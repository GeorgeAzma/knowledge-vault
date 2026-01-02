Probability of sample from distribution $X$ 
being $\leq$ to other random sample $x$
> [!example] Uniform distribution $[0;1]$
> If $x=1$ then any new sample is gonna be less
> So probability or CDF is $1$
> For $x=0.5$ it's 50/50 chance that it will be less
> For $x\leq0$ new sample will always gonna be more
> 
> So CDF function is
> $\left\{\begin{array}{rl}0&x<0\\ x&0\leq x\leq1\\1&x>1\end{array}\right.$
### Formula $F_X(x)=P(X\leq x)$
Other CDFs en.wikipedia.org/wiki/Cumulative_distribution_function
[[Derivative]] of CDF is [[Probability Density Function]]
### Inverse CDF $F^{-1}(p),p\in[0,1]$
`also called quantile`
Outputs a random value $x$ for which probability of randomly sampling 
less than $x$ from a distribution $X$ is $p$
>[!example]
>![[Gaussian.webp]]
>Here  $F_{Gaussian}^{-1}(0.01)$ is gonna return something like $-1.8$
>Because chance of random sample being less than $-1.8$
>Is $\leq1\%$
