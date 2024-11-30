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
### Antialiasing
``` rust
let dt_sdf = fwidth(sdf);
let aa = clamp(0.5 - sdf / dt_sdf, 0.0, 1.0);
let stroke_aa = clamp(0.5 - (sdf + stroke_width) / dt_sdf, 0.0, 1.0);
color = mix(stroke_color, color, stroke_aa);
color.a *= aa;
```
### My Random SDFs
``` c
// Teardrop
uv.y = 0.5 - uv.y * 0.5;
float d = 1.0 - normalize(uv).y * abs(1.0 - uv.y * uv.y + uv.y);
float f = fwidth(d);
color.a = smoothstep(f, -f, d);
```
