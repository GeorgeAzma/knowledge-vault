[[Matrix Decomposition]] method

**Uses 3 row operations `that keep system equivalent`**
- swap rows
- add/subtract multiples of rows
- multiply row by non-zero constant
``` python
 x +  y +  z = 6
2x + 2y + 3z = 14
 x + 2y + 3z = 12

# augmented matrix
[1 1 1 |  6]
[2 2 3 | 14]
[1 2 3 | 12]

# eliminate 1st column below pivot
R2 = R2 - 2*R1
R3 = R3 - R1

[1 1 1 | 6]
[0 0 1 | 2]
[0 1 2 | 6]

# eliminate 2nd column below pivot
# Swap R2 <-> R3 to make pivot non-zero
[1 1 1 | 6]
[0 1 2 | 6]
[0 0 1 | 2]

# substitute
z = 2
y + 2 * 2 = 6; y = 2
x + y + z = 6; z = 2
(x, y, z) = (2, 2 ,2)
```