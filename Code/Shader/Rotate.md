### 2D
``` c
vec2 rot(vec2 v, float a) {
	return cos(a) * v + sin(a) * vec2(-v.y, v.x);
}
```
### 3D
``` c
// Euler
vec3 rot(vec3 v, vec3 a) {
	v.xy = v.xy * cos(a.z) + vec2(-v.y, v.x) * sin(a.z);
	v.yz = v.yz * cos(a.x) + vec2(-v.z, v.y) * sin(a.x);
	v.zx = v.zx * cos(a.y) + vec2(-v.x, v.z) * sin(a.y);
    return v;
}
// Quaternion ('q' must be normalized)
vec3 rot(vec3 v, vec4 q) {
	return v + 2.0 * cross(q.xyz, cross(q.xyz, v) + q.w * v);
}

// 'axis' must be normalized
vec3 rot_axis(vec3 v, vec3 axis, float angle) {
	return mix(dot(v, axis) * axis, v, cos(angle)) + sin(angle) * cross(axis, v);
}


vec3 rot90_axis(vec3 v, vec3 axis) {
	return dot(v, axis) * axis + cross(axis, v);
}
```
