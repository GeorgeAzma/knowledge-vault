### Calculate $C_{ij}$
- Remove $i$ row and $j$ column of $M$
- Calculate [[Determinant]]
### Intuition $C_{21}$
remove 
- `x` vector `column`
- `y` coordinates `row`
remains
- `y,z` vectors
- `x,z` coordinates
so output minor/determinant is area spanned by `y,z` vectors projected onto `xz` plane
**Drop a vector, ignore a coordinate → project the remaining face onto the perpendicular plane**
### Calculate 2nd [[Rank]] Minor For 3x4 [[Matrix]] $A_{3\times4}=\begin{bmatrix}2&-1&1&3\\-4&0&1&-2\\-8&-2&5&0\end{bmatrix}$
- choose 2 columns and 2 rows
- create a matrix from intersections of these rows/cols
- calculate [[Determinant]] of that matrix to get 2nd [[Rank]] minor for some columns/rows
- do that for all selections of 2 columns and 2 rows. total 2nd rank minor count is $\dbinom{3}{2}\cdot\dbinom{4}{2}=$

### Notes
- Minor that has the same rank as the matrix is a **basis minor** of the matrix
- If non-zero $r$ ranked minor is found and all $r+1$ ranked minors that contain this $r$ ranked minor are all $0$ then all other $r+1$ and higher ranked minors are also $0$ 