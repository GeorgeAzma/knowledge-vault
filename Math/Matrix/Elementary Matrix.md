[[Matrix]] that differs by 1 [[Elementary Operation]] from [[Identity Matrix]]
### [[Gaussian Elemination]]
operations in gaussian elimination can be represented using product of elementary matrices 
``` python
A = [1 1 1 |  6]
    [2 2 3 | 14]
    [1 2 3 | 12]

# eliminate 1st column below pivot
R2 = R2 - 2 * R1
E1 = # elementary matrix representing R2 = R2 - 2 * R1
[  1 0 0 ]
[ -2 1 0 ]
[  0 0 1 ]

A = [1 1 1 |  6]
    [0 0 1 |  2]
    [1 2 3 | 12]

R3 = R3 - R1
E2 = # elementary matrix representing R3 - R1
[  1 0 0 ]
[  0 1 0 ]
[ -1 0 1 ]

A = [1 1 1 | 6]
    [0 0 1 | 2]
    [0 1 2 | 6]

swap(R2, R3)
E3 = # elementary matrix representing swap(R2, R3)
[ 1 0 0 ]
[ 0 0 1 ]
[ 0 1 0 ]

[1 1 1 | 6]
[0 1 2 | 6]
[0 0 1 | 2]
```