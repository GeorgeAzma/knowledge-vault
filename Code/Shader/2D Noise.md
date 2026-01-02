### Value
``` c
float hash12(vec2 p) {
	vec3 p3 = fract(p.xyx / 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

float noise(vec2 p) {
	vec2 i = floor(p);
	vec2 f = p - i;
	f *= f * (3.0 - 2.0 * f);
	float res = mix(
		mix(hash12(i), hash12(i + vec2(1, 0)), f.x),
		mix(hash12(i + vec2(0, 1)), hash12(i + vec2(1)), f.x), f.y);
	return res;	
}

float fbm(vec2 p, int octaves) {
	float s = 0.0, m = 0.0, a = 1.0;
	for(int i = 0; i < octaves; i++) {
		s += a * noise(p);
		m += a;
		a *= 0.5;
		p *= mat2(1.6, 1.2, -1.2, 1.6);
	}
	return s / m;
}
```
### Simplex
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
```
### Perlin
``` c
vec2 hash22(vec2 p) {
	vec3 p3 = fract(p.xyx / vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = p - i; 
    vec2 u = f * f * f * (10.0 + f * (6.0 * f - 15.0));
    float a = dot(normalize(hash22(i + vec2(0, 0)) - 0.5), f - vec2(0, 0));
    float b = dot(normalize(hash22(i + vec2(1, 0)) - 0.5), f - vec2(1, 0));
    float c = dot(normalize(hash22(i + vec2(0, 1)) - 0.5), f - vec2(0, 1));
    float d = dot(normalize(hash22(i + vec2(1, 1)) - 0.5), f - vec2(1, 1));
    return mix(mix(a, b, u.x), mix(c, d, u.x), u.y) * 0.7 + 0.5;
}
```
### Tilleable
``` c
float hash12(vec2 p, float scale) {
    p /= scale;
    p = fract(p);
	vec3 p3 = fract(p.xyx * 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

float noise(vec2 p, float scale) {
	p *= scale;
	vec2 f = fract(p);
    p = floor(p);
    f *= f * (3.0 - 2.0 * f);
    return mix(mix(hash12(p, scale),
			       hash12(p + vec2(1, 0), scale), f.x),
			   mix(hash12(p + vec2(0, 1), scale),
			       hash12(p + vec2(1, 1), scale), f.x), f.y);
}
```
