### Formula $A\vec x=\lambda\vec x$
- $A$ [[Matrix]]
- $\lambda$ [[Eigen Value]]
- $\vec x$ [[Eigen Vector]]
When vector is multiplied by [[Matrix]] it maybe scaled/rotated
Eigen values tell you how much vector is scaled in each dimension.

- $\lambda=(-1;1)$ shrinks vector
- $\lambda=(-\infty;-1)\cup(1;\infty)$ grows vector
- $\lambda<0$ flips the vector
- $\lambda=1$ same length vector `identity`
- $\lambda=-1$ reflection/flip, but same length
- $\lambda$ is [[Complex Number|Complex]] when rotation
- if $\lambda=0$ matrix is non-invertible (singular)
- if all $\lambda>0$ matrix is [[Positive Definite Matrix|positive definite]] or [[Positive Definite Matrix|positive semi-definite]]
- if all $\lambda<1$ in discrete system, system converges
### Property Formula $\det(M - \lambda I)=0$
- $M$ [[Matrix]]
- $I$ [[Identity Matrix]]
- $\lambda$ [[Eigen Value]]
- $det$ [[Determinant]]
> [!example] Find Eigen Values using [[Quadratic Equation]]
> `Based on above property formula` 
> $M=\begin{bmatrix}1&1\\4&1\end{bmatrix}$
> $\begin{bmatrix}1&1\\4&1\end{bmatrix}-\begin{bmatrix}\lambda & 0\\0&\lambda\end{bmatrix}=\begin{bmatrix}1-\lambda & 1\\4&1-\lambda\end{bmatrix}$
> $det(\begin{bmatrix}1-\lambda & 1\\4&1-\lambda\end{bmatrix})=0$
> $(1-\lambda)(1-\lambda)-(4)(1)=0$
> $1-2\lambda+\lambda^2-4=0$
> $\lambda^2-2\lambda-3=0$
> $\lambda=3,-1$
