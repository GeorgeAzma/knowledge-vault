``` c
# Infinyzoom
float zoom = exp2(-t) * 1.0;
float l2 = dot(uv, uv);
float d = 0.0;
float s = 0.0;
const float L = 8.0;
const float F = 1.0;
for (float i = 0.0; i < L; ++i) { 
    float k = fract((i - t) / L);
    float f = exp2(k * L) * F;
    float a = (1.0 - cos(k * TAU)) / f;
    d += fbm(uv / (0.3 + sqrt(1.0 - l2 * zoom * zoom)) * f, 3) * a;
    s += a;
    uv = cos(i) * uv + sin(i) * vec2(-uv.y, uv.x);
}
d /= s;
```
