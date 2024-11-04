Multiplying [[Standard Basis Vector]][[s]] by this matrix makes any area $6$ times larger
So $6$ is a determinant, Works for any vector/[[Matrix]] not just SBVs
![[Determinant Scaling Space.webp]]
> [!note] 
> - $det(M)=0$ space is squished into a smaller dimension
> - $det(M)<0$ space is flipped like a sheet of paper
### Properties
- Only works for square matrices
- $\det(x,y,z)=-\det(y,x,z)$ `alternating (x,y,z represent rows or cols)`
- $\det(a+b,y,z)=\det(a,y,z)+\det(b,y,z)$ `multilinear`
- $\det(ab,y,z)=a\cdot \det(b,y,z)$ `multilinear`
- $\det(A)=\det(A^T)$
- $\det(0,y,z)=\det(x,0,z)=0$ `0 row/col = 0`
- $\det(x,x,y)=\det(y,y,x)=0$ `identical row/col = 0`
- $\det(B)=\lambda\det(A)$ If $B=\lambda A$
- $\det(\lambda A)=\lambda^n\det(A)$ `for n x n matrix`
- $\det(A)\det(B)=\det(AB)$
### Calculate Determinant
![[Determinant.webp|150]]![[Wedge vs Determinant.webp]]
> [!tip] Used to solve system of equations via [[Creamer's Law]]
### 2D Formula $a=\begin{bmatrix}3&4\\2&1\end{bmatrix},\quad \det(a)=3*1-4*2=-5$
**For 3x3 matrices use expansion by minors method**
$$\det(\begin{bmatrix}2&1&0\\1&3&-1\\0&2&4\end{bmatrix})=2\det\begin{bmatrix}3&-1\\2&4\end{bmatrix}-1\det\begin{bmatrix}1&-1\\0&4\end{bmatrix}+0\det\begin{bmatrix}1&3\\0&2\end{bmatrix}$$
This will reduce multiplications, but it will increase additions same amount
