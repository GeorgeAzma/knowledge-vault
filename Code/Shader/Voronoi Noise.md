``` c
// s is edge smoothness 
// Note: if using low s, you can decrease for loop range
vec3 hash32(vec2 p) {
	vec3 p3 = fract(p.xyx * vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yxz + 33.33);
    return fract((p3.xxy + p3.yzz) * p3.zyx);
}

float voronoise(vec2 x, float s) {
    vec2 p = floor(x);
    vec2 f = x - p;
	float k = 1.0 + 63.0 * pow(1.0 - s, 4.0);
	float va = 0.0;
	float wt = 0.0;
    for(int j = -2; j <= 2; j++)
    for(int i = -2; i <= 2; i++) {
        vec2 g = vec2(i, j);
		vec3 o = hash32(p + g);
		vec2 r = g - f + o.xy;
		float d = dot(r, r);
		float ww = pow(1.0 - smoothstep(0.0, 1.414213562373, sqrt(d)), k);
		va += o.z * ww;
		wt += ww;
    }
    return va / wt;
}
```
