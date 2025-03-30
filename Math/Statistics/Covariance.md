Similar to [[Dot Product]]
Positive covariance means both data are high or low together
Negative covariance means one is high if the other is low or vice-versa
### Formula $cov(x,y)=\frac{(x-\micro_x)\cdot(y-\micro_y)}{N}$
- $\micro_x$ [[Mean]] of $x$
- $\micro_y$ [[Mean]] of $y$
- $N$ Array size
> [!tip] $cov(a,b)=cov(b,a)$

> [!note] 
> If you trying to approximate covariance by randomly sampling the data portion
> then you should divide by $N-1$ instead of $N$, which gives better approximation
> this is called [[Bessel's Correction]]
