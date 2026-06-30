[[Curl Noise]] + [[FBM]]
![[Curl FBM.webp#rounded]]
``` c
vec2 hash22(vec2 p) {
	vec3 p3 = fract(p.xyx / vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float noise(vec2 p) {
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
    vec2 e = vec2(0.01, 0);
    vec2 a = vec2(noise(p + e.xy), noise(p + e.yx));
    vec2 b = vec2(noise(p - e.xy), noise(p - e.yx));
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

float wool(vec2 p) {
    vec2 n = fbm(p, 6);
    return max(abs(n.x), abs(n.y));
}
```