``` c
vec3 calc_normal(vec3 p) {
    vec2 e = vec2(0.002, 0);
    vec3 n = normalize(
        vec3(sdf(p - e.xyy), sdf(uv - e.yxy), sdf(p - e.yxy)) - 
        vec3(sdf(p + e.xyy), sdf(uv + e.yxy), sdf(p + e.yyx))
    );
    return n;
}

vec3 calc_normal_2d(vec2 p) {
    vec2 e = vec2(0.002, 0);
    vec2 n = (
        vec2(sdf(p - e.xy), sdf(p - e.yx)) - 
        vec2(sdf(p + e.xy), sdf(p + e.yx))
    ) / (2.0 * e.x);
    return normalize(vec3(n, -1));
}
```