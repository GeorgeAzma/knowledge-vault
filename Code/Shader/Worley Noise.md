``` c
vec2 hash22(vec2 p) {
	vec3 p3 = fract(p.xyx * vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float worley(vec2 x) {
    vec2 p = floor(x);
    vec2 f = x - p;
	float va = 1.0;
    for(int j = -1; j <= 1; j++) 
    for(int i = -1; i <= 1; i++) {
        vec2 g = vec2(i, j);
		vec2 r = g - f + hash22(p + g);
		va = min(dot(r, r), va);
    }
    return va;
}
```