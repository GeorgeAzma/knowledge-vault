``` c
vec3 palette(float t, vec3 a, vec3 b, vec3 c, vec3 d) {
    return a + b * cos(6.28318 * (c * t + d));
}

# magma heatmap
vec3(x, x * x, x * x * x) * mat3(1,2,-2,0.2,0.1,0.7,3.8,-8.9,5.8)

# skin color (linear)
vec3(250, 225, 210) // linear: vec3(0.957, 0.759, 0.652)
```
