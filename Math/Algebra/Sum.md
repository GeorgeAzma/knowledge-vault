### Simplifications
- $\large\sum_{k=1}^nk=\frac{n(n+1)}{2}$ [[Arithmetic Series]] `n-1 for coding`
- $\large\sum_{k=1}^n(2k-1)=n^2$ `odd number sum`
- $\large\sum_{k=1}^n2k=n(n+1)$ `even number sum`
- $\large\sum_{k=1}^nk^2=\frac{n(n+1)(2n+1)}{6}$ `square sum`
- $\large\sum_{k=1}^nk^3=(\frac{n(n+1)}{2})^2$ `cube sum`
- $\large\sum_{k=0}^n(a+kd)=\frac{(n+1)(2a+nd)}{2}$ [[Arithmetic Series]]
- $\large\sum_{k=0}^nar^k=a\frac{1-r^{n+1}}{1-r}$ [[Geometric Series]]
- $\large\sum_{k=0}^\infty ar=\frac{a}{1-r}$ `r < 1` [[Geometric Series]]
- $\large\sum_{k=0}^n\binom{n}{k}=2^n$ `binomial sum`
- $\large\sum_{k=1}^n\log(k)=\log(n!)\approx n\log(n)-n$ `logarithm sum`
- $\large\sum_{k=1}^n \frac{1}{k}\approx \ln(n)+\gamma+\frac{1}{2n}$ `harmonic series`
- $\large\sum_{k=1}^n(\frac{1}{k}-\frac{1}{k+1})=1-\frac{1}{n+1}=\frac{n}{n+1}$ `telescoping series`
  if you see `k - (k+1)` pattern or `(k+1) - k` it might cancel out
- $\large\sum^n_{k=1}k^p=\frac{1}{p+1}\sum_{j=0}^p\binom{p+1}{j}B_jn^{p+1-j}$ `B_j are bernoulli numbers`
- $\large\sum_{k=1}^\infty\frac{(-1)^{k+1}}{k}=\ln2$ `alternating harmonic series`
- $\large\sum^\infty_{k=1}\frac{1}{k^2}=\frac{\pi^2}{6}$ `reciprocal square sum`
- $\large\sum_{k=1}^n\cos(k\theta)=\frac{\sin(\frac{n\theta}{2})\cos(\frac{(n+1)\theta}{2})}{\sin(\frac{\theta}{2})}$
- $\large\zeta(s)=\sum_{k=1}^\infty\frac{1}{k^s}$ `riemann zeta function`
> [!example] $\sum_{k=1}^nk\cdot 6^k$
> - [[Geometric Series]] $\large\sum_{k=0}^nar^k=a\frac{1-r^{n+1}}{1-r}$
> - for $a=1$ derivative is $\large\frac{d}{dr}=\sum_{k=0}^nkr^{k-1}=\frac{(-(n+1)x^n)(1-x)-(1-x^{n+1})(-1)}{(1-x)^2}$
> - $\large=\frac{1-x^{n+1}-(n+1)x^n(1-x)}{(1-x)^2}=\frac{1-(n(1-x)+1)x^n}{(1-x)^2}$
> - multiply both by $r$ to get final formula $\large\sum_{k=0}^nkr^k=r\frac{1-(n(1-r)+1)r^n}{(1-r)^2}$
> - for $r=6$ we get $\large\sum_{k=0}^nk6^k=6\frac{1+(5n-1)6^n}{25}$
