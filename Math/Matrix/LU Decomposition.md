Fast way to calculate [[Determinant]]
### $A=LU$
- $A$ [[Matrix]]
- $L$ [[Triangular Matrix|Lower Triangular Matrix]] with $1$s on diagonal
- $U$ [[Triangular Matrix|Upper Triangular Matrix]]
### Calculation
- do [[Gaussian Elemination]]
- $U$ = result of gaussian elimination `upper triangular`
- $L$ = record of multipliers used to eliminate entries below diagonal
    - so everytime you do $\text{row}_i=\text{row}_i-\text{factor}\cdot row_j$
    - $\text{factor}$ goes into $L$ at $l_{ij}$, $\text{diag}(L)=1$
    - calculate by dividing elements below pivot by the pivot
##### Example
``` python
U = [ 2   3   1 ]
    [ 4   7   2 ]
    [ 6  18  -1 ]

# 1. gaussian eliminate 1st column below pivot
# by subtracting multiples of the pivot
U = [ 2   3   1 ] - 1 * [2 2 2] # ┐
    [ 4   7   2 ] - 2 * [2 2 2] # ├- 1×n pivot
    [ 6  18  -1 ] - 3 * [2 2 2] # ┘
  # after 1st column elimination
  = [ 2  3  1 ]
    [ 0  1  0 ]
    [ 0  9 -4 ]
# store multiples in L matrix
L = [ 1  0  0 ]
    [ 2  0  0 ]
    [ 3  0  0 ]


# 2. gaussian eliminate 2nd column below pivot (1)
U = [ 2  3  1 ]
    [ 0  1  0 ] - 1 * [1 1 1]
    [ 0  9 -4 ] - 9 * [1 1 1]
  # after 2nd column elimination
  = [ 2  3  1 ]
    [ 0  1  0 ]
    [ 0  0 -4 ]
# store multiples in L matrix
L = [ 1  0  0 ]
    [ 2  1  0 ]
    [ 3  9  0 ]

# 3. gaussian eliminate 3rd column below pivot (-4)
U = [ 2  3  1 ]
    [ 0  1  0 ]
    [ 0  9 -4 ] -      1 * [-4  -4  -4]
  # after 3rd column elimination
  = [ 2  3  1 ]
    [ 0  1  0 ]
    [ 0  0 -4 ]
# store multiples in L matrix
L = [ 1  0  0 ]
    [ 2  1  0 ]
    [ 3  9  1 ]

# FINAL
L = [ 1  0  0 ]
    [ 2  1  0 ]
    [ 3  9  1 ]

U = [ 2  3  1 ]
    [ 0  1  0 ]
    [ 0  0 -4 ]

assert A == L @ U
```
### Use $\det(A)=\det(L)\det(U)$
1.  calculate [[Determinant]] for big matrix `usually super slow`
[[Triangular Matrix]] [[Determinant]] = diagonal
$\text{diag}(L)=1$ so $\det(A)=\det(U)$ which is product of [[Gaussian Elemination]] result matrix's diagonal
2. $Ax=b$ can be solved by solving
    - $Ly=b$ `forward substitution`
    - $Ux=y$ `backward substition`
- for $Ax=b_1,\ Ax=b_2\dots$ unlike [[Gaussian Elemination]] there is no need to re-eliminate with LU decomposition, since multipliers are stored, it's basically [[Gaussian Elemination]] with memory
