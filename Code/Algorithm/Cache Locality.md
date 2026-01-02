`len(cache_line) = 64 bytes`
### False Sharing
Threads fight over shared cache lines, so make sure independent elements are in separate cache lines `x10 speedup`
``` rust
struct Bad {
    done: AtomicBool,
    counter: AtomicU32,
}

#[repr(align(64))]
struct Padded<T>(T);
struct Good {
    done: Padded<AtomicBool>,
    counter: Padded<AtomicU32>,
}
```
### Cache Warmth
``` rust
```
### Separate Cold Fields
``` rust
struct ParticleHot { pos: Vec3, vel: Vec3 }
struct ParticleCold { name: String, owner: u32 }
```
### Chunk Arrays
``` rust
let lanes = 64 / size_of::<f32>();
for chunk in arr.chunks_exact(lanes) { // issues 16 floats immediately, instead of 
    // auto-vectorization/SIMD can be applied, since floats are nicely chunked
    let mut local = 0.0;
    for v in chunk {
        local += *v;
    }
    sum += local;
}
// regular sum depends on previous value, so it can't vectorize it
```
### Benchmark
``` bash
perf stat -e cache-misses,cache-references ./your_bin # >5% miss ratio = bad
```