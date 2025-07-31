**16 bit** `1 sign | +5 exponent | 10 mantissa`
**32 bit** `1 sign | +8 exponent | 23 mantissa`
**64 bit** `1 sign | 11 exponent | 52 mantissa`
> [!note] This is fp16, there is also bfloat16 variant with `1 sign | 8 exponent | 7 mantissa`
### Formula $(-1)^\text{sign}(1+\text{mantissa})2^{\text{exponent}-bias}$
- $\text{bias}=2^{\text{exponent bits}-1}-1$
	- **16 bit** 15
	- **32 bit** 127
	- **64 bit** 1023
- $\text{mantissa}$ `1101` = $1*2^{-1}+1*2^{-2}+0*2^{-3}+1*2^{-4}$
> [!note] Special cases
> - $0$ all bits 0
> - $\infty$ all exponent bits 1, all mantissa bits 0 `sign 0 or 1`
> - $NaN$ all exponent bits 1 `and not infinity`

> [!example] $0.5=(-1)^0(1+0)2^{126-127}=\frac{1}{2}=0\ 0111 1110\ 000 0000 0000 0000 0000 0000$

> [!note] Values between -1 to 1 start with `S01` `S for sign`
