``` c
float noise(vec2 p) {
    return smoothstep(-0.5, 0.9, sin((p.x - p.y) * 555.0) * sin(p.y * 1444.0)) - 0.4;
}

float fabric(vec2 p) {
    const mat2 m = mat2(1.6, 1.2, -1.2, 1.6);
    float f = 0.0;
    f += 0.4 * noise(p); p = m * p;
    f += 0.3 * noise(p); p = m * p;
    f += 0.2 * noise(p); p = m * p;
    f += 0.1 * noise(p);
    return f;
}
```
