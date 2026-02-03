### Formula $|\dfrac{x}{a}|^n+|\dfrac{y}{b}|^n=1$
- $a,b$ [[ellipse|semi-major/minor axes]]
### Alternative Formula $|\dfrac{x}{a}|^{2^k}+|\dfrac{y}{b}|^{2^k}=1$
used in CSS `superellipse(k)`
- `k < 0` cut out corners
- `k = 0` beveled corners
- `k = 1` rounded corners
- `k = 2` squircle
- `k = ∞` square
![[Super Ellipse.png|500]]
### SDF
``` c
float superellipse_corner(vec2 p, float r, float n) {
    p = abs(p);
    float v = pow(pow(p.x, n) + pow(p.y, n), 1.0 / n);
    return v - r;
}

float rounded_rect(vec2 p, vec2 center, vec2 size, float corner_radius, float n) {
    p -= center;
    vec2 d = abs(p) - size * 0.5;
    if (d.x > -corner_radius && d.y > -corner_radius) {
        vec2 corner_center = sign(p) * (size * 0.5 - vec2(corner_radius));
        return superellipse_corner(p - corner_center, corner_radius, n);
    } else {
        return min(max(d.x, d.y), 0.0) + length(max(d, 0.0));
    }
}
```