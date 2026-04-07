### Formula $t(t(C-2B+A)+2(B-A))+A$
`t * (t * (c - 2.0 * b + a) + 2.0 * (b - a)) + a`
- **origin** $t(t(C-2B)+2B)$
- **derivative** $2t(C+A-2B)+2(B-A)$
### Highest Point $\operatorname{clamp}(\dfrac{A.y-B.y}{A.y+C.y-2B.y},0,1)$
### From [[Cubic Bezier|Cubic]] Approx $B=\dfrac{3(C_{1}+C_{2})-D-A}{4}$
### Approx 2 quadratic splines with 1
``` c
float quadratic_max_height_t(vec2 p0, vec2 p1, vec2 p2) {
    return clamp((p0.y - p1.y) / (p0.y - 2.0 * p1.y + p2.y), 0.0, 1.0)
}

Quadratic join_quadratics(vec2 p0, vec2 p1, vec2 p2, vec2 p3, vec4 p4) {
    float ht1 = quadratic_max_height_t(p0, p1, p2);
    float ht2 = quadratic_max_height_t(p2, p3, p4);
    vec2 h1 = quadratic(ht1, p0, p1, p2);
    vec2 h2 = quadratic(ht2, p0, p1, p2);
    vec2 h = abs(h1.y) > abs(h2.y) ? h1 : h2;
    vec2 c = 2.0 * h - 0.5 * (p0 + p4);
    return Quadratic(p0, c, p4)
}
```
### Area $\large\int_0^1{\frac{|Bezier(t)\times End|}{||End||}dt}$
### [[SDF]]
``` c
float sdf_line(vec2 p, vec2 a, vec2 b) {
    vec2 dir = normalize(b - a) * 5e-5;
    a += dir;
    b -= dir + a;
    p -= a;
    vec2 h = p - clamp(dot(p, b) / dot(b, b), 0.0, 1.0) * b;
    return dot(h, vec2(b.y, -b.x)) >= 0.0 ? length(h) : -length(h);
}

// shadertoy.com/view/ftdGDB
float sdf_bezier(vec2 pos, vec2 A, vec2 B, vec2 C) {
    bool abEqual = all(equal(A, B));
    bool bcEqual = all(equal(B, C));
    bool acEqual = all(equal(A, C));

    if(abEqual && bcEqual)
        return distance(pos, A);
    if(abEqual || acEqual)
        return sdf_line(pos, B, C);
    if(bcEqual)
        return sdf_line(pos, A, C);

    // Handle colinear points
    // if(abs(dot(normalize(B - A), normalize(C - B)) - 1.0) < 1e-3)
    //     return sdf_line(pos, A, C);

    // seems to fix artifacts and handle colinear points
    vec2 dir = normalize(C - A) * 7e-6;
    A += dir;
    B += dir;
    C -= dir;

    vec2 a = B - A;
    vec2 b = A - 2.0 * B + C;
    vec2 c = a * 2.0;
    vec2 d = A - pos;

    float kk = 1.0 / dot(b, b);
    float kx = kk * dot(a, b);
    float ky = kk * (2.0 * dot(a, a) + dot(d, b)) / 3.0;
    float kz = kk * dot(d, a);

    float p = ky - kx * kx;
    float p3 = p * p * p;
    float q = kx * (2.0 * kx * kx - 3.0 * ky) + kz;
    float h = q * q + 4.0 * p3;

    float res, sgn;
    if(h >= 0.0) {
        h = sqrt(h);
        vec2 x = 0.5 * (vec2(h, -h) - q);
        vec2 uv = sign(x) * pow(abs(x), vec2(1.0 / 3.0));
        float t = clamp(uv.x + uv.y - kx, 0.0, 1.0);
        vec2 q = d + (c + b * t) * t;
        res = dot(q, q);
        sgn = dot(c + 2.0 * b * t, vec2(q.y, -q.x));
    } else {
        float z = sqrt(-p);
        float v = acos(q / (p * z * 2.0)) / 3.0;
        float m = cos(v);
        float n = sin(v) * sqrt(3.0);
        vec3 t = clamp(vec3(m + m, -n - m, n - m) * z - kx, 0.0, 1.0);
        vec2 qx = d + (c + b * t.x) * t.x;
        float dx = dot(qx, qx);
        float sx = dot(c + 2.0 * b * t.x, vec2(qx.y, -qx.x));
        vec2 qy = d + (c + b * t.y) * t.y;
        float dy = dot(qy, qy);
        float sy = dot(c + 2.0 * b * t.y, vec2(qx.y, -qx.x));
        res = (dx < dy) ? dx : dy;
        sgn = (dx < dy) ? sx : sy;
    }
    return sign(sgn) * sqrt(res);
}
```
**x2 Faster Version** `works perfectly for ~95% SVGs`
``` c
// might need to adjust EPS per SVG (rare)
float sdf_line(vec2 p, vec2 a, vec2 b) {
    const float EPS = 1e-4; 
    b = (b - a) * (1.0 - EPS);
    a += b * (EPS * 0.5);
    p -= a;
    vec2 h = p - clamp(dot(p, b) / dot(b, b), 0.0, 1.0) * b;
    return sign(dot(h, vec2(b.y, -b.x))) >= 0.0 ? length(h) : -length(h);
}

float sdf_bezier(vec2 pos, vec2 A, vec2 B, vec2 C) {
    vec2 dir = normalize(C - A) * 5e-6;
    A += dir;
    C -= dir;
    vec2 a = B - A;
    vec2 b = A - 2.0 * B + C;
    vec2 d = A - pos;
    vec3 k = vec3(dot(a, b), (2.0 * dot(a, a) + dot(d, b)) / 3.0, dot(d, a)) / dot(b, b);
    float p = k.y - k.x * k.x;
    float q = k.x * (2.0 * k.x * k.x - 3.0 * k.y) + k.z;
    float h = sqrt(q * q + 4.0 * p * p * p);
    vec2 x = 0.5 * (vec2(h, -h) - q);
    vec2 uv = sign(x) * pow(abs(x), vec2(1.0 / 3.0));
    float t = clamp(uv.x + uv.y - k.x, 0.0, 1.0);
    vec2 q2 = d + (a * 2.0 + b * t) * t;
    float sgn = dot(a + b * t, vec2(q2.y, -q2.x));
    return sign(sgn) * length(q2);
}
```
