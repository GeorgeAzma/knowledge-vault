- iquilezles.org/articles/distfunctions2d
- iquilezles.org/articles/distfunctions
- mercury.sexy/hg_sdf
``` c#
float union(float d1, float d2) {
	return min(d1, d2);
}

float subtract(float d1, float d2) {
	return max(-d1, d2);
}

float intersect(float d1, float d2) {
	return max(d1, d2);
}

float xor(float d1, float d2) {
	return max(min(d1, d2), -max(d1, d2));
}
// same as smooth_union
float smin(float d1, float d2, float k) { 
	float h = clamp(0.5 + 0.5 * (d2 - d1) / k, 0.0, 1.0); 
	return mix(d2, d1, h) - k * h * (1.0 - h); 
} 

float smooth_subtraction(float d1, float d2, float k) { 
	float h = clamp(0.5 - 0.5 * (d2 + d1) / k, 0.0, 1.0); 
	return mix(d2, -d1, h) + k * h * (1.0 - h); 
} 

float smooth_intersection(float d1, float d2, float k) { 
	float h = clamp(0.5 - 0.5 * (d2 - d1) / k, 0.0, 1.0); 
	return mix(d2, d1, h) + k * h * (1.0 - h); 
}

float scale(vec3 p, float s) {
	return sdf(p / s) * s;
}

// Note: has some issues described here:
// iquilezles.org/articles/sdfrepetition
// Tip: You can use round(p / spacing) as an object id
float repetition(vec3 p, vec3 spacing) {
	return sdf(p - spacing * round(p / spacing));
}

float correct_repetition(vec2 p, float s) { 
	vec2 id = round(p / s); 
	vec2 o = sign(p - s * id);
	float d = 1e20; 
	for (int j = 0; j < 2; j++) {
		for (int i = 0; i < 2; i++) { 
			vec2 rid = id + vec2(i, j) * o; 
			vec2 r = p - s * rid; 
			d = min(d, sdf(r)); 
		} 
	}
	return d; 
}

// Note: this doesn't have any issues unlike repetition
float mirrored_repetition( vec2 p, float s ) { 
	vec2 id = round(p / s); 
	vec2 r = p - s * id; 
	vec2 m = vec2(((int(id.x) & 1) == 0) ? r.x : -r.x, 
	              ((int(id.y) & 1) == 0) ? r.y : -r.y); 
	return sdf(m, id); 
}

// Note: this doesn't have any issues unlike repetition
float repetition_rotational(vec2 p, int n) { 
	float sp = 6.283185 / float(n); 
	float an = atan(p.y,p.x); 
	float id = floor(an / sp); 
	float a1 = sp * (id + 0.0); 
	float a2 = sp * (id + 1.0); 
	vec2 r1 = mat2(cos(a1), -sin(a1), sin(a1), cos(a1)) * p; 
	vec2 r2 = mat2(cos(a2), -sin(a2), sin(a2), cos(a2)) * p; 
	return min(sdf(r1, id + 0.0), sdf(r2, id + 1.0)); 
}

// Note: this also enlarges an sdf
// there is no general way to prevent that
float round(float r) { 
	return sdf(p) - r;
}

// Revolves 2D primitives with distance from the origin 'o'
float revolution(vec3 p, float o) {
	vec2 q = vec2( length(p.xz) - o, p.y ); 
	return sdf(q)
}

float extrusion(vec3 p, float h) { 
	float d = sdf(p.xy);
	vec2 w = vec2(d, abs(p.z) - h); 
	return min(max(w.x, w.y), 0.0) + length(max(w, 0.0)); 
}

float elongate(vec3 p, vec3 h) { 
	vec3 q = abs(p) - h; 
	return sdf(sign(p) * max(q, vec3(0))) + min(max(q.x, max(q.y, q.z)), 0.0); 
}

float onion(float sdf, float thickness) { 
	return abs(sdf) - thickness; 
}

float displace(vec3 p) {
	return sdf(p) + displacement(p);
}

float twist(vec3 p, float k) {
	float c = cos(k * p.y); 
	float s = sin(k * p.y); 
	mat2 m = mat2(c, -s, s, c); 
	vec3 q = vec3(m * p.xz, p.y); 
	return sdf(q);
}

float bend(vec3 p, float k) { 
	float c = cos(k * p.x); 
	float s = sin(k * p.x); 
	mat2 m = mat2(c, -s, s, c); 
	vec3 q = vec3(m * p.xy, p.z); 
	return sdf(q); 
}
```
