``` c
float hash11(float p) {
	return fract(sin(p) * 43758.5453);
}
float hash12(vec2 p) {
	return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}
vec2 hash22(vec2 p) {
	return fract(sin(p) * 43758.5453);
}
```
