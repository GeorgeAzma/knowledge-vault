### 2D
``` c
// https://www.shadertoy.com/view/wsBfzK
float wavelet(vec2 p, float phase, float scale) {
    float d = 0.0, s = 1.0, m = 0.0, a;
    for (float i = 0.0; i < 4.0; ++i) {
        vec2 q = p * s, g = fract(floor(q) * vec2(123.34, 233.53));
    	g += dot(g, g + 23.234);
		a = fract(g.x * g.y) * 1e3;// + phase * (mod(g.x + g.y, 2.0) - 1.0); // add vorticity
        q = (fract(q) - 0.5) * mat2(cos(a), -sin(a), sin(a), cos(a));
        d += sin(q.x * 10.0 + phase) * smoothstep(0.25, 0.0, dot(q, q)) / s;
        p = p * mat2(0.54, -0.84, 0.84, 0.54) + i;
        m += 1.0 / s;
        s *= scale;
    }
    return d / m;
}
```
### 3D
``` c
vec3 rot_axis(vec3 p, vec3 ax, float a) {
    return mix(dot(p, ax) * ax, p, cos(a)) + sin(a) * cross(ax, p);
}

// https://www.shadertoy.com/view/wsBfzK
float wavelet(vec3 p, float phase, float scale) {
    float d = 0.0, s = 1.0, m = 0.0, a;
    for (float i = 0.0; i < 5.0; ++i) {
        vec3 q = p * s, g = fract(floor(q) * vec3(123.34, 233.53, 314.15));
    	g += dot(g, g + 23.234);
		a = fract(g.x * g.y) * 1e3 + phase * (mod(g.x + g.y, 2.0) - 1.0);
        q = fract(q) - 0.5;
        q = rot_axis(q, normalize(tan(g + 0.1)), a);
        d += sin(q.x * 10.0 + phase) * smoothstep(0.25, 0.0, dot(q, q)) / s;
        p = rot_axis(p, normalize(vec3(-1, 1, 0)), 0.955316618) + i;
        m += 1.0 / s;
        s *= scale;
    }
    return d / m;
}
```
![[Wavelet Noise.webp#rounded|500]]
