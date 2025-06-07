[[Matrix Decomposition]] method
Tries to make lower triangle of coefficient [[Matrix]] all $0$
**Using 3 basic row operations**
- Subtract row from another
- Swapping rows
- Multiplying a row by nonzero scalar
> [!note] These operations are also applied to row's answer

> [!example] 
> $$
> \begin{array}{l}
> x+y+3z=6 \\
> 2x+3y-4z=-2 \\
> 3x-2y+5z=7 \\
> \end{array}
> $$
> Coefficient [[Matrix]]
> $$
> \begin{vmatrix}
> 1 & 1 & 3 \\
> 2 & 3 & -4 \\
> 3 & -2 & 5
> \end{vmatrix}=\begin{vmatrix}6\\-2\\7\end{vmatrix}
> $$
> - $R_2=R_2-2R_1$ and $R_3=R_3-3R_1$
> $$
> \begin{vmatrix}
> 1 & 1 & 3 \\
> 2 & 3 & -4 \\
> 3 & -2 & 5
> \end{vmatrix}
> \begin{vmatrix}
> 1 & 0 & 0 \\
> -2 & 1 & 0 \\
> -3 & 0 & 1
> \end{vmatrix}=
> \begin{vmatrix}
> 1 & 1 & 3 \\
> 0 & 1 & -10 \\
> 0 & -5 & -4
> \end{vmatrix}=\begin{vmatrix}6\\-14\\-11\end{vmatrix}
> $$
> - $R_3=R_3+5R_2$
> $$
> \begin{vmatrix}
> 1 & 1 & 3 \\
> 0 & 1 & -10 \\
> 0 & -5 & -4
> \end{vmatrix}
> \begin{vmatrix}
> 1 & 0 & 0 \\
> 0 & 1 & 0 \\
> 0 & 5 & 1
> \end{vmatrix}=
> \begin{vmatrix}
> 1 & 1 & 3 \\
> 0 & 1 & -10 \\
> 0 & 0 & -54
> \end{vmatrix}=\begin{vmatrix}6\\-14\\-81\end{vmatrix}
> $$
> - **Solve**
> 	- $-54z=-81$ so $z=81/54=\frac32$
> 	- $y-10z=y-15=-14$ so $y=1$
> 	- $x+y+3z=x+1+4.5=x+5.5=6$ so $x=0.5$
> - Final solution $(x,y,z)=(\frac{1}{2},1,\frac{3}{2})$
