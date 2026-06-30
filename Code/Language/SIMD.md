### [[x86 Assembly]]
##### Suffix
``` rust
B: u8 // byte 
W: u16 // word
D: u32 // double-word
S: f32 // scalar
Q: u64 // quad-word
D: f64 // double
DQ: u128/f128 // double-quad-word

P: f32x4, f32x8... // packed

A: aligned // data size multiple address
U: unaligned // non data size multiple address

H: high // operates on high bits (e.g. low 2xf32 of 4xf32)
L: low // operates on low bits
```
- `S` scalar `MOVSD xmm0,` would move single double `f64` into `xmm0[0]`
##### Prefix
- `P` packed
``` c
V // AVX / AVX2 [256 bit] (ymm0-15 registers)
P // packed
```
### Registers
``` python
ymm[0:15] # AVX Regs [256 bit]
xmm[0:15] # SSE Regs [128 bit] (lower bits of ymm[0:15])

zmm[0:32] # AVX-512 [512 bit] (rarely supported)
```
##### Examples
- `VADDPS` add `8xf32`
- `MULPD` multiply `2xf64`
- `SHUFPS xmm0, xmm1, imm8` where `xmm0 = 0123` `xmm1 = 4567`
    - `imm8 = 11_10_01_00` 
      `xmm0 = [xmm1[imm8[8:6]], xmm1[imm8[6:4]], xmm0[imm8[4:2]], xmm0[imm8[2:0]]]`
      `xmm0 = 4523 (lsb)`
- `SHUFPS xmm0, xmm0, 00_01_10_11` reverse `xmm0` 
- `PSHUFLW xmm0, xmm1, 11_00_01_01` 
      `xmm0 = [xmm1[8:4], xmm1[imm8[8:6]], xmm1[imm8[6:4]], xmm1[imm8[4:2]], xmm1[imm8[2:0]]]`
      `xmm0 = 01234766` if `xmm1 = 01234567`
- `HADDPD xmm0, xmm0` `xmm0 = xmm0[128:64] + xmm0[64:0]`

|  Instruction  |
| :-----------: |
|     `MOV`     |
| `ADD/SUB/MUL` |
| `AND/OR/XOR`  |
|    `SQRT`     |
|     `CMP`     |
|    `SHUF`     |
|    `BLEND`    |
|     `CVT`     |
