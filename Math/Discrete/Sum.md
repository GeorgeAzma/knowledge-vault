### Simplifications
- $\sum_{k=1}^nk=\dfrac{n(n+1)}{2}$ [[Arithmetic Series]] `n-1 for coding`
- $\sum_{k=1}^n(2k-1)=n^2$ `odd number sum`
- $\sum_{k=1}^n2k=n(n+1)$ `even number sum`
- $\sum_{k=1}^nk^2=\dfrac{n(n+1)(2n+1)}{6}$ `square sum`
- $\sum_{k=1}^nk^3=\left(\dfrac{n(n+1)}{2}\right)^2$ `cube sum`
- $\sum_{k=0}^n(a+kd)=\dfrac{(n+1)(2a+nd)}{2}$ [[Arithmetic Series]]
- $\sum_{k=0}^nar^k=a\dfrac{1-r^{n+1}}{1-r}$ [[Geometric Series]]
- $\sum_{k=0}^\infty ar=\dfrac{a}{1-r}$ `r < 1` [[Geometric Series]]
- $\sum_{k=0}^n\dbinom{n}{k}=2^n$ `binomial sum`
- $\sum_{k=1}^n\log k=\log{n!}\approx n\log{n}-n$ `logarithm sum`
- $\sum_{k=1}^n \dfrac{1}{k}\approx \ln(n)+\gamma+\dfrac{1}{2n}$ `harmonic series`
- $\sum_{k=1}^n\left(\dfrac{1}{k}-\dfrac{1}{k+1}\right)=1-\dfrac{1}{n+1}=\dfrac{n}{n+1}$ `telescoping series`
  if you see `k - (k+1)` pattern or `(k+1) - k` it might cancel out
- $\sum^n_{k=1}k^p=\dfrac{1}{p+1}\sum_{j=0}^p\dbinom{p+1}{j}B_jn^{p+1-j}$ `B_j are bernoulli numbers`
- $\sum_{k=1}^\infty\dfrac{(-1)^{k+1}}{k}=\ln2$ `alternating harmonic series`
- $\sum^\infty_{k=1}\dfrac{1}{k^2}=\dfrac{\pi^2}{6}$ `reciprocal square sum`
- $\sum_{k=1}^n\cos k\theta=\dfrac{\sin\dfrac{n\theta}{2}\cos\dfrac{(n+1)\theta}{2}}{\sin\dfrac{\theta}{2}}$
- $\zeta(s)=\sum_{k=1}^\infty\dfrac{1}{k^s}$ `riemann zeta function`
> [!example] $\sum_{k=1}^nk\cdot 6^k$
> - [[Geometric Series]] $\large\sum_{k=0}^nar^k=a\frac{1-r^{n+1}}{1-r}$
> - for $a=1$ derivative is $\large\frac{d}{dr}=\sum_{k=0}^nkr^{k-1}=\frac{(-(n+1)x^n)(1-x)-(1-x^{n+1})(-1)}{(1-x)^2}$
> - $\large=\frac{1-x^{n+1}-(n+1)x^n(1-x)}{(1-x)^2}=\frac{1-(n(1-x)+1)x^n}{(1-x)^2}$
> - multiply both by $r$ to get final formula $\large\sum_{k=0}^nkr^k=r\frac{1-(n(1-r)+1)r^n}{(1-r)^2}$
> - for $r=6$ we get $\large\sum_{k=0}^nk6^k=6\frac{1+(5n-1)6^n}{25}$
