![[Scratch.webp|500]]
``` c
// Inspired from: https://www.shadertoy.com/view/4syXRD
float scratch(vec2 p, float f) {
    const float THICKNESS = 0.0;
    const float WAVYNESS = 0.5;

    vec2 i = floor(p);
    vec2 h = hash22(i) * vec2(3104, 554);
    
    p = (p - i) * 2.0 - 1.0;
    p = p * cos(h.x + h.y) + vec2(-p.y, p.x) * sin(h.x + h.y);
    p += sin(h.x - h.y);
    
    float x = abs(p.x - cos(h.x + p.y * 1.57) * WAVYNESS);
    x = smoothstep(THICKNESS + f, THICKNESS - f, x);
    x *= p.y * 0.5 + 0.5;
    
    return x;
}

float scratches(vec2 uv) {
    const float SOFTNESS = 3.0;

    float scratches = 0.0;
    float w = length(fwidth(uv)) * SOFTNESS;
    for(int i = 0; i < 8; ++i) {
        float x = scratch(uv, w);
    	scratches = max(scratches, x);
        uv = uv * mat2(1.0, 0.7, -0.7, 1.0) - 12.31;
        w *= 1.22;
    }
    return scratches;
}
```
