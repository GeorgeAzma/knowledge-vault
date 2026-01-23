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
