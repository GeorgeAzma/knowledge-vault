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
### Simplex
``` c
vec3 hash33(vec3 p) {
	p = fract(p * vec3(.1031, .1030, .0973));
    p += dot(p, p.yxz + 33.33);
    return fract((p.xxy + p.yxx) * p.zyx) - 0.5;
}
float simplex3d(vec3 p) {
	 vec3 s = floor(p + dot(p, vec3(1.0 / 3.0)));
	 vec3 x = p - s + dot(s, vec3(1.0 / 6.0));
	 vec3 e = step(vec3(0), x - x.yzx);
	 vec3 i1 = e * (1.0 - e.zxy);
	 vec3 i2 = 1.0 - e.zxy * (1.0 - e);
	 vec3 x1 = x - i1 + 1.0 / 6.0;
	 vec3 x2 = x - i2 + 1.0 / 3.0;
	 vec3 x3 = x - 0.5;
	 vec4 w, d;
	 w.x = dot(x, x);
	 w.y = dot(x1, x1);
	 w.z = dot(x2, x2);
	 w.w = dot(x3, x3);
	 w = max(0.6 - w, 0.0);
	 d.x = dot(hash33(s), x);
	 d.y = dot(hash33(s + i1), x1);
	 d.z = dot(hash33(s + i2), x2);
	 d.w = dot(hash33(s + 1.0), x3);
	 w *= w;
	 w *= w;
	 d *= w;
	 return dot(d, vec4(52));
}
```
