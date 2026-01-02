### Stein's Algorithm `200ms`
``` c
pub fn gcd(mut u: u64, mut v: u64) -> u64 {
    if u == 0 || v == 0 {
        return u | v;
    }
    let s = (u | v).trailing_zeros();
    u >>= u.trailing_zeros();
    v >>= v.trailing_zeros();
    while u != v {
        if u > v {
            std::mem::swap(&mut u, &mut v);
        }
        v -= u;
        v >>= v.trailing_zeros();
    }
    u << s
}
```
### Euclid's Algorithm `400ms`
``` rust
pub fn gcd(mut u: u64, mut v: u64) -> u64 {
    while v != 0 {
        let t = v;
        v = u % v;
        u = t;
    }
    u
}

```
