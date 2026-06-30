softer white noise, useful for [[dither|dithering]]
``` c
// https://www.shadertoy.com/view/4t2SDh
float hash12(vec2 p) {
	vec3 p3 = fract(p.xyx / 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

float tri_noise(vec2 n) {
    float rn = hash12(n) * 2.0 - 1.0;
    return (max(-1.0, rn * inversesqrt(abs(rn))) - sign(rn) + 1.0) * 0.5;
}
```
- Works using **Central Limit Theorem** with 2 random samples optimized into single sample
### Gaussian Noise
``` c
float hash12(vec2 p) {
	vec3 p3 = fract(p.xyx / 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

float n8rand(vec2 n) {
	float r0 = hash12(n + 0.07);
	float r1 = hash12(n + 0.11);	
	float r2 = hash12(n + 0.13);
	float r3 = hash12(n + 0.17);
    float r4 = hash12(n + 0.19);
    float r5 = hash12(n + 0.23);
    float r6 = hash12(n + 0.29);
    float r7 = hash12(n + 0.31);
	return (r0 + r1 + r2 + r3 + r4 + r5 + r6 + r7) / 8.0;
}
```