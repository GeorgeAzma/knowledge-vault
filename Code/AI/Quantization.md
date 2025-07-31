### q4_0
``` python
a, b  = -1, 2
r = max(|a|, |b|) # for symmetric range
w = [-a...b] # but assume weights in [-2; 2] symmetric range
q_min, q_max = -7, 7 # 4-bit range for q4_0
# scale factor that maps w => w_q integers
S = r / (q_max - q_min) = 2 / 7 # stored as f32 per block
w_q = round(w / S) = [q_min...q_max] # [-7...7]
# since weights in [-2; -1] range don't exist
# bins [-7; -4] are wasted

# for x32 block: 16*32 / (4*32 + 16) = 3.555x compression
# overhead: 16 / 4*32 = 12.5%
def Block:
    w: [i4; 32..256]
    S: f16
```
### q4_1
``` python
a, b  = -1, 2
w = [-a...b] # assymetric range
q_min, q_max = -7, 7 # 4-bit range for q4_1
# scale factor that maps w => w_q integers
S = (b - a) / (q_max - q_min) = 3 / 14 # stored as f32 per block
# zero-point shift, stored as f32 per block
Z = round(-a / S) + q_min = -2
w_q = round(w / S) + Z = [q_min...q_max] # [-7...7]

# for x32 block: 16*32 / (4*32 + 16 + 16) = 3.2x compression
# overhead: (16+16) / 4*32 = 25%
def Block:
    w: [i4; 16..256] # 2-32b
    S: f16 # 2b
    a: f16 # 2b
```
### q4_K
``` python
def Block: # 32*4 + 2*8 = 144 bits
    w: [i4; 32..256]
    S: i8,
    a: i8,

# for x32 block: 16*32*8 / (144*8 + 16 + 16) = 3.45x compression
# overhead: ((8+8)*8+16+16) / (4*32*8) = 15.625%
def SuperBlock:
    blocks: [Block; 8] # 6*8 = 48b
    S: f16, # 2b
    a: f16, # 2b
```
### q4_I
K-quant weights by importance
youtu.be/vW30o4U9BFEhttps://youtu.be/vW30o4U9BFEhttps://youtu.be/vW30o4U9BFE
### XS,S,M,L,XL Variants
use mixed precision for weights based on importance
`e.g. q4_k, q5_k, q6_k, f16, f32`