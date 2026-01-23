`gabor(uv)*0.5+0.5; kF=6`
![[Gabor.png|400]]
### Approximation
``` c
vec2 hash22(vec2 p) {
	vec3 p3 = fract(p.xyx / vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float gabor(vec2 p) {
    const float kF = 8.0;
    vec2 i = floor(p);
	vec2 f = p - i;
    f *= f * (3.0 - 2.0 * f);
    return mix(mix(sin(kF * dot(p, hash22(i + vec2(0, 0)))),
               	   sin(kF * dot(p, hash22(i + vec2(1, 0)))), f.x),
               mix(sin(kF * dot(p, hash22(i + vec2(0, 1)))),
               	   sin(kF * dot(p, hash22(i + vec2(1, 1)))), f.x), f.y);
}

float gabors(vec2 p) {
    const mat2 m = mat2(1.6, 1.2, -1.2, 1.6);
    float f = 0.0;
    f += 0.4 * gabor(p); p = m * p;
    f += 0.3 * gabor(p); p = m * p;
    f += 0.2 * gabor(p); p = m * p;
    f += 0.1 * gabor(p); p = m * p;
    return f;
}
```
