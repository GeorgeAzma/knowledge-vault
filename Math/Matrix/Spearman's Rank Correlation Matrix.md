Measures relation strength of two variables `range: -1 to 1`
Similar to [[Pearson Correlation Coefficient]] but more natural/better
> [!note] Independent of scale/origin

![[Correlation.webp|400]]
### Formula $\rho(x,y)=\frac{cov(R(x),R(y))}{\sigma_x\sigma_y}$
- $cov(x,y)$ [[Covariance]] between $x$ and $y$
- $\sigma_x,\sigma_y$ Standard deviation of $x$ and $y$

> [!example] If you have more than 2 arrays of data you can show correlation matrix like this: 
> ![[Spearman's Rank Correlation Matrix.webp]]
> > [!note] small values maybe just noise, filter them using $|r\sqrt{\large\frac{N-2}{1-r^2}}|\le1.96$
> > $r$ is spearman's coefficient
> This is called a [[t-test]]
