Measures relation strength of two variables `range: -1 to 1`
Similar to [[Pearson Correlation Coefficient]] but it ignores exact values and focuses on value rankings inside column
so it cares about trends which can be non-linear, instead of linear correlations
> [!note] Independent of scale/origin

![[Correlation.webp|400]]
### Formula $\rho(X,Y)=\frac{cov(R(X),R(Y))}{\sigma_{R(X)}\sigma_{R(Y)}}$
- $\text{cov}(X,Y)$ [[Covariance]] between $X$ and $Y$
- $\sigma_{R(X)},\sigma_{R(Y)}$ [[Standard Deviation]] of $R(X)$ and $R(Y)$
- $R(X),R(Y)$ rank, converts $X_i,Y_i$ to it's index inside sorted column
##### Faster Formula $1-\dfrac{6\sum(R(X)-R(y))^2}{n(n^2-1)}$ `assumes no ranking ties`
- $n$ observations `column length`
> [!example] Spearman's Rank Correlation Matrix
> ![[Spearman's Rank Correlation Matrix.webp]]
> > [!note] small values maybe just noise, filter them using $|r\sqrt{\large\frac{N-2}{1-r^2}}|\le1.96$
> > $r$ is spearman's coefficient
> This is called a [[t-test]]
