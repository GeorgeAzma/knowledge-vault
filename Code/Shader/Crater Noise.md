### 3D
``` c
float crater_noise(vec3 x) {
    vec3 p = floor(x);
    vec3 f = x - p;
    float va = 0.;
    float wt = 0.;
    for (int i = -2; i <= 2; i++) 
        for (int j = -2; j <= 2; j++) 
            for (int k = -2; k <= 2; k++) {
                vec3 g = vec3(i,j,k);
                vec3 o = 0.8 * hash33(p + g);
                float d = distance(f - g, o);
                float w = exp(-4. * d);
                va += w * sin(6.28 * sqrt(d));
                wt += w;
            }
    return abs(va / wt);
}
```
### 2D
``` c
vec2 hash22(vec2 p) {
	vec3 p3 = fract(p.xyx / vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float crater_noise(vec2 p) {
    vec2 f = fract(p);
    p = floor(p);
    float va = 0.;
    float wt = 0.;
    for (int i = -2; i <= 2; i++) 
        for (int j = -2; j <= 2; j++) {
                vec2 g = vec2(i, j);
                vec2 o = hash22(p + g);
                float d = distance(f - g, o);
                float w = exp(-4. * d);
                va += w * sin(6.28 * sqrt(max(d, 0.06)));
                wt += w;
            }
    return abs(va / wt);
}

float crater_fbm(vec2 x) {
    float craters = crater_noise(x * 1.5) * 0.8 + crater_noise(x * 4.0) * 0.5 + crater_noise(x * 11.0) * 0.3;
    return exp(-craters);
}
```
