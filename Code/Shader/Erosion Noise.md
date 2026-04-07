https://youtu.be/r4V21_uUK8Y
``` c
#define PI 3.1415926

vec2 hash22(vec2 p) {
    uvec2 u = floatBitsToUint(p * vec2(141421356, 2718281828));
    return vec2((u.x ^ u.y) * uvec2(3141592653, 1618033988)) / float(~0u);
}

vec3 noised(in vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);

    vec2 u = f * f * f * (f * (f * 6.0 - 15.0) + 10.0);
    vec2 du = 30.0 * f * f * (f * (f - 2.0) + 1.0);

    vec2 ga = hash22(i + vec2(0, 0)) * 2.0 - 1.0;
    vec2 gb = hash22(i + vec2(1, 0)) * 2.0 - 1.0;
    vec2 gc = hash22(i + vec2(0, 1)) * 2.0 - 1.0;
    vec2 gd = hash22(i + vec2(1, 1)) * 2.0 - 1.0;

    float va = dot(ga, f - vec2(0, 0));
    float vb = dot(gb, f - vec2(1, 0));
    float vc = dot(gc, f - vec2(0, 1));
    float vd = dot(gd, f - vec2(1, 1));

    return vec3(0.5 + va + u.x * (vb - va) + u.y * (vc - va) + u.x * u.y * (va - vb - vc + vd), ga + u.x * (gb - ga) + u.y * (gc - ga) + u.x * u.y * (ga - gb - gc + gd) + du * (u.yx * (va - vb - vc + vd) + vec2(vb, vc) - va));
}

vec3 fbm(vec2 p) {
    vec3 s = vec3(0);
    float a = 1.0, f = 1.0;
    for(int i = 0; i < 1; i++) {
        s += a * vec3(1, f, f) * noised(p * f);
        a *= 0.25;
        f *= 2.0;
    }
    return s;
}

vec3 gullies(vec2 p, vec2 slope) {
    vec2 side_dir = vec2(-slope.y, slope.x) * PI;
    vec2 id = floor(p);
    p -= id;
    vec2 height_slope = vec2(0);
    float w_sum = 0.0;
    for(int x = -1; x <= 2; x++) {
        for(int y = -1; y <= 2; y++) {
            vec2 off = vec2(x, y);
            vec2 c = p - off - hash22(id + off) + 0.5;
            float dist2 = dot(c, c);
            float w = max(0.0, exp(-dist2 * 2.0) - 0.01111);
            w_sum += w;
            float t = dot(c, side_dir);
            height_slope += vec2(cos(t), -sin(t)) * w;
        }
    }
    return vec3(height_slope.x, height_slope.y * side_dir) / w_sum;
}

vec3 erosion(vec2 p, vec3 nd) {
    vec3 in_nd = nd;
    float strength = 0.25, freq = 8.0, total = 1.0;
    for(int i = 0; i < 4; i++) {
        float len2 = dot(nd.yz, nd.yz);
        nd += gullies(p * freq, nd.yz * pow(len2, 0.5 * (0.5 - 1.0))) * strength * vec3(1, freq, freq);
        total += strength;
        strength *= 0.5;
        freq *= 2.0;
    }
    return nd / total;
}

void main() {
    vec2 fragCoord = gl_FragCoord.xy;
    vec2 uv = fragCoord / u_resolution.y * 4.0;
    vec3 col = erosion(uv, fbm(uv)).xxx;
    fragColor = vec4(col, 1);
}
```