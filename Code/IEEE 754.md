**16 bit** `1 sign | +5 exponent | 10 mantissa`
**32 bit** `1 sign | +8 exponent | 23 mantissa`
**64 bit** `1 sign | 11 exponent | 52 mantissa`
> [!note] This is fp16, there is also bfloat16 variant with `1 sign | 8 exponent | 7 mantissa`
### Formula $(-1)^{sign}(1+mantissa)2^{exponent-bias}$
- $bias=\exp_2(exponent\space bits-1)-1$
	- **16 bit** 15
	- **32 bit** 127
	- **64 bit** 1023
- $mantissa$ `1101` = $1*2^{-1}+1*2^{-2}+0*2^{-3}+1*2^{-4}$
> [!note] Special cases
> - $0$ all bits 0
> - $\infty$ all exponent bits 1, all matissa bits 0 `can be positive or negative`
> - $NaN$ all exponent bits 1 `and not infinity`

> [!example] $0.5=(-1)^0(1+0)2^{126-127}=\frac{1}{2}=0\space 0111 1110\space 000 0000 0000 0000 0000 0000\space$

> [!note] Values between -1 to 1 start with `S01` `S for sign`
