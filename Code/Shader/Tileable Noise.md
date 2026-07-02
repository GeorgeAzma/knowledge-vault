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
