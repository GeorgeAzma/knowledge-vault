### Formula $A\vec x=\lambda\vec x$
- $A$ [[Matrix]]
- $\lambda$ [[Eigen Value]]
- $\vec x$ [[Eigen Vector]]
When vector is multiplied by [[Matrix]] it maybe scaled/rotated
When [[Eigen Vector]][[s]] are multiplied by matrix they only scale
### Property Formula
> [!example] Find Eigen Vectors using [[Eigen Value]][[s]]
> $A=\begin{bmatrix}1&1\\4&1\end{bmatrix}$
> $\lambda=3,-1$ `Eigen Values`
> $A\vec x=\lambda\vec x$ so $(A-\lambda I)\vec x=0$ assuming $\vec x\neq \vec0$ then $A-\lambda I=0$
> $A-\lambda I=A-\begin{bmatrix}-1&0\\0&-1\end{bmatrix}=\begin{bmatrix}1+1&1\\4&1+1\end{bmatrix}=\begin{bmatrix}2&1\\4&2\end{bmatrix}$
> $\vec x=(x,y)$
> $\begin{bmatrix}2&1\\4&2\end{bmatrix}\vec x=O$
> $\left\{\begin{array}{}2x+1y=0\\4x+2y=0\end{array}\right.$
> $\left\{\begin{array}{l}2x+y=0\\2x+y=0\end{array}\right.$
> $4x+2y=0$
> $4x=-2y$
> $2x=-y$
> Now find $\vec x$ that satisfies this constraint $\vec x=\begin{bmatrix}1\\-2\end{bmatrix}$
> > [!note] We solved it directly, but you could use a [[Matrix Decomposition]] method
