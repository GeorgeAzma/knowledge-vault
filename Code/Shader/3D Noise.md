### Value
``` c
vec4 perm(vec4 x) { x *= x * 34.0 + 1.0; return x - floor(x / 289.0) * 289.0; }

float noise(vec3 p) {
    vec3 a = floor(p);
    vec3 d = p - a;
    d *= d * (3.0 - 2.0 * d);
    vec4 b = a.xxyy + vec4(0, 1, 0, 1);
    vec4 k1 = perm(b.xyxy);
    vec4 k2 = perm(k1.xyxy + b.zzww) + a.zzzz;
    vec4 k3 = perm(k2);
    vec4 k4 = perm(k2 + 1.0);
    vec4 o1 = fract(k3 * 0.02439024);
    vec4 o2 = fract(k4 * 0.02439024);
    vec4 o3 = mix(o1, o2, d.z);
    vec2 o4 = mix(o3.xz, o3.yw, d.x);
    return mix(o4.x, o4.y, d.y);
}
```
### Perlin
``` c
vec3 hash33(vec3 p) {
	p = fract(p / vec3(0.1031, 0.1030, 0.0973));
    p += dot(p, p.yxz + 33.33);
    return fract((p.xxy + p.yxx) * p.zyx);
}

float perlin(vec3 p) {
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
### Simplex
``` c
vec3 hash33(vec3 p) {
	p = fract(p / vec3(0.1031, 0.1030, 0.0973));
    p += dot(p, p.yxz + 33.33);
    return fract((p.xxy + p.yxx) * p.zyx);
}

float simplex(vec3 p) {
	 vec3 s = floor(p + dot(p, vec3(1.0 / 3.0)));
	 vec3 x = p - s + dot(s, vec3(1.0 / 6.0));
	 vec3 e = step(vec3(0), x - x.yzx);
	 vec3 i1 = e * (1.0 - e.zxy);
	 vec3 i2 = 1.0 - e.zxy * (1.0 - e);
	 vec3 x1 = x - i1 + 1.0 / 6.0;
	 vec3 x2 = x - i2 + 1.0 / 3.0;
	 vec3 x3 = x - 0.5;
	 vec4 w = vec4(dot(x, x), dot(x1, x1), dot(x2, x2), dot(x3, x3));
	 w = max(0.6 - w, 0.0);
	 vec4 d = vec4(dot(hash33(s) - 0.5, x), 
                   dot(hash33(s + i1) - 0.5, x1),
            	   dot(hash33(s + i2) - 0.5, x2), 
                   dot(hash33(s + 1.0) - 0.5, x3));
	 w *= w;
	 w *= w;
	 d *= w;
	 return dot(d, vec4(26)) + 0.5;
}
```
### Perlin Derivative
``` c
vec3 hash33(vec3 p) {
	p = fract(p / vec3(0.1031, 0.1030, 0.0973));
    p += dot(p, p.yxz + 33.33);
    return fract((p.xxy + p.yxx) * p.zyx);
}

vec4 noised(vec3 x) {
    vec3 i = floor(x);
    vec3 f = fract(x);
    vec3 u = f*f*f*(f*(f*6.0-15.0)+10.0);
    vec3 du = 30.0*f*f*(f*(f-2.0)+1.0);
    vec3 ga = hash33(i + vec3(0,0,0)) * 2.0 - 1.0;
    vec3 gb = hash33(i + vec3(1,0,0)) * 2.0 - 1.0;
    vec3 gc = hash33(i + vec3(0,1,0)) * 2.0 - 1.0;
    vec3 gd = hash33(i + vec3(1,1,0)) * 2.0 - 1.0;
    vec3 ge = hash33(i + vec3(0,0,1)) * 2.0 - 1.0;
    vec3 gf = hash33(i + vec3(1,0,1)) * 2.0 - 1.0;
    vec3 gg = hash33(i + vec3(0,1,1)) * 2.0 - 1.0;
    vec3 gh = hash33(i + vec3(1,1,1)) * 2.0 - 1.0;
    float va = dot(ga, f - vec3(0,0,0));
    float vb = dot(gb, f - vec3(1,0,0));
    float vc = dot(gc, f - vec3(0,1,0));
    float vd = dot(gd, f - vec3(1,1,0));
    float ve = dot(ge, f - vec3(0,0,1));
    float vf = dot(gf, f - vec3(1,0,1));
    float vg = dot(gg, f - vec3(0,1,1));
    float vh = dot(gh, f - vec3(1,1,1));
    float v = va + 
              u.x*(vb-va) + 
              u.y*(vc-va) + 
              u.z*(ve-va) + 
              u.x*u.y*(va-vb-vc+vd) + 
              u.y*u.z*(va-vc-ve+vg) + 
              u.z*u.x*(va-vb-ve+vf) + 
              u.x*u.y*u.z*(-va+vb+vc-vd+ve-vf-vg+vh);            
    vec3 d = ga + 
             u.x*(gb-ga) + 
             u.y*(gc-ga) + 
             u.z*(ge-ga) + 
             u.x*u.y*(ga-gb-gc+gd) + 
             u.y*u.z*(ga-gc-ge+gg) + 
             u.z*u.x*(ga-gb-ge+gf) + 
             u.x*u.y*u.z*(-ga+gb+gc-gd+ge-gf-gg+gh) +   
             du * (vec3(vb-va,vc-va,ve-va) + 
                   u.yzx*vec3(va-vb-vc+vd,va-vc-ve+vg,va-vb-ve+vf) + 
                   u.zxy*vec3(va-vb-ve+vf,va-vb-vc+vd,va-vc-ve+vg) + 
                   u.yzx*u.zxy*(-va+vb+vc-vd+ve-vf-vg+vh));
    return vec4(v, d);                   
}
```