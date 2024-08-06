- Shadertoy Template
``` c
void mainImage(out vec4 fragColor, vec2 fragCoord) {
    float mr = min(iResolution.x, iResolution.y);
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / mr;

    float d = 0.0;
    vec3 col = vec3(d);

    fragColor = vec4(col, 1);
}
```
- Color Correction
```c
// Brightness, Contrast
(col - 0.5) * contrast + 0.5 + brightness
// Saturation
mix(vec3(dot(col, vec3(0.299, 0.587, 0.114))), col, 1.0 + saturation)
// Exposure
(1.0 + exposure) * col
// Gamma
pow(col, gamma)
```
- Blend Colors `mix(dst, vec4(src.rgb, 1), src.a)`
- Use thebookofshaders.com/edit.php To visualize code line by line and see the slow lines
- To make a noise function tillable, pass in scale parameter
  multiply uv by scale, also pass scale to hash function that noise uses
  do `uv = mod(uv, scale)` and optionally `uv += SEED`
- Best Articles iquilezles.org/articles
- Luminance `expects linear rgb, no big deal tho`
``` c
float luma(vec3 c) {
  return dot(c, vec3(0.299, 0.587, 0.114));
}
```
- Rotate 2D
``` c
vec2 rot2d(vec2 v, float a) {
	return cos(a) * v + sin(a) * vec2(-v.y, v.x);
}
```
- Rotate 3D
``` c
// Euler
vec3 rot3d(vec3 v, vec3 a) {
	v.xy = v.xy * cos(a.z) + vec2(-v.y, v.x) * sin(a.z);
	v.yz = v.yz * cos(a.x) + vec2(-v.z, v.y) * sin(a.x);
	v.zx = v.zx * cos(a.y) + vec2(-v.x, v.z) * sin(a.y);
    return v;
}
// Quaternion ('q' must be normalized)
vec3 rot3d(vec3 v, vec4 q) {
	return v + 2.0 * cross(q.xyz, cross(q.xyz, v) + q.w * v);
}

// 'axis' must be normalized
vec3 rot3d_axis(vec3 v, vec3 axis, float angle) {
	float c = cos(angle);
	return c * v + sin(angle) * cross(axis, v) + (1.0 - c) * dot(v, axis) * axis;
}
```
- sRGB-LinearRGB conversions
``` c
vec3 lrgb2srgb(vec3 linear) { return  mix(12.92 * linear, 1.055 * pow(linear, 1.0 / 2.4) - 0.055, step(0.0031308, linear)); }
vec3 srgb2lrgb(vec3 srgb) { return mix(srgb / 12.92, pow((srgb + 0.055) / 1.055, 2.4), step(0.04045, srgb)); }
```
- Diffuse `max(dot(norm, lightDir), 0.0)`
- Specular `pow(max(dot(normal, normalize(lightDir + viewDir)), 0.0), p)`
- Good Fresnel Like Halo `smoothstep(1.02, 0.98, dot(uv, uv)) * pow(dot(uv, uv), 8.0)`
- Direction from FOV `normalize(vec3(uv, tan((PI - radians(fov)) * 0.5)))`
- Direction from [[Focal Length]] `normalize(vec3(uv / focal_length, 1))`
- Direction from [[Focal Length|Diopter]] `normalize(vec3(uv * diopter, 1))`
- HSV but only Hue
``` c
vec3 hue_shift(vec3 col, float hue) {
    return mix(vec3(dot(vec3(0.333), col)), col, cos(hue)) + cross(vec3(0.577), col) * sin(hue);
}
```
- Smooth Min
``` c
float smin(float a, float b, float k) {
	float h = clamp(0.5 + 0.5 * (a - b) / k, 0.0, 1.0);
	return mix(a, b, h) - k * h * (1.0 - h);
}
```
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
- Tilable UV angle `2. * abs(fract(angle * freq + off) - .5)`
- Fire Color: `vec3(smoothstep(0.0, 0.6, t), smoothstep(0.0, 1.1, t), smoothstep(0.65, 0.9, t) * .8)`
- Simple Palette
``` c
vec3 pal(float t, vec3 a, vec3 b, vec3 c, vec3 d) {
    return a + b * cos(6.28318 * (c * t + d));
}
```
- Trigonometry is cheap on the GPU
- [[Useful Functions]]
- Quickly format glsl code evanw.github.io/glslx/
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
-  ACES Tonemapping
``` c
vec3 aces(vec3 x) {
  return clamp((x * (2.51 * x + 0.03)) / (x * (2.43 * x + 0.59) + 0.14), 0.0, 1.0);
}
```
- Reinhard Tonemapping `col / (col + 1.0)`
### Less Useful
- Quadratic interpolation of 3 samples
``` c
vec4 filter_quadratic(vec3 a, vec3 b, vec3 c, float t) {
    return mix(mix(a, b, 0.5 * t + 0.5), mix(b, c, 0.5 * t), t);
}
```
- Perfect Grid (Almost)
``` rust
// From bgolus.medium.com/the-best-darn-grid-shader-yet-727f9278b9d8#93b2
let line_width = 0.1;
let uv_ddxy = vec4f(dpdx(uv), dpdy(uv));
let uv_deriv = vec2f(length(uv_ddxy.xz), length(uv_ddxy.yw));
let invert_line = line_width > 0.5;  
let target_width = if invert_line { 1.0 - line_width } else { line_width };  
let draw_width = clamp(target_width, uv_deriv, vec2f(0.5));  
let line_aa = uv_deriv * 1.5;  
let grid_uv = abs(fract(uv) * 2.0 - 1.0);  
grid_uv = invert_line ? grid_uv : 1.0 - grid_uv;  
let grid2 = smoothstep(draw_width + line_aa, draw_width - line_aa, grid_uv);  
grid2 *= clamp(target_width / draw_width, 0.0, 1.0);  
grid2 = lerp(grid2, target_width, clamp(uv_deriv * 2.0 - 1.0, vec2f(0.0), vec2f(1.0)));  
grid2 = invert_line ? 1.0 - grid2 : grid2;  
let grid = lerp(grid2.x, 1.0, grid2.y);
```
- Vignette `pow(uv.x * (1.0 - uv.y) * uv.y * (1.0 - uv.x) * 15.0, 0.25)` `UV01`
> [!tip] Combine white grid lines and such with `mix(x, 1., y)` 
 > > [!error] Inaccurate `max(x, y)` or `clamp(x + y, 0., 1.)`
 >
 > > [!note] for black lines on a white background do `x * y`
