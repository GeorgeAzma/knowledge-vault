``` c
vec2 hash22(vec2 p) {
	vec3 p3 = fract(p.xyx / vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float simplex(vec2 p) {
	vec2 i = floor(p + (p.x + p.y) * 0.366025);
    vec2 a = p - i + (i.x + i.y) * 0.211324;
    float m = step(a.y, a.x); 
    vec2 o = vec2(m, 1.0 - m);
    vec2 b = a - o + 0.211324;
	vec2 c = a - 0.577351;
    vec3 h = max(0.5 - vec3(dot(a, a), dot(b, b), dot(c, c)), 0.0);
	vec3 n = h * h * h * h * 
        vec3(dot(a, hash22(i) - 0.5), 
             dot(b, hash22(i + o) - 0.5), 
             dot(c, hash22(i + 1.0) - 0.5));
    return dot(n, vec3(70)) + 0.5;
}

vec2 curl(vec2 p) {
    vec2 e = vec2(0.001, 0);
    float x0 = simplex(p + e.xy);
    float x1 = simplex(p - e.xy);
    float y0 = simplex(p + e.yx);
    float y1 = simplex(p - e.yx);
    return vec2(y0 - y1, x1 - x0) / e.x * 0.08 + 0.5;
}

// Gives interesting paper texture, better with perlin noise
vec2 fbm(vec2 p, int octaves) {
	vec2 s = vec2(0.0);
    float m = 0.0, a = 1.0;
	for(int i = 0; i < octaves; i++) {
		s += a * curl(p);
		m += a;
		a *= 0.7;
		p *= 2.0;
	}
	return s / m;
}
```
Curl FBM Noise
![[Curl FBM.webp]]
