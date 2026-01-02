### Formula $A\vec x=\lambda\vec x$
- $A$ [[Matrix]]
- $\lambda$ [[Eigenvalue]]
- $\vec x$ [[Eigenvector]]
When vector is multiplied by [[Matrix]] it maybe scaled/rotated
When [[Eigenvector]][[s]] are multiplied by matrix they only scale
### Property Formula
> [!example] Find Eigen Vectors using [[Eigenvalue]][[s]]
> $A=\begin{bmatrix}1&1\\4&1\end{bmatrix}$
> $\lambda=3,-1$ `Eigen Values`
> $A\vec x=\lambda\vec x$ so $(A-\lambda I)\vec x=0$ assuming $\vec x\neq \vec0$ then $A-\lambda I=0$
> $A-\lambda I=A-(-1)\begin{bmatrix}1&0\\0&1\end{bmatrix}=\begin{bmatrix}1+1&1\\4&1+1\end{bmatrix}=\begin{bmatrix}2&1\\4&2\end{bmatrix}$
> $\begin{bmatrix}2&1\\4&2\end{bmatrix}\vec x=O,\quad\vec x=\begin{bmatrix}x\\ y\end{bmatrix}$
> $\left\{\begin{array}{}2x+1y=0\\4x+2y=0\end{array}\right.\implies\left\{\begin{array}{l}2x+y=0\\2x+y=0\end{array}\right.\implies2x=-y$
> Now find $\vec x$ that satisfies this constraint $\vec x=\begin{bmatrix}1\\-2\end{bmatrix}$
> > [!note] 
> > - There are infinite such vectors, but usually normalized eigen vector is chosen
> > - We solved it directly, but you could use a [[Matrix Decomposition]] method
> > - Do this for the other eigen value $3$ to get 2nd eigen vector
### Power Iteration
repeatedly multiplying vector with a matrix aligns it to matrix's largest [[Eigenvalue]] [[Eigenvector]]
- $v_1\approx\vec{x}_{n+1}=\dfrac{A\vec{x}_n}{||A\vec{x}_n||}$ where $\vec{x}\neq0$
- $\lambda_1\approx v_1^TAv_1$ `it's exact for symmetric matrices (like covariance matrix)`
