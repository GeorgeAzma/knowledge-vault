![[Value.webp|400]]
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
