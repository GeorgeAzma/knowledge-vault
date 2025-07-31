##### Wool
``` c
vec2 hash22(vec2 p) {
	vec3 p3 = fract(p.xyx / vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float perlin(vec2 p) {
    vec2 i = floor(p);
    vec2 f = p - i; 
    vec2 u = f * f * f * (10.0 + f * (6.0 * f - 15.0));
    float a = dot(normalize(hash22(i + vec2(0, 0)) - 0.5), f - vec2(0, 0));
    float b = dot(normalize(hash22(i + vec2(1, 0)) - 0.5), f - vec2(1, 0));
    float c = dot(normalize(hash22(i + vec2(0, 1)) - 0.5), f - vec2(0, 1));
    float d = dot(normalize(hash22(i + vec2(1, 1)) - 0.5), f - vec2(1, 1));
    return mix(mix(a, b, u.x), mix(c, d, u.x), u.y) * 0.7 + 0.5;
}

vec2 curl(vec2 p) {
    vec2 e = vec2(0.001, 0);
    vec2 a = vec2(perlin(p + e.xy), perlin(p + e.yx));
    vec2 b = vec2(perlin(p - e.xy), perlin(p - e.yx));
    return (a - b) / e.x * 0.5;
}

vec2 fbm(vec2 p, int octaves) {
	vec2 s = vec2(0.0);
    float m = 0.0, a = 1.0;
	for(int i = 0; i < octaves; i++) {
        vec2 n = curl(p);
		s += a * n;
		m += a;
		a *= 0.5;
		p *= 2.0;
	}
	return s / m;
}

wool = length(fbm(uv, 8))
```
##### Carbon Fiber
``` c
float noise(vec2 p) {
    return smoothstep(-0.5, 0.9, sin((p.x - p.y) * 555.0) * sin(p.y * 1444.0)) - 0.4;
}

float fabric(vec2 p) {
    const mat2 m = mat2(1.6, 1.2, -1.2, 1.6);
    float f = 0.0;
    f += 0.4 * noise(p); p = m * p;
    f += 0.3 * noise(p); p = m * p;
    f += 0.2 * noise(p); p = m * p;
    f += 0.1 * noise(p);
    return f;
}
```
