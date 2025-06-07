### C
```c
// splitmix32 with better constants
uint32_t rand32() {
    uint32_t x = (seed += 0x9E3779B9);
    x ^= x >> 16; 
    x *= 0x21F0AAAD;
    x ^= x >> 15; 
    x *= 0x735A2D97;
    x ^= x >> 15;
    return x;
}

uint64_t rand64(uint64_t x) {
  uint64_t x = (seed += 0x9E3779B97F4A7C15);
  x = (x ^ (x >> 30)) * 0xBF58476D1CE4E5B9;
  x = (x ^ (x >> 27)) * 0x94D049BB133111EB;
  return x ^ (x >> 31);
}
```
### Rust
``` rust
// splitmix32 with better constants
fn rand32() -> u32 {
	seed = seed.wrapping_add(0x9E3779B9);
    let mut x = seed;
    x = (x ^ (x >> 16)).wrapping_mul(0x21F0AAAD);
    x = (x ^ (x >> 15)).wrapping_mul(0x735A2D97);
	x ^= x >> 15;
    x
}

fn rand64() -> u64 {
  seed = seed.wrapping_add(0x9E3779B97F4A7C15);
  let mut x = seed;
  x = (x ^ (x >> 30)).wrapping_mul(0xBF58476D1CE4E5B9);
  x = (x ^ (x >> 27)).wrapping_mul(0x94D049BB133111EB);
  x ^ (x >> 31)
}
```
Circle sampling
``` rust
fn rand_circle() -> (f32, f32) {
	let theta = rand01() * 2.0 * PI;
	let mut r = rand01().sqrt();
	return (r * theta.cos(), r * theta.sin())
}

// How this works: youtu.be/4y_nmpv-9lI?t=634
// Short explanation: Circle is bunch of pizza slices
// rombus is 2 slices joined, you can sample rombus
// by interpolating sides, if point is in second slice
// reflect it so that it ends up in first slice/triangle
// But slice in circle is infinitely thin 
// so if you interpolate like this with t0 t1 
// you get point that is t0 + t1 apart from current slice direction
// or rand0 + rand1 apart if you sample randomly
// Note: rejection sampling maybe faster if rand() is fast
fn rand_circle() -> (f32, f32) {
	let theta = rand01() * 2.0 * PI;
	let mut r = rand01() + rand01();
	if r >= 1.0 {
		r = 2.0 - r;
	}
	return (r * theta.cos(), r * theta.sin())
}
```
### Others
``` rust
fn rand8() -> Self {
    seed = seed.wrapping_add(0x5D);
    let mut x = seed;
    x = (x ^ (x >> 4)).wrapping_mul(0x1D);
    x = (x ^ (x >> 3)).wrapping_mul(0x3B);
    x ^= x >> 3;
    x
}

fn rand() -> Self {
    seed = seed.wrapping_add(0x9E3D);
    let mut x = seed;
    x = (x ^ (x >> 8)).wrapping_mul(0x2F1D);
    x = (x ^ (x >> 7)).wrapping_mul(0x623B);
    x ^= x >> 7;
    x
}
```
