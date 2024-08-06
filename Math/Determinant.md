Multiplying [[Standard Basis Vector]][[s]] by this matrix makes any area x6 larger
So $6$ is a determinant, Works for any vector/matrix not just SBVs
![[Determinant Scaling Space.webp]]
> [!note] 
> - If $det(M)=0$ then space is being squished into a smaller dimension
> - If $det(M)<0$ then space is being flipped like a sheet of paper
### Calculate Determinant
![[Determinant.webp|256]]
![[Wedge vs Determinant 1.webp]]

> [!tip] Used to solve system of equations via [[Creamer's Law]]
### Properties
- **Alternating** $det(x,y,z)=-det(y,x,z)$
- **Multilinear**
	- If $x=a+b$ then $det(x,y,z)=det(a,y,z)+det(b,y,z)$
	- If $x=ab$ then $det(x,y,z)=a*det(b,y,z)$
- **Square** Only works for square matrices or $N$ dimensional $N$ element vectors
### Formula $a=\begin{bmatrix}3&4\\2&1\end{bmatrix},\quad det(a)=3*1-4*2=-5$
**For 3x3 matrices you can use expansion by minors method:**
$$\det(\begin{bmatrix} 2 & 1 & 0 \\ 1 & 3 & -1 \\ 0 & 2 & 4 \\ \end{bmatrix})=2 \det \begin{bmatrix}3&-1\\2&4\end{bmatrix} - 1 \det \begin{bmatrix}1&-1\\0&4\end{bmatrix} + 0 \det \begin{bmatrix}1&3\\0&2\end{bmatrix}$$
This will reduce multiplications, tho it will increase additions the same amount
