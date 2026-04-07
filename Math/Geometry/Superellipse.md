### Formula $|\dfrac{x}{a}|^n+|\dfrac{y}{b}|^n=1$
- $a,b$ [[ellipse|semi-major/minor axes]]
### Alternative Formula $|\dfrac{x}{a}|^{2^k}+|\dfrac{y}{b}|^{2^k}=1$
used in CSS `superellipse(k)`
- `k < 0` cut out corners
- `k = 0` beveled corners
- `k = 1` rounded corners
- `k = 2` squircle
- `k = ∞` square
![[Super Ellipse.webp|500]]
### SDF
``` c
float superellipse(vec2 p, vec2 size, float r, float n) {
    vec2 q = abs(p) - size + r;
    if(all(greaterThan(q, vec2(0))))
        return pow(dot(pow(q, vec2(n)), vec2(1)), 1.0 / n) - r;
    return max(q.x, q.y) - r;
}

vec2 superellipse_grad(vec2 p, vec2 size, float r, float n) {
    vec2 q = abs(p) - size + r;
    if(all(greaterThan(q, vec2(0)))) {
        vec2 pw = pow(q, vec2(n));
        return pw / (q + 0.005 * sign(q)) * pow(dot(pw, vec2(1)), 1.0 / n - 1.0) * sign(p);
    }
    float g = step(q.y, q.x);
    return vec2(g, 1.0 - g) * sign(p);
}
```
