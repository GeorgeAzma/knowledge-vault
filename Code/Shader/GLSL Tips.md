- Use thebookofshaders.com/edit.php To visualize code line by line and see the slow lines
- Diffuse `max(dot(norm, lightDir), 0.0)`
- Specular `pow(max(dot(normal, normalize(lightDir + viewDir)), 0.0), p)`
- Good Fresnel Like Halo `smoothstep(1.02, 0.98, dot(uv, uv)) * pow(dot(uv, uv), 8.0)`
- Direction from FOV `normalize(vec3(uv, tan((PI - radians(fov)) * 0.5)))`
- Direction from [[Focal Length]] `normalize(vec3(uv / focal_length, 1))`
- Direction from [[Focal Length|Diopter]] `normalize(vec3(uv * diopter, 1))`
- Get normal from 2D sdf
``` c
vec3 get_normal(vec2 uv) {
    vec2 e = vec2(0.002, 0);
    float nx = (sdf(uv - e.xy) - sdf(uv + e.xy)) / (2.0 * e.x);
    float ny = (sdf(uv - e.yx) - sdf(uv + e.yx)) / (2.0 * e.x);
    vec3 n = normalize(vec3(nx, ny, -1.));
    return n;
}
```
- Simple Palette
``` c
vec3 pal(float t, vec3 a, vec3 b, vec3 c, vec3 d) {
    return a + b * cos(6.28318 * (c * t + d));
}
```
- Sphere Normals `vec3(uv, -sqrt(1.0 - dot(uv, uv)))`
- Glossy Sphere Effect
	- Generate sphere normals
	- Divide normal xy by z (for magnification effect)
	- Generate 2D fbm with sphere normals
	- Smoothstep high end of the fbm
	- Add smoothstepped value to initial color
	``` c
	// d is sphere/circle mask
	smoothstep(0.6, 1.0, fbm(n.xy * 3.0 / (1.0 + n.z), 2)) * d;
	```
- Fresnel
```c
vec3 incident = normalize(world_pos - camera_pos);
float fresnel = pow(1.0 + dot(incident, normal), power);
```
- Quadratic interpolation of 3 samples
``` c
vec4 mix3(vec3 a, vec3 b, vec3 c, float t) {
    return mix(mix(a, b, 0.5 * t + 0.5), mix(b, c, 0.5 * t), t);
}
```
- Vignette `pow(uv.x * (1.0 - uv.y) * uv.y * (1.0 - uv.x) * 15.0, 0.25)` `UV01`
> [!tip] Combine white grid lines and such with `mix(x, 1.0, y)` 
 > > [!error] Inaccurate `max(x, y)` or `clamp(x + y, 0.0, 1.0)`
 >
 > > [!note] for black lines on a white background do `x * y`
- `fwidth` is inacurate use `vec2(length(dFdx(uv)), length(dFdy(uv)))` instead
- Better MipMapping/Sampling bgolus.medium.com/sharper-mipmapping-using-shader-based-supersampling-ed7aadb47bec
- Bokeh Blur `smoothstep(0.22, 0.18, length(uv))`
- AA Pixel Sampling `floor(p) + min(fract(p) / fwidth(p), 1.0) - 0.5`
- Make vector face camera 
``` c
vec3 lookat(vec3 eye, vec3 v) {
    vec3 f = normalize(eye);
    vec3 s = normalize(vec3(-f.z, 0, f.x));
    return v * mat3(s, cross(s, f), -f);
}
```
- My heat map
``` c
float x4 = x * x * x * x;
vec3(x * sqrt(x), x4, x4 * x4 * x4 + x * max(0.0, cos(x * x * 2.0))); // inferno
```
- Infinyzoom
``` c
float zoom = exp2(-t) * 1.0;
float l2 = dot(uv, uv);
float d = 0.0;
float s = 0.0;
const float L = 8.0;
const float F = 1.0;
for (float i = 0.0; i < L; ++i) { 
    float k = fract((i - t) / L);
    float f = exp2(k * L) * F;
    float a = (1.0 - cos(k * TAU)) / f;
    d += fbm(uv / (0.3 + sqrt(1.0 - l2 * zoom * zoom)) * f, 3) * a;
    s += a;
    uv = cos(i) * uv + sin(i) * vec2(-uv.y, uv.x);
}
d /= s;
```
- ShaderToy Pack
``` c
float pack3(vec3 v) {
    v = clamp(v, vec3(0), vec3(0.998));
    return v.x + floor(v.y * 256.0) + floor(v.z * 256.0) * 256.0;
}

vec3 unpack3(float f) {
    return vec3(fract(f), fract(floor(f) / 256.0), fract(floor(f / 256.0) / 256.0));
}
```
- Derivative for constant line thickness
``` c
float l = fract(4.0 * length(uv * uv)); // local space x4 smaller
float dl = 4.0 * 2.0 * length(uv); // l derivative
// line with 10% width of local space width
float lines = smoothstep((0.1 + 0.01) * dl, (0.1 - 0.01) * dl, l);
```
