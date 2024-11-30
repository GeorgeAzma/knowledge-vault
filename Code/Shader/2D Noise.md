### Value
``` c
float hash12(vec2 p) {
	vec3 p3 = fract(p.xyx * 0.1031);
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
```
### Simplex
``` c
vec2 hash22(vec2 p) {
	vec3 p3 = fract(p.xyx * vec3(0.1031, 0.1030, 0.0973));
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
### Tillable
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