### Formula $F(n,r,p)=\binom{n}{r}p^r(1-p)^{n-r}$
- $n$ flips
- $r$ heads
- $p$ chance of flipping a head `chance of success`
- $\large\binom{n}{r}=\frac{n!}{(n-r)!r!}$ [[Binomial Coefficient]]
- $F(n,r,p)$ probability of flipping $r$ heads
> [!example] $p=n^{-1}$
> Chance of success after $n$ tries and success probability $p=n^{-1}$ 
> with this formula works out to be $F(n,1,n^{-1})=1-(1-n^{-1})^n$
> Which converges to $1-e^{-1}=0.632120558829$
> This is because $e=\lim_{x\to\infty}(1+x^{-1})^x$
> and $e^{-1}=\lim_{x\to\infty}(1-x^{-1})^x$
