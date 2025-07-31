Measures relation strength of two variables `range: -1 to 1`
> [!note] Independent of scale/origin

![[Correlation.webp|400]]
### Formula $\rho(x,y)=\frac{cov(x,y)}{\sigma_x\sigma_y}$
- $cov(x,y)$ [[Covariance]] between $x$ and $y$
- $\sigma_x,\sigma_y$ Standard deviation of $x$ and $y$

> [!example] Correlation Matrix
> ![[Correlation Matrix.webp]]
> > [!note] small values maybe just noise, filter them using $|\rho|\le\frac{2}{\sqrt{N}}$
