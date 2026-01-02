Measures volume scaling after linear transformation with a matrix
![[Determinant Scaling Space.webp]]
> [!note] 
> - $\det(M)=0$ space is squished into a smaller dimension `singular matrix`
> - $\det(M)<0$ space is flipped like a sheet of paper

> [!example] rotation matrix $\det=1$
> $\begin{bmatrix}\cos\theta&-\sin\theta\\\sin\theta&\cos\theta\end{bmatrix}=\cos^2\theta-(-\sin\theta\sin\theta)=\cos^2\theta+\sin^2\theta=1$
### Properties
- Only works for [[Square Matrix|square matrices]]
- $\det(x,y,z)=-\det(y,x,z)$ `alternating (x,y,z represent rows or cols)`
- $\det(a+b,y,z)=\det(a,y,z)+\det(b,y,z)$ `multilinear`
- $\det(ab,y,z)=a\cdot \det(b,y,z)$ `multilinear`
    - if rows/cols have common devisor, you can move divisors of each column out and multiply as scalars
    $\begin{bmatrix}7&0&14\\-5&5&0\\8&0&4\end{bmatrix}=\begin{bmatrix}7\cdot1&7\cdot0&7\cdot2\\5\cdot-1&5\cdot1&5\cdot0\\4\cdot2&4\cdot0&4\cdot1\end{bmatrix}=7\cdot5\cdot4\begin{bmatrix}1&0&2\\-1&1&0\\2&0&1\end{bmatrix}=140\begin{bmatrix}1&0&2\\-1&1&0\\2&0&1\end{bmatrix}$
- $\det(A)=\det(A^T)$
- $\det(A^{-1})=1/\det(A)$
- $\det(0,y,z)=\det(x,0,z)=0$
- $\det(x,x,y)=\det(y,y,x)=0$
- $\det(B)=\lambda\det(A)$ If $B=\lambda A$
- $\det(\lambda A)=\lambda^n\det(A)$ `for n x n matrix`
- $\det(A)\det(B)=\det(AB)$
- $\det\begin{pmatrix}A&0\\0&B\end{pmatrix}=\det(A)\det(B)$
- $\det(x,y,z)=\det(x+y,y,z)=\det(x,y,z+2x)$
- $A_x\cdot A^*_x=\det(A)$ `dot product of any row/col and it's cofactor equals determinant`
- $A_x\cdot A^*_y=0$ `dot product of any row/col and other row/col's cofactor equals determinant`
- determinant is length of [[Eigenvalue]][[s]] $\det(A)=\sqrt{\lambda_1^2+\lambda_2^2+\dots+\lambda_n^2}$
### Calculate Determinant
![[Determinant.webp|150]]![[Wedge vs Determinant.webp]]
> [!tip] Used to solve system of equations via [[Creamer's Law]]
### 2D Formula $a=\begin{bmatrix}3&4\\2&1\end{bmatrix},\quad \det(a)=3*1-4*2=-5$
**For 3x3 matrices use expansion by minors method**
$$\det(\begin{bmatrix}2&1&0\\1&3&-1\\0&2&4\end{bmatrix})=2\det\begin{bmatrix}3&-1\\2&4\end{bmatrix}-1\det\begin{bmatrix}1&-1\\0&4\end{bmatrix}+0\det\begin{bmatrix}1&3\\0&2\end{bmatrix}$$
This will reduce multiplications, but it will increase additions same amount
