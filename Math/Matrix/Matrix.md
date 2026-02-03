![[Matrix.webp]]
Each column of a matrix represents a [[Standard Basis Vector]]
If you change matrix column from [[Standard Basis Vector]]
space will get scaled and/or rotated
![[Matrix Transformation.webp]]
### Multiplication
![[Matrix Multiplication.webp]]
![[Vector Matrix Multiplication.webp]]
### Operations
- [[Transpose]]
- [[Determinant]]
- [[Inverse]]
- [[Adjoint]]
- [[Kronecker Product]]
- [[Hadamard Product]]
- [[Matrix Decomposition]]
- **Trace** sum of diagonal elements
### Types
- [[Identity Matrix]]
- [[Diagonal Matrix]]
- [[Diagonal Matrix#Scalar Matrix|Scalar Matrix]]
- [[Symmetric Matrix]]
- [[Orthogonal Matrix]]
- [[Hermitian Matrix]]
- [[Jacobian Matrix]]
- [[Hessian Matrix]]
- [[Unitary Matrix]]
- [[Positive Definite Matrix]]
- [[Triangular Matrix|Upper/Lower Triangular Matrix]]
- [[Skew-Symmetric Matrix]] `diag=0` and tris are equal but negated
- [[Adjacency Matrix]]
- [[Incidence Matrix]]
- **Stochastic Matrix** rows are [[Probability]] distributions
- **Diagonal Dominant Matrix** abs(sum(diag)) > sum(abs(non-diag))
- **Banded Matrix** non-zero values reasamble thick diagonal
### [[Rank]] $M_{rank}=MaxDimensionCount(Mx)$
### Operation Intuition
- $C^{-1}AC$ matrix $A$ written in the basis vectors of $C$
- $A^Tx$ [[Dot Product]]
- $x^TAy$ billinear form $x=\begin{bmatrix}x_1\\ x_2\\ x_3\end{bmatrix},\quad y=\begin{bmatrix}y_1\\ y_2\end{bmatrix},A=\begin{bmatrix}a_{11}&a_{12}\\a_{21}&a_{22}\\a_{31}&a_{32}\end{bmatrix}$
  $x^TAy=a_{11}x_1y_1+a_{21}x_2y_1+a_{31}x_3y_1+a_{12}x_1y_2+a_{22}x_2y_2+a_{32}x_3y_2$
- $x^TAx$ quadratic form `billinear form with x=y`
  $x^TAx=a_{11}x_1^2+a_{21}x_1x_2+a_{31}x_1x_3+a_{12}x_1x_2+a_{22}x_2^2+a_{32}x_2x_3$
- $J_n=\begin{bmatrix}1&1&\cdots &1\\1&1&\cdots&1\\ \vdots &\vdots &\ddots &\vdots\\1&1&\cdots &1\end{bmatrix}$ $J_nA$ is sum of columns of $A$, divide by $n$ to get [[Mean]]
