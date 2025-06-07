``` python
torch.nn.Conv2d(in_channels, out_chanels, kernel_size, stride, padding, 
                dilation, groups, bias, padding_mode, device, dtype)
'batch_size' B
'in_channels' C_i # 3 for (R,G,B)
'out_channels' C_o
'kernel_size' N_k # usually 3
'stride' S=1 # bigger = smaller output
'padding' P=0 # adds 0 at input edges
'padding_mode' zeros/reflect/replicate/circular
'dilation' D=1 # adds space between kernel values, spreading it out
'bias' b=False
'groups' G
'output' o = b(C_{o_j}) +  Σ_{n=0}^{C_i-1}k(C_{o_j},n) ★ i(N_i,n)

input.shape = (B, C_i, N_i)
kernel_weights.shape = (B, C_o, C_i / G, N_k)

k = G / (C_i * N_k)
kernel_weights = torch.rand(-k ** 0.5, k ** 0.5)

N_o = math.floor((N_i + 2P - D(N_k - 1) - 1) / S + 1)
output.shape = (B, C_o, N_o)

### Convolution 1D
 kernel         input        output
[1, 2, 3] -> [1, 2, 3, 4] = [14, 20]
[1 2 3]     [1 2 3]
[1 2 3 4] [1 2 3 4]
[1+4+9      2+6+12]

### Convolution 1D (pad = 1)
 kernel         input            output
[1, 2, 3] -> [1, 2, 3, 4] = [8, 14, 20, 11]
[1 2 3]         [1 2 3]         [1 2 3]          [1 2 3]
[0 1 2 3 4 0] [0 1 2 3 4 0] [0 1 2 3 4 0] [0 1 2 3 4 0]
[0+2+6           1+4+9           2+6+12          3+8+0]

### Convolution 1D (dilation = 2)
 kernel           input       output
[1, 2, 3] -> [1, 2, 3, 4, 5] = [22]
[1 _ 2 _ 3]
[1 2 3 4 5]
[1 + 6 + 15]

### Convolution 1D (stride = 2)
 kernel           input       output
[1, 2, 3] -> [1, 2, 3, 4, 5] = [14, 26]
[1 2 3]         [1 2 3]
[1 2 3 4 5] [1 2 3 4 5]
[1+4+9          3+8+15]

### Convolution 2D (pad = 1)
  kernel           input                           output
[[1, 2, 3]] -> [[1, 2, 3, 4]] = [[0, 0, 0, 0], [8, 14, 20, 11], [0, 0, 0, 0]]
[0 0 0 0 0 0]
[0 1 2 3 4 0]
[0 0 0 0 0 0]


torch.ConvTranspose2d(in_channels, out_chanels, kernel_size, stride, padding, 
                      output_padding, groups, bias, dilation, padding_mode, device, dtype)
'output_padding' P_o=0 # add 0 at output edges
'stride' # unlike Conv2d stride here is for output

N_o= (N_i - 1)S - 2P + D(N_k - 1) + P_o + 1
output.shape = (B, C_o, N_o)

### Transposed Convolution 1D
[1, 2] -> [1, 2, 3] = [1, 4, 7, 6]
[2 1]     [2 1]     [2 1]     [2 1]
[_ 1 2 3] [1 2 3] [1 2 3] [1 2 3 _]
[0+1       2+2       4+3      6+0]

### Transposed Convolution 1D (padding=1)
[1, 2] -> [1, 2, 3] = [4, 7]
[0 2 1 0] [0 2 1 0]
[_ 1 2 3] [1 2 3 _]
[0+2+2     0+4+3]

### Transposed Convolution 2D
| input | kernl |
|  0 1  |  4 1  |
|  2 3  |  2 3  |
N_o = (2-1)1 - 2*2 + 1(2-1) + 0 + 1 = 1 - 4 + 1 + 1 = 1
output = dot(input, Transpose(kernel)) = [16] # in this case

### Transposed Convolution 2D (padding=1)
| input | kernl |
|  0 1  |  4 1  |
|  2 3  |  2 3  |
N_o = (2-1)1 - 2*1 + 1(2-1) + 0 + 1 = 1 - 2 + 1 + 1 = 3
|0 0 0|   |0 4 1|   |0 0 0|   |0  0 0|   |0  4 1|
|0 0 0| + |0 2 3| + |8 2 0| + |0 12 3| = |8 16 6|
|0 0 0|   |0 0 0|   |4 6 0|   |0  6 9|   |4 12 9|

```
### Transposed Convolution
![[Transposed Conv2D.webp]]
> [!note] Looks like a [[Kronecker Product]] except $S\neq N_k$
- [[Cross-Correlation]] is like kernel filter
- [[Convolution]] = [[Cross-Correlation]] in machine learning
> [!note] in math [[Convolution]] kernel is flipped vertically and horizontally `transposed`

![[Convolutional Neural Network.webp]]