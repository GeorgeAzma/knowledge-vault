### 2D
$${\huge\Sigma}=\begin{bmatrix}var(x) & cov(x,y) \\ cov(x,y) & var(y)\end{bmatrix}$$
- $var(x)$ [[Variance]] of $x$
- $cov(x,y)$ [[Covariance]] of $x,y$

### 3D
$${\huge\Sigma}=\begin{bmatrix}
var(x) & cov(x,y) & cov(x,z) \\
cov(x,y) & var(y) & cov(y,z) \\
cov(x,z) & cov(y,z) & var(z) \\
\end{bmatrix}$$
- $cov(x,z)=cov(z,x)$ so upper/lower triangles are equal
- $cov(x,x)=var(x)$ so [[Principal Diagonal]] is optimized using $var(x)$
### Calculation $C=\tfrac{1}{n-1}X^TX$
where $X$ has columns with their mean subtracted `mean centered columns`
### General
![[Covariance Matrix.webp]]

> [!tip] 
> If you multiply random vector $v$ by covariance matrix $M$ 
> it will get rotated towards greatest [[Variance]] direction
> which is covariance matrix's [[Eigenvector]]
> ![[Covariance Random Vector.webp|400]]
> $\Sigma v$
> ![[Covariance Rotated Vector.webp|400]]
> If you do it couple times it will align

quora.com/What-is-the-intuitive-meaning-of-a-covariance-matrix
