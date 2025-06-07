``` c
float scratch(vec2 uv, float f) {
    vec2 seed = floor(uv);
    uv -= seed;
    seed.x = floor(sin(seed.x * 51024.0) * 3104.0);
    seed.y = floor(sin(seed.y * 1324.0) * 554.0);
 
    uv = uv * 2.0 - 1.0;
    uv = uv * cos(seed.x + seed.y) + vec2(-uv.y, uv.x) * sin(seed.x + seed.y);
    uv += sin(seed.x - seed.y);
    uv = uv * 0.5 + 0.5;
    
    const float WAVYNESS = 0.1;
    float s = (sin(seed.x + uv.y * 3.1415) + sin(seed.y + uv.y * 3.1415)) * WAVYNESS;
    
    float x = abs(uv.x - 0.5 + s);
    x = 0.5 - x * f;
    x = smoothstep(-2.0, fwidth(x) * 1.5 + 16.0, x) * 12.0;
    x *= uv.y;
    
    return x;
}

float scratches(vec2 uv) {
    float scratches = 0.0;
    float f = 1.0 / length(fwidth(uv));
    for(int i = 0; i < 5; ++i) {
        float x = scratch(uv, f);
    	scratches = max(scratches, x);
        uv = uv * mat2(1.0, 0.7, -0.7, 1.0) - 12.31;
    }
    return scratches;
}
```
