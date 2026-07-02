![[Perlin.webp|400]]
``` c
vec3 hash33(vec3 p) {
	p = fract(p / vec3(0.1031, 0.1030, 0.0973));
    p += dot(p, p.yxz + 33.33);
    return fract((p.xxy + p.yxx) * p.zyx);
}

float noise(vec3 p) {
    vec3 i = floor(p);
    vec3 f = p - i;
    vec3 u = f * f * f * (10.0 + f * (6.0 * f - 15.0));
    float a0 = dot(f - vec3(0, 0, 0), normalize(hash33(i + vec3(0, 0, 0)) - 0.5));
    float b0 = dot(f - vec3(1, 0, 0), normalize(hash33(i + vec3(1, 0, 0)) - 0.5));
    float c0 = dot(f - vec3(0, 1, 0), normalize(hash33(i + vec3(0, 1, 0)) - 0.5));
    float d0 = dot(f - vec3(1, 1, 0), normalize(hash33(i + vec3(1, 1, 0)) - 0.5));
    float a1 = dot(f - vec3(0, 0, 1), normalize(hash33(i + vec3(0, 0, 1)) - 0.5));
    float b1 = dot(f - vec3(1, 0, 1), normalize(hash33(i + vec3(1, 0, 1)) - 0.5));
    float c1 = dot(f - vec3(0, 1, 1), normalize(hash33(i + vec3(0, 1, 1)) - 0.5));
    float d1 = dot(f - vec3(1, 1, 1), normalize(hash33(i + vec3(1, 1, 1)) - 0.5));
    float z0 = mix(mix(a0, b0, u.x), mix(c0, d0, u.x), u.y);
    float z1 = mix(mix(a1, b1, u.x), mix(c1, d1, u.x), u.y);
    return mix(z0, z1, u.z) * 0.7 + 0.5;
}
```
### [[Derivative]]
``` c
vec3 hash33(vec3 p) {
	p = fract(p / vec3(0.1031, 0.1030, 0.0973));
    p += dot(p, p.yxz + 33.33);
    return fract((p.xxy + p.yxx) * p.zyx);
}

vec4 noised(vec3 p) {
    vec3 i = floor(p);
    vec3 f = p - i;
    vec3 u = f * f * f * (f * (f * 6.0 - 15.0) + 10.0);
    vec3 du = 30.0 * f * f * (f * (f - 2.0) + 1.0);
    vec3 ga = hash33(p + vec3(0, 0, 0));
    vec3 gb = hash33(p + vec3(1, 0, 0));
    vec3 gc = hash33(p + vec3(0, 1, 0));
    vec3 gd = hash33(p + vec3(1, 1, 0));
    vec3 ge = hash33(p + vec3(0, 0, 1));
    vec3 gf = hash33(p + vec3(1, 0, 1));
    vec3 gg = hash33(p + vec3(0, 1, 1));
    vec3 gh = hash33(p + vec3(1, 1, 1));
    float va = dot(ga, f - vec3(0, 0, 0));
    float vb = dot(gb, f - vec3(1, 0, 0));
    float vc = dot(gc, f - vec3(0, 1, 0));
    float vd = dot(gd, f - vec3(1, 1, 0));
    float ve = dot(ge, f - vec3(0, 0, 1));
    float vf = dot(gf, f - vec3(1, 0, 1));
    float vg = dot(gg, f - vec3(0, 1, 1));
    float vh = dot(gh, f - vec3(1, 1, 1));
    return vec4(va + u.x*(vb-va) + u.y*(vc-va) + u.z*(ve-va) + u.x*u.y*(va-vb-vc+vd) + u.y*u.z*(va-vc-ve+vg) + u.z*u.x*(va-vb-ve+vf) + (-va+vb+vc-vd+ve-vf-vg+vh)*u.x*u.y*u.z,
                ga + u.x*(gb-ga) + u.y*(gc-ga) + u.z*(ge-ga) + u.x*u.y*(ga-gb-gc+gd) + u.y*u.z*(ga-gc-ge+gg) + u.z*u.x*(ga-gb-ge+gf) + (-ga+gb+gc-gd+ge-gf-gg+gh)*u.x*u.y*u.z +
                du * (vec3(vb,vc,ve) - va + u.yzx*vec3(va-vb-vc+vd,va-vc-ve+vg,va-vb-ve+vf) + u.zxy*vec3(va-vb-ve+vf,va-vb-vc+vd,va-vc-ve+vg) + u.yzx*u.zxy*(-va+vb+vc-vd+ve-vf-vg+vh)));
}
```
