### Formula $A\vec x=\lambda\vec x$
- $A$ Matrix
- $\lambda$ [[Eigen Value]]
- $\vec x$ [[Eigen Vector]]
When vector is multiplied by [[Matrix]] it maybe scaled/rotated
Eigen values tell you how much vector is scaled in each dimension. `dimension count = column count`
Eigen value is length of [[Eigen Vector]]

If eigen value is from -1 to 1 it means it shrinks the vector
If eigen value is from 1 to $\infty$ or from $-\infty$ to 1 it grows the vector
If eigen value is negative it flips the vector
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
