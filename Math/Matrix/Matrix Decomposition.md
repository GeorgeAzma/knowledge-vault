method for converting [[Matrix]] into [[Row-Echelon Form]]
> [!example] If we only have 1 unknown term we can find it
> In the [[Coefficient Matrix]] where lower triangle is all $0$
> there is 1 unknown term at the last row
> if we find that, it becomes known
> so row above which had 2 unknown terms
> now has 1 unknown term and is solvable
> we solve that row and that allows us to solve
> next row above us and so on until it's all solved
> $\left\{\begin{array}{}1x+2y=6\\0x+3y=9\end{array}\right.$
> $\begin{vmatrix}1&2\\0&3\end{vmatrix}=\begin{vmatrix}1x+2y=6\\0x+3y=9\end{vmatrix}$
> $3y=9$ so $y=3$
> Now $y$ is known so $1x+2y=6$ is $1x+6=6$ so $x=0$
> So linear system of equations need to have [[Coefficient Matrix]] in [[Row-Echelon Form]] to be solvable
### Methods
- [[Gaussian Elemination]]
- [[Gauss-Jordan Elimination]]
- [[Creamer's Law]]
- **Cholesky**
- **LU Decomposition**
