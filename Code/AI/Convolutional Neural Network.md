### Parameters
- **batch size** $B$
- **input channels** $C_i=3$ for R,G,B
- **output channels** $C_o$
- **input** $i$ (size $N_i$) (shape $(B,C_i,N_i)$)
- **kernel/weights** $k$ (size $N_k$) basically a filter (shape $(B,C_o,\frac{C_i}{G},N_k)$)
> [!note] sampled from $U(-\sqrt{k},\sqrt{k})$ where $k=\frac{G}{C_iN_k}$
- **stride** $S$ bigger stride means smaller output `default: 1`
- **padding** $P$ adds extra zeros at the edges of kernel (or mirrors) `default: 0`
- **output padding** $P_o$ adds extra zeros at the edges of output `default: 0`
- **padding mode** zeros/reflect/replicate/circular `default: zeros`
- **dilation** $D$ adds space between kernel values, spreading it out `default: 1`
- **bias** $b$ `default: false`
> [!note] sampled from $U(-\sqrt{k},\sqrt{k})$ where $k=\frac{G}{C_iN_k}$
- **groups** $G$
- **output** $o=b(C_{o_j})+\sum_{n=0}^{C_i-1}k(C_{o_j},n)\star i(N_i,n)$ (size $N_o$) (shape $(B,C_o,N_o)$)
#### Output Size $N_o=\lfloor(N_i+2P-D(N_k-1)-1)/S+1\rfloor$
> [!note] Works for all dimensions

![[Convolution vs Cross Correlation vs Auto Correlation.webp]]
- **[[Cross-Correlation]] is basically a kernel filter
- **[[Convolution]] is exactly the same as [[Cross-Correlation]] in machine learning
  but in mathematics [[Convolution]] kernel is flipped vertically and horizontally (transposed)**
###### Convolution 1D
`[1, 2, 3] -> [1, 2, 3, 4] = [14, 20]`
`[1 2 3]     [1 2 3]`
`[1 2 3 4] [1 2 3 4]`
`[1+4+9      2+6+12]`
###### Convolution 1D `padding=1 padded with zeros`
`[1, 2, 3] -> [1, 2, 3, 4] = [8, 14, 20, 11]`
`[1 2 3]         [1 2 3]         [1 2 3]          [1 2 3]`
`[0 1 2 3 4 0] [0 1 2 3 4 0] [0 1 2 3 4 0] [0 1 2 3 4 0]`
`[0+2+6           1+4+9           2+6+12          3+8+0]`
###### Convolution 1D `dilation=2`
`[1, 2, 3] -> [1, 2, 3, 4, 5] = [22]`
`[1 _ 2 _ 3]`
`[1 2 3 4 5]`
`[1 + 6 + 15]`
###### Convolution 1D `stride=2`
`[1, 2, 3] -> [1, 2, 3, 4, 5] = [14, 26]`
`[1 2 3]         [1 2 3]`
`[1 2 3 4 5] [1 2 3 4 5]`
`[1+4+9          3+8+15]`
###### Convolution 2D  `padding=1 padded with zeros`
`[[1, 2, 3]] -> [[1, 2, 3, 4]] = [[0, 0, 0, 0], [8, 14, 20, 11], [0, 0, 0, 0]]`
`[0 0 0 0 0 0]`
`[0 1 2 3 4 0]`
`[0 0 0 0 0 0]`
![[Convolutional Neural Network.webp|700]]
### Transposed Convolution
![[Transposed Conv2D.webp]]
> [!note] Looks like a [[Kronecker Product]] except $S\neq N_k$
#### Output Size $N_o=(N_i-1)S-2P+D(N_k-1)+P_o+1$
###### Transposed Convolution 1D
`[1, 2] -> [1, 2, 3] = [1, 4, 7, 6]`
`[2 1]     [2 1]     [2 1]     [2 1]`
`[_ 1 2 3] [1 2 3] [1 2 3] [1 2 3 _]`
`[0+1       2+2       4+3      6+0]`
###### Transposed Convolution 1D `padding=1`
`[1, 2] -> [1, 2, 3] = [4, 7]`
`[0 2 1 0] [0 2 1 0]`
`[_ 1 2 3] [1 2 3 _]`
`[0+2+2     0+4+3]`
###### Transposed Convolution 2D
```
| input | kernl |
|  0 1  |  4 1  |
|  2 3  |  2 3  |
No = (2-1)1 - 2*2 + 1(2-1) + 0 + 1 = 1 - 4 + 1 + 1 = 1
in this case output = dot(input, Transpose(kernel)) = [16]
```
###### Transposed Convolution 2D `padding=1`
```
| input | kernl |
|  0 1  |  4 1  |
|  2 3  |  2 3  |
No = (2-1)1 - 2*1 + 1(2-1) + 0 + 1 = 1 - 2 + 1 + 1 = 3
|0 0 0|   |0 4 1|   |0 0 0|   |0  0 0|   |0  4 1|
|0 0 0| + |0 2 3| + |8 2 0| + |0 12 3| = |8 16 6|
|0 0 0|   |0 0 0|   |4 6 0|   |0  6 9|   |4 12 9|
```
