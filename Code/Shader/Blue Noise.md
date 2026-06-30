github.com/Calinou/free-blue-noise-textures
![[Blue.webp|250]]
### 2D
``` c
float hash12(vec2 p) {
	vec3 p3 = fract(p.xyx / 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

float blue(vec2 p) {
    float v = 0.0;
    for (int k = 0; k < 9; k++)
        v += hash12(p + vec2(k % 3 - 1, k / 3 - 1));
    return 0.9 * (1.125 * hash12(p) - v / 8.0) + 0.5;
}
```
### 3D
``` c
float hash13(vec3 p) {
	p = fract(p / 0.1031);
    p += dot(p, p.zyx + 31.32);
    return fract((p.x + p.y) * p.z);
}

float blue(vec3 p) {
    float v = 0.0;
    for (int k = 0; k < 27; k++)
        v += hash13(p + vec3(k % 3 - 1, k / 3 % 3 - 1, k / 9));
    return 0.9 * ((1.0 + 1.0 / 26.0) * hash13(p) - v / 26.0) + 0.5;
}
```
### [[Hilbert Curve]]
best quality `512x512 tiles, bigger tiles = slower`
``` c
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

float hilbert_blue(vec2 p) {
    return fract(0.6180339887498948482 * float(hilbert_encode(512, ivec2(p)) % 262144));
}
```
- uses [[golden ratio sequence]]
    - you can use 3D [[golden ratio sequence]] for RGB blue noise `vec3 hilbert_blue_noise(vec2 p)` 
