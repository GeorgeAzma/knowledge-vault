``` c
vec3 hash32(vec2 p) {
	vec3 p3 = fract(p.xyx / vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yxz + 33.33);
    return fract((p3.xxy + p3.yzz) * p3.zyx);
}

float voronoi(vec2 x, float s) {
    s = 1.0 / s;
    vec2 p = floor(x);
    vec2 f = x - p;
	float va = 0.0;
	float wt = 0.0;
    for(float x = -1.0; x <= 1.0; x++)
    for(float y = -1.0; y <= 1.0; y++) {
		vec3 o = hash32(p + vec2(x, y));
		float d = length(vec2(x, y) - f + o.xy);
		float ww = pow(smoothstep(1.414, 0.0, d), s);
		va += o.z * ww;
		wt += ww;
    }
    return va / wt;
}
```
### Smooth Edges `Fast`
``` c
float voronoi(vec2 x, float s) {
    vec2 p = floor(x);
    vec2 f = x - p;
	float va = 0.0;
	float wt = 0.0;
    for (float x = -1.0; x <= 1.0; x++)
    for (float y = -1.0; y <= 1.0; y++) {
		vec3 o = hash32(p + vec2(x, y));
		vec2 r = vec2(x, y) - f + o.xy * 0.8;
		float ww = smoothstep(1.0, 0.0, length(r));
		va += o.z * ww;
		wt += ww;
    }
    return va / (0.01 + wt);
}
```
