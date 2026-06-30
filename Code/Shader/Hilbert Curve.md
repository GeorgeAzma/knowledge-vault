![[Hilbert Curve.webp#rounded|640]]![[Hilbert Curve Grammar.webp#rounded|202]]
``` c
// n: side length (power of 2)
ivec2 hilbert_decode(int n, int i) {
    ivec2 p = ivec2(0);
    for (int s = 1; s < n; s <<= 1, i >>= 2) {
        int j = i >> 1;
        p ^= (p.x ^ p.y) * ((~i ^ j) & 1) ^ (i & j & 1) * (s - 1) + (ivec2(j, i ^ j) & 1) * s;
    }
    return p;
}

int hilbert_encode(int n, ivec2 p) {
    int i = 0;
    for (int s = n >> 1; s > 0; s >>= 1) {
        int rx = int((p.x & s) != 0);
        int ry = int((p.y & s) != 0);
        i += s * s * ((rx << 1) | rx ^ ry);
        p ^= (p.x ^ p.y) * (1 - ry) ^ (s - 1) * (rx & (1 - ry));
    }
    return i;
}
```
- excellent locality `|p[i] - p[i+n]| <= C * sqrt(n)`
- no sudden jumps `best possible dilation`
    - `for i,j: jump = max(jump, |p[i]-p[j]| / |i-j|)`
### Similar
``` c
// sometimes faster
ivec2 hilbert_decode(int n, int i) {
    ivec2 p = ivec2(0);
    for (int s = 1, k = 0; s < n; s <<= 1, i >>= 2, ++k) {
        int j = i >> 1;
        p ^= (p.x ^ p.y) * ((~i ^ j) & 1) ^ (i & j & 1) * ((1 << k) - 1) + (ivec2(j, i ^ j) & 1) * (1 << k);
    }
    return p;
}
```
