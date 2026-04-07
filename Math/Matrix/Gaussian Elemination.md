[[Matrix Decomposition]] method using [[Elementary Operation]][[s]] 
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

def gaussian_elimination(A):
    n = len(A)
    det = 1.0
    sign = 1

    for i in range(n):
        # pivot
        max_row = max(range(i, n), key=lambda r: abs(A[r][i]))
        if abs(A[max_row][i]) < 1e-12:
            return 0, A

        if i != max_row:
            A[i], A[max_row] = A[max_row], A[i]
            sign *= -1 # swap flips sign(|A|)

        pivot = A[i][i]
        det *= pivot

        # eliminate below
        for r in range(i+1, n):
            factor = A[r][i] / pivot
            for c in range(i, n):
                A[r][c] -= factor * A[i][c]

    return det * sign, A
```
