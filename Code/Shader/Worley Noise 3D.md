![[Worley.webp#rounded|400]]
``` c
float hash13(vec3 p3) {
	p3 = fract(p3 / 0.1031);
    p3 += dot(p3, p3.zyx + 31.32);
    return fract((p3.x + p3.y) * p3.z);
}

float worley(vec3 p) {    
    vec3 i = floor(p);
    p -= i;
    float w = 1e6;
    for (float x = -1.0; x <= 1.0; ++x)
    for (float y = -1.0; y <= 1.0; ++y)
    for (float z = -1.0; z <= 1.0; ++z) {
        vec3 c = p - vec3(x, y, z) - hash13(i + vec3(x, y, z));
       	w = min(w, dot(c, c));
    }
    return 1.0 - sqrt(w);
}
```
### [[Derivative]]
``` c
vec4 worley13d(vec3 p) {    
    vec3 i = floor(p);
    p -= i;
    float w = 1e6;
    vec3 cmin = vec3(0);
    for (float x = -1.0; x <= 1.0; ++x)
    for (float y = -1.0; y <= 1.0; ++y)
    for (float z = -1.0; z <= 1.0; ++z) {
        vec3 c = p - vec3(x, y, z) - hash13(i + vec3(x, y, z));
        float l2 = dot(c, c);
        if (l2 < w) {
            w = l2;
            cmin = c;
        }
    }
    w = sqrt(w);
    return vec4(1.0 - w, -cmin / w);
}
```
### 8 Sample `approx`
faster, but inexact and slight artifacts at extremities
``` c
vec3 hash33(vec3 p) {
    uvec3 u = floatBitsToUint(p * vec3(141421356, 2718281828, 1618033988));
    return vec3((u.x ^ u.y ^ u.z) * uvec3(1732050807, 2645751311, 3316624790)) / float(~0u);
}

float worley(vec3 p) {
    vec3 i = round(p);
    p -= i;
    vec3 s = step(0.0, p) * 2.0 - 1.0;
    float w = 1e9;
    for(float x = 0.0; x <= 1.0; ++x) {
        for(float y = 0.0; y <= 1.0; ++y) {
            for(float z = 0.0; z <= 1.0; ++z) {
                vec3 d = vec3(x, y, z) * s;
                vec3 c = p - d - hash33(i + d) * 0.75 + 0.375;
                w = min(w, dot(c, c));
            }
        }
    }
    return 1.0 - sqrt(w);
}
```
