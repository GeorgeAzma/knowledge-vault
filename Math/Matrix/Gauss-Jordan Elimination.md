[[Matrix Decomposition]] method
[[Gaussian Elemination]], but directly gives solution without back-substitution

1. do [[Gaussian Elemination]]
2. make pivots $1$ by scaling rows by constant
3. eliminate columns above pivot by subtracting the row's multiple
``` python
 2x +  y +  z = 5
 4x + 3y +  z = 11
-2x +  y + 2z = 1

# augmented matrix
[  2  1  1 |  5 ]
[  4  3  1 | 11 ]
[ -2  1  2 |  1 ]

# make 1st pivot = 1
R1 = R1 / 2
[  1  0.5  0.5 | 2.5 ]
[  4  3    1   | 11  ]
[ -2  1    2   | 1   ]

# eliminate 1st column below pivot
R2 = R2 - 4 * R1
R3 = R3 + 2 * R1
[ 1  0.5  0.5 | 2.5 ]
[ 0    1   -1 |   1 ]
[ 0    2    3 |   6 ]

# eliminate 2nd column above & below pivot
R1 = R1 - 0.5 * R2
R3 = R3 -   2 * R2
[ 1  0   1 | 2 ]
[ 0  1  -1 | 1 ]
[ 0  0   5 | 4 ]

# make 3rd pivot = 1
R3 = R3 / 5
[ 1  0   1 |   2 ]
[ 0  1  -1 |   1 ]
[ 0  0   1 | 0.8 ]

# eliminate above 3rd pivot
R1 = R1 - 1 * R3
R2 = R2 + 1 * R3
[ 1 0 0 | 1.2 ]
[ 0 1 0 | 1.8 ]
[ 0 0 1 | 0.8 ]

(x, y, z) = (1.2, 1.8, 0.8)
```