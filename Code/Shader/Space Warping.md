### Simple
##### [[Rotate|Rotation]]
``` c
vec2 rot(vec2 v, float a) {
	return cos(a) * v + sin(a) * vec2(-v.y, v.x);
}

vec3 rot_axis(vec3 v, vec3 axis, float angle) {
	return mix(dot(v, axis) * axis, v, cos(angle)) + sin(angle) * cross(axis, v);
}

vec2 rot_around(vec2 p, vec2 c, float a) {
    return rotate(p - c, a) + c;
}
```
##### Radial
``` c
vec2 swirl(vec2 p, float k) {
    float r = length(p);
    float a = atan(p.y, p.x) + k * r;
    return vec2(cos(a), sin(a)) * r;
}

vec2 twist(vec2 p, float k) {
    float a = k * length(p);
    return rot(p, a);
}

vec2 pinch(vec2 p, float k) {
    float r = length(p);
    return p * pow(r, k);
}

vec2 bulge(vec2 p, float k) {
    float r = length(p);
    return p * (1.0 + k * r * r);
}

vec2 fisheye(vec2 p, float k) {
    float r = length(p);
    return p / (1.0 + k * r);
}
```
##### Bend
``` c
vec2 bend_x(vec2 p, float k) {
    p.y += k * p.x * p.x;
    return p;
}

vec2 bend_y(vec2 p, float k) {
    p.x += k * p.y * p.y;
    return p;
}
```
##### [[SDF Operations|Repeat]]
``` c
vec2 repeat(vec2 p, vec2 spacing) {
	return p - spacing * round(p / spacing);
}

vec4 repeat_rotation(vec2 p, int n) { 
	float sp = 6.283185 / float(n); 
	float an = atan(p.y, p.x); 
	float id = floor(an / sp);
	vec2 r = cos(sp * id) * p + sin(sp * id) * vec2(-p.y, p.x); 
	return vec4(r, id); 
}

vec2 hex_uv(vec2 p) {
    vec4 hc = floor(vec4(p, p - vec2(0.5, 1) ) / vec2(1, 1.7320508).xyxy);
    vec4 h = p.xyxy - vec4(hc.xy + 0.5, hc.zw + 1.0) * vec2(1, 1.7320508).xyxy;   
    return dot(h.xy, h.xy) < dot(h.zw, h.zw) ? h.xy : h.zw;
}

vec4 hex_uv_id(vec2 uv) {    
    const vec2 s = vec2(1, 1.7320508);
    vec4 hex_id = floor(vec4(uv, uv - vec2(0.5, 1)) / s.xyxy) + 0.5;
    vec4 hex_uv = vec4(uv - hex_id.xy * s, uv - (hex_id.zw + 0.5) * s);
    return dot(hex_uv.xy, hex_uv.xy) < dot(hex_uv.zw, hex_uv.zw)
        ? vec4(hex_uv.xy, hex_id.xy) 
        : vec4(hex_uv.zw, hex_id.zw + 0.5);    
}
```
