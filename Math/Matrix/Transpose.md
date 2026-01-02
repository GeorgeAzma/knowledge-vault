Flips matrix over a [[Principal Diagonal]]
### Simplifications
- for pure rotations matrices transpose inverses rotation
- $(A^T)^T=A$
- $(cA)^T=cA^T$
- $(A+B)^T=A^T+B^T$
- $(AB)^T=B^TA^T$
- $(A^T)^{-1}=(A^{-1})^T$
- $\det(A^T)=\det(A)$
### Properties
- $A^TA,\ AA^T$ 
    - gives [[Dot Product]] for each column pair
    - so measures how aligned each columns pairs are
    - gives [[Symmetric Matrix]] `since pairs are symetrical`
> [!example] $A=\begin{bmatrix}1/\sqrt2&1/\sqrt2\\1/\sqrt2&-1/\sqrt2\end{bmatrix}$ then $A^TA=\begin{bmatrix}1&0\\0&1\end{bmatrix}$ since columns are orthonormal
