``` c
// C^1 continuous (3x^2 - 2x^3)
float sstep(float e0, float e1, float x) {
    x = clamp((x - e0) / (e1 - e0), 0.0, 1.0);
    return x * x * (3.0 - 2.0 * x);
}

// Linear step
float lstep(float e0, float e1, float x) {
    return clamp((x - e0) / (e1 - e0), 0.0, 1.0);
}

// Linear step, e0 = 0
float lstep(float e0, float x) {
    return clamp(1.0 - x / e0, 0.0, 1.0);
}

// Linear step, e0 = 0
float lstep(float e1, float x) {
    return clamp(x / e1, 0.0, 1.0);
}

// Quintic smoothstep (C^2 continuous)
float sstep_quintic(float e0, float e1, float x) {
    x = clamp((x - e0) / (e1 - e0), 0.0, 1.0);
    return x * x * x * (x * (6.0 * x - 15.0) + 10.0);
}

// Septic smoothstep (C^3 continuous)
float sstep_septic(float e0, float e1, float x) {
    x = clamp((x - e0) / (e1 - e0), 0.0, 1.0);
    return x * x * x * x * (x * (x * (70.0 - 20.0 * x) - 84.0) + 35.0);
}

// Cosine smoothstep (C^∞ continuous)
float sstep_cosine(float e0, float e1, float x) {
    x = clamp((x - e0) / (e1 - e0), 0.0, 1.0);
    return 0.5 - 0.5 * cos(3.141592653589793 * x);
}

// Inverse smoothstep
float inv_sstep(float e0, float e1, float x) {
    x = clamp((x - e0) / (e1 - e0), 0.0, 1.0);
    return 2.0 * x - x * x * (3.0 - 2.0 * x);
}

```
