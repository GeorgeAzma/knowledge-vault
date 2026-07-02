![[Worley.webp#rounded|400]]
``` c
vec2 hash22(vec2 p) {
	vec3 p3 = fract(p.xyx / vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float worley(vec2 p) {    
    vec2 i = floor(p);
    p -= i;
    float w = 1e6;
    for (float x = -1.0; x <= 1.0; ++x)
    for (float y = -1.0; y <= 1.0; ++y) {
        vec2 c = p - vec2(x, y) - hash22(i + vec2(x, y));
       	w = min(w, dot(c, c));
    }
    return 1.0 - sqrt(w);
}
```
### [[Derivative]]
``` c
vec3 worleyd(vec2 p) {    
    vec2 i = floor(p);
    p -= i;
    float w = 1e6;
    vec2 cmin = vec2(0);
    for (float x = -1.0; x <= 1.0; ++x)
    for (float y = -1.0; y <= 1.0; ++y) {
        vec2 c = p - vec2(x, y) - hash12(i + vec2(x, y));
        float l2 = dot(c, c);
        if (l2 < w) {
            w = l2;
            cmin = c;
        }
    }
    w = sqrt(w);
    return vec3(1.0 - w, -cmin / w);
}
```
### 4 Sample
``` c
float hash12(vec2 p) {
	vec3 p3 = fract(p.xyx / 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

vec2 reuleaux_border(float theta) {
    vec2 dir = vec2(cos(theta), sin(theta));
    float m = max(abs(dir.x), abs(dir.y));
    // float t = (sqrt(m * m + 1.5) - m) * 0.5;
    float t = 0.611 - 0.48 * m + 0.16 * m * m; // polynomial approximation
    return dir * t;
}

float worley(vec2 p) {    
    vec2 i = round(p);
    p -= i;
    vec2 s = step(0.0, p) * 2.0 - 1.0;
    float w = 1e9;
    for (float x = 0.0; x <= 1.0; ++x)
    for (float y = 0.0; y <= 1.0; ++y) {
        vec2 d = vec2(x, y) * s;
        vec2 c = p - d - reuleaux_border(hash12(i + d) * 6.2831); 
        w = min(w, dot(c, c));
    }
    return 1.0 - sqrt(w);
}
```
### 4 Sample `approx`
faster, but inexact and slight artifacts at extremities
``` c
vec2 hash22(vec2 p) {
    uvec2 u = floatBitsToUint(p * vec2(141421356, 2718281828));
    return vec2((u.x ^ u.y) * uvec2(3141592653, 1618033988)) / float(~0u);
}

float worley(vec2 p) {
    vec2 i = round(p);
    p -= i;
    vec2 s = step(0.0, p) * 2.0 - 1.0;
    float w = 1e9;
    for(float x = 0.0; x <= 1.0; ++x) {
        for(float y = 0.0; y <= 1.0; ++y) {
            vec2 d = vec2(x, y) * s;
            vec2 c = p - d - hash22(i + d) * 0.75 + 0.375;
            w = min(w, dot(c, c));
        }
    }
    return 1.0 - sqrt(w);
}
```
