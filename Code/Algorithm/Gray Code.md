Binary sequence where only 1 bit changes
Used in [[Karnaugh Map]]
> [!example] 00, 01, 11, 10

``` rust
fn bin2gray(x: u32) -> u32 {
	x ^ (x >> 1)
}

fn gray2bin(mut x: u32) -> u32 {
	x ^= x >> 16;
	x ^= x >> 8;
	x ^= x >> 4;
	x ^= x >> 2;
	x ^= x >> 1;
	x
}
```
