---
aliases: ["Binomial Distribution"]
---
### Formula $F(n,r,p)=\binom{n}{r}p^r(1-p)^{n-r}$
- $n$ flips `bernoulli trials (yes/no experiments)`
- $r$ heads `successes (yes)`
- $p$ chance of flipping a head `chance of success`
- $\large\binom{n}{r}=\frac{n!}{(n-r)!r!}$ [[Binomial Coefficient]] 
  `number of ways to choose r successes out of n trials`
- $F(n,r,p)$ probability of flipping $r$ heads
chance of flipping heads $r$ times  and tails $n-r$ times (very low)
multiplied by number of ways you could've flipped that
> [!example] $p=n^{-1}$
> Chance of success after $n$ tries and success probability $p=n^{-1}$ 
> with this formula works out to be $F(n,1,n^{-1})=1-(1-n^{-1})^n$
> Which converges to $1-e^{-1}=0.632120558829$
> This is because $e=\lim_{x\to\infty}(1+x^{-1})^x$
> and $e^{-1}=\lim_{x\to\infty}(1-x^{-1})^x$
### Properties
- [[Support]] $r\in\set{0\dots n}$
- $\mu=np$
- $\sigma^2=np(1-p)$
- [[Mode]] $\lfloor{(n+1)p}\rfloor$