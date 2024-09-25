### 2D
$$\begin{bmatrix}var(x) & cov(x,y) \\ cov(x,y) & var(y)\end{bmatrix}$$
- $var(x)$ [[Variance]] of $x$
- $cov(x,y)$ [[Covariance]] of $x,y$

### 3D
$$\begin{bmatrix}
var(x) & cov(x,y) & cov(x,z) \\
cov(x,y) & var(y) & cov(y,z) \\
cov(x,z) & cov(y,z) & var(z) \\
\end{bmatrix}$$
> [!note] 
> Only reason why [[Principal Diagonal]] has $var(x)$ instead of $cov(x,x)$ 
> is because it's the same thing, but $var(x)$ is more optimized

> [!tip] $cov(x,z)=cov(z,x)$ so upper/lower triangles are equal
### General
![[Covariance Matrix.webp]]

> [!tip] If you multiply random vector $v$ by covariance matrix $M$ it will get rotated towards the direction of greatest variance
> ![[Covariance Random Vector.webp]]
> $Mv$:
> ![[Covariance Rotated Vector.webp]]
> If you do it couple times it will align

quora.com/What-is-the-intuitive-meaning-of-a-covariance-matrix
