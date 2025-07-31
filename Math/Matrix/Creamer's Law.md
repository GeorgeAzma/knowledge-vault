simple [[matrix decomposition]] method for solving system of linear equations
> [!example] 
> $$
> \begin{array}{l}
> x+y+3z=6 \\
> 2x+3y-4z=-2 \\
> 3x-2y+5z=7 \\
> \end{array}
> $$
> - Compute [[Determinant]] $\Delta$ of 3x3 coefficient matrix
> $$
> \Delta=\begin{vmatrix}
> 1 & 1 & 3 \\
> 2 & 3 & -4 \\
> 3 & -2 & 5
> \end{vmatrix}=-54
> $$
> - Replace 1st column by the answer vector $(6,-2,7)$ and find determinant
> $$
> \Delta_x=\begin{vmatrix}
> 6 & 1 & 3 \\
> -2 & 3 & -4 \\
> 7 & -2 & 5
> \end{vmatrix}=-27
> $$
> - Do that for other 2 columns $\Delta_x=-27,\Delta_y=-54,\Delta_z=-81$
> - Divide those by $\Delta$ $(\frac{-27}{-54},\frac{-54}{-54},\frac{-81}{-54})=(\frac{1}{2},1,\frac{3}{2})$
> - Final solution $(x,y,z)=(\frac{1}{2},1,\frac{3}{2})$
