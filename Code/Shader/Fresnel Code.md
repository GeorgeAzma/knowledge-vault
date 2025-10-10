``` c
// for metallics, n = n2 / n1, c = dot(normal, view)
vec3 fresnel(vec3 n, vec3 k, float c) {
    vec3 n2k2 = n * n + k * k;
    float c2 = c * c;
    vec3 nc = 2.0 * n * c;
    vec3 rs = (n2k2 - nc + c2) / (n2k2 + nc + c2);
    vec3 rp = (n2k2 * c2 - nc + 1.0) / (n2k2 * c2 + nc + 1.0);
    return 0.5 * (rs + rp);
}

// simplified for dielectrics, n = n2 / n1, c = dot(normal, view)
float fresnel(float n, float c) {
    float n2 = n * n;
    float c2 = c * c;
    float nc = 2.0 * n * c;
    float rs = (n2 - nc + c2) / (n2 + nc + c2);
    float rp = (n2 * c2 - nc + 1.0) / (n2 * c2 + nc + 1.0);
    return 0.5 * (rs + rp);
}

// r: reflectance when looking directly at surface (0-1)
// g: edge reflectence / tint (0-1)
// c: dot(view_dir, normal)
// https://jcgt.org/published/0003/04/03/paper.pdf
vec3 fresnel_rg(vec3 r, vec3 g, float c) {
    // calculate n,k from r,g
    r = clamp(r, 0.0, 0.999);
    vec3 nmin = (1.0 - r) / (1.0 + r);
    vec3 nmax = (1.0 + sqrt(r)) / (1.0 - sqrt(r));
    vec3 n = nmin * g + (1.0 - g) * nmax;
    vec3 nr = (n + 1.0) * (n + 1.0) * r - (n - 1.0) * (n - 1.0);
    vec3 k2 = nr / (1.0 - r);
    // complex fresnel for metallics
    vec3 n2k2 = n * n + k2;
    float c2 = c * c;
    vec3 nc = 2.0 * n * c;
    vec3 rs = (n2k2 - nc + c2) / (n2k2 + nc + c2);
    vec3 rp = (n2k2 * c2 - nc + 1.0) / (n2k2 * c2 + nc + 1.0);
    return 0.5 * (rs + rp); // unpolarized reflectance
}
```
