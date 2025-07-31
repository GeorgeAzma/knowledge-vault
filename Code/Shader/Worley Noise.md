### 2D
``` c
float hash12(vec2 p) {
	vec3 p3 = fract(p.xyx / 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

float worley(vec2 p) {    
    vec2 i = floor(p);
    p -= i;
    float w = 1e9;
    for (float x = -1.0; x <= 1.0; ++x)
    for (float y = -1.0; y <= 1.0; ++y) {
        vec2 c = p - vec2(x, y) - hash12(i + vec2(x, y));
       	w = min(w, dot(c, c));
    }
    return 1.0 - sqrt(w);
}
```
### 3D
``` c
float hash13(vec3 p3) {
	p3 = fract(p3 / 0.1031);
    p3 += dot(p3, p3.zyx + 31.32);
    return fract((p3.x + p3.y) * p3.z);
}

float worley(vec3 p) {    
    vec3 i = floor(p);
    p -= i;
    float w = 1e9;
    for (float x = -1.0; x <= 1.0; ++x)
    for (float y = -1.0; y <= 1.0; ++y)
    for (float z = -1.0; z <= 1.0; ++z) {
        vec3 c = p - vec3(x, y, z) - hash13(i + vec3(x, y, z));
       	w = min(w, dot(c, c));
    }
    return 1.0 - sqrt(w);
}
```
