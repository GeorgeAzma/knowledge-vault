Measures relation strength of two variables `range: -1 to 1`
> [!note] Independent of scale/origin

![[Correlation.webp|400]]
### Formula $\rho(x,y)=\frac{cov(x,y)}{\sigma_x\sigma_y}$
- $cov(x,y)$ [[Covariance]] between $x$ and $y$
- $\sigma_x,\sigma_y$ Standard deviation of $x$ and $y$

> [!example] If you have more than 2 arrays of data you can show correlation matrix like this: 
> ![[Correlation Matrix.webp|400]]
> > [!note] Some values are too small and are probably just noise, you can filter them like so $|\rho|\le\frac{2}{\sqrt{N}}$
> > > [!note] This is called a t-test
