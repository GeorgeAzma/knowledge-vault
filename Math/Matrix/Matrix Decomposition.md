For solving linear system of equations, represented as coefficient [[matrix]]
It Tries to make lower triangle of the coefficient [[matrix]] all $0$
> [!example] If we only have 1 unknown term we can find it
> In the [[Matrix]] where lower triangle is all $0$
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
### [[Creamer's Law]]
### [[Gauss-Jordan Elimination]]
> [!todo] There are better algorithms like Cholesky, Guassian Elimination, LU Decomposition