- `fwidth` is inacurate use `vec2(length(dFdx(uv)), length(dFdy(uv)))` instead
- Better MipMapping/Sampling bgolus.medium.com/sharper-mipmapping-using-shader-based-supersampling-ed7aadb47bec
- Bokeh Blur `smoothstep(0.22, 0.18, length(uv))`
- Rounded NGon SDF with stroke support:
``` rust
const PI: f32 = 3.141592653589793; 

fn sdf_ngon(uv: vec2f, sides: i32, roundness: f32) -> f32 {
    let an = PI / f32(sides);
    let r = cos(an);
    var p = uv * (1.0 + roundness / r);
    let he = r * tan(an);
    p = -p.yx;
    let bn = 2. * an * floor((atan2(p.y, p.x) + an) / an * .5);
    let cs = vec2f(cos(bn), sin(bn));
    p = mat2x2(cs.x, -cs.y, cs.y, cs.x) * p;
    return (length(p - vec2(r, clamp(p.y, -he, he))) * sign(p.x - r) - roundness) / (1.0 + roundness);
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4f {
    var color = in.color;
    let f = length(vec2f(dpdx(in.uv.x), dpdy(in.uv.y))) * 2.;
    let d = sdf_ngon(in.uv, in.sides, in.roundness);
    color = mix(color, in.stroke_color, smoothstep(-in.stroke_width, -in.stroke_width + f, d));
    color.a *= smoothstep(0.0, -f, d);
    return color;
}
```
- SDF Antialiasing
``` rust
let dt_sdf = fwidth(sdf);
let aa = clamp(0.5 - sdf / dt_sdf, 0.0, 1.0);
let stroke_aa = clamp(0.5 - (sdf + stroke_width) / dt_sdf, 0.0, 1.0);
color = mix(stroke_color, color, stroke_aa);
color.a *= aa;
```
- AA Pixel Sampling `floor(p) + min(fract(p) / fwidth(p), 1.0) - 0.5`
- Make vector face camera 
``` c
vec3 lookat(vec3 eye, vec3 v) {
    vec3 f = normalize(eye);
    vec3 s = normalize(vec3(-f.z, 0, f.x));
    return v * mat3(s, cross(s, f), -f);
}
```
