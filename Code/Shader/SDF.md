iquilezles.org/articles/distfunctions2d/
iquilezles.org/articles/distfunctions
### 3D
``` c#
float sphere(vec3 p, float s) {
	return length(p) - s;
}

float box(vec3 p, vec3 s) {
	vec3 q = abs(p) - s;
	return length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0);
}

float round_box(vec3 p, vec3 s, float r) {
	vec3 q = abs(p) - s + r;
	return length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0) - r;
}

float box_outline(vec3 p, vec3 b, float e) { 
	p = abs(p) - b; 
	vec3 q = abs(p + e) - e; 
	return min(min(
	    length(max(vec3(p.x, q.y, q.z), 0.0)) + 
	    min(max(p.x, max(q.y, q.z)), 0.0), 
	    length(max(vec3(q.x, p.y, q.z), 0.0)) + 
	    min(max(q.x, max(p.y, q.z)), 0.0)), 
	    length(max(vec3(q.x, q.y, p.z), 0.0)) + 
	    min(max(q.x, max(q.y, p.z)), 0.0)); 
}

float torus(vec3 p, vec2 t) { 
	vec2 q = vec2(length(p.xz) - t.x, p.y); 
	return length(q) - t.y; 
}
```
### 2D
``` c
float segment(vec2 p, vec2 a, vec2 b) {
  vec2 pa = p - a;
  vec2 ba = b - a;
  float h = clamp(dot(pa,ba) / dot(ba,ba), 0.0, 1.0);
  return length(pa - ba * h);
}

float rect(vec2 p, vec2 s) {
	vec2 q = abs(p) - s;
	return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0);
}

float round_rect(vec2 p, vec2 s, float r) {
	vec2 q = abs(p) - s + r;
	return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - r;
}

float rect_outline(vec2 p, vec2 s, float e) { 
	p = abs(p) - s; 
	vec2 q = abs(p + e) - e; 
	return min(
	    length(max(vec2(p.x, q.y), 0.0)) + 
	    min(max(p.x, q.y), 0.0), 
	    length(max(vec2(q.x, p.y), 0.0)) + 
	    min(max(q.x, p.y), 0.0)), 
	    length(max(vec2(q.x, q.y), 0.0)); 
}
```
### My Random SDFs
``` c
// Teardrop
uv.y = 0.5 - uv.y * 0.5;
float d = 1.0 - normalize(uv).y * abs(1.0 - uv.y * uv.y + uv.y);
float f = fwidth(d);
color.a = smoothstep(f, -f, d);
```
### [[Quadratic Bezier]]
``` rust
fn cross2(a: vec2f, b: vec2f) -> f32 {
    return a.x * b.y - a.y * b.x;
}

// shadertoy.com/view/ftdGDB
fn bezier_sdf(p: vec2f, A: vec2f, B: vec2f, C: vec2f) -> f32 {
    let EPS = 1e-6;
    let a = B - A;
    let b = A - 2.0 * B + C;
    let c = a * 2.0;
    let d = A - p;

    let kk = 1.0 / dot(b, b);
    let kx = kk * dot(a, b);
    let ky = kk * (2.0 * dot(a, a) + dot(d, b)) / 3.0;
    let kz = kk * dot(d, a);

    var res = 0.0;
    var sgn = 0.0;

    let p1 = ky - kx * kx;
    let p3 = p1 * p1 * p1;
    let q = kx * (2.0 * kx * kx - 3.0 * ky) + kz;
    var h = q * q + 4.0 * p3;
    if h >= 0.0 {
        h = sqrt(h);
        let x = 0.5 * (vec2f(h, -h) - q);
        let uv = sign(x) * pow(abs(x), vec2f(1.0 / 3.0));
        let t = saturate(uv.x + uv.y - kx) + EPS;
        let q = d + (c + b * t) * t;
        res = dot(q, q);
        sgn = cross2(c + 2.0 * b *  t, q);
    } else {
        let z = sqrt(-p1);
        let v = acos(q / (p1 * z * 2.0)) / 3.0;
        let m = cos(v);
        let n = sin(v) * sqrt(3.0);
        let t = saturate(vec3f(m + m, -n - m, n - m) * z-kx) + EPS;
        let qx = d + (c + b * t.x) * t.x;
        let dx = dot(qx, qx);
        let sx = cross2(c + 2.0 * b * t.x, qx);
        let qy = d + (c + b * t.y) * t.y;
        let dy = dot(qy, qy);
        let sy = cross2(c + 2.0 * b * t.y, qy);
        res = select(dy, dx, dx < dy);
        sgn = select(sy, sx, dx < dy);
    }
    return sign(sgn) * sqrt(res);
}

// Note: might need to add offset to avoid edge cases
// let dir = normalize(c - a) * 0.00005;
// let bd = bezier_sdf(p, a + dir, b + dir, c - dir);
```
