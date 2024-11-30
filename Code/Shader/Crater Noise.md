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
                va += w * sin(2.*PI * sqrt(d));
                wt += w;
            }
    return abs(va / wt);
}
```
### 2D
``` c
float crater_noise(vec2 p, float scale) {
	p *= scale;
    vec2 f = fract(p);
    p = floor(p);
    float va = 0.;
    float wt = 0.;
    for (int i = -2; i <= 2; i++) 
        for (int j = -2; j <= 2; j++) {
                vec2 g = vec2(i, j);
                vec2 o = hash22(p + g, scale);
                float d = distance(f - g, o);
                float w = exp(-4. * d);
                va += w * sin(TAU * sqrt(max(d, 0.06)));
                wt += w;
            }
    return abs(va / wt);
}

float crater_fbm(vec3 x) {
    float craters = crater_noise(x * 1.5) * 0.8 + crater_noise(x * 4.0) * 0.5 + crater_noise(x * 11.0) * 0.3;
    return exp(-craters);
}
```