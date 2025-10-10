``` c
// note: this is an approximation, actual ACES uses matrix multiplication, also might need x *= 0.6; not sure
vec3 aces(vec3 x) {
  return clamp((x * (2.51 * x + 0.03)) / (x * (2.43 * x + 0.59) + 0.14), 0.0, 1.0);
}

vec3 reinhard(vec3 x) {
    return x / (x + 1.0);
}

vec3 reinhard_extended_luma(vec3 x, float max_l) {
    float l = luma(x);
    return x * (1.0 + l / (max_l * max_l)) / (1.0 + l);
}

vec3 uncharted2(vec3 x) {
    float A = 0.15f, B = 0.50f, C = 0.10f, D = 0.20f, E = 0.02f, F = 0.30f;
    return ((x * (A * x + C * B) + D * E) / (x * (A * x + B) + D * F)) - E / F;
}

vec3 uncharted2_filmic(vec3 x) {
    return uncharted2(v * 2.0) / uncharted2(vec3(11.2));
}
```
