Translates random samples to percentiles `U ∈ [0; 1]`. vice-versa for inverse CDF
### Formula $F_X(x)=P(X\leq x)$
CDFs en.wikipedia.org/wiki/Cumulative_distribution_function
[[Derivative]] of CDF is [[Probability Density Function]]
> [!example] Uniform distribution $[0;1]$
> $x=1\implies P(X\leq x)=1$
> $x=0.5\implies P(X\leq x)=0.5$
> $x=0\implies P(X\leq x)=0$
> $F_X(x)=\left\{\begin{array}{rl}0&x<0\\ x&0\leq x\leq1\\1&x>1\end{array}\right.$
### Inverse CDF $F^{-1}(p),p\in[0,1]$ `a.k.a. quantile`
Random value $x\sim X$ for which $P(X\leq x)=p$
>[!example] $F_\text{Gaussian}^{-1}(0.01)=-1.8$, meaning $P(x\leq-1.8)=1\%$
