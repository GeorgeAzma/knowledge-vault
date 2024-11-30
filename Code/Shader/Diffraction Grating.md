alanzucconi.com/2017/07/15/the-mathematics-of-diffraction-grating/
```c
// w = 400-700nm (0-1)
vec3 zucconi6(float w) {
	vec3 xa = vec3(3.5458, 2.9322, 2.4159) * w - vec3(2.4657, 1.4432, 0.6689);
	vec3 xb = vec3(3.9030, 3.2118, 3.9658) * w - vec3(0.4582, 2.7862, 2.6202);
	return clamp(1.0 - xa * xa - vec3(0.0231, 0.1522, 0.5260), 0.0, 1.0) + 
	       clamp(1.0 - xb * xb - vec3(0.8489, 0.8844, 0.7394), 0.0, 1.0);
}

const float d = 1600.0; // Diffraction grating distance (in nanometers)
float dl = dot(light_dir, tangent);
float dv = dot(view_dir, tangent);
float dd = d * abs(dl - dv);
for (float n = 1.0; n <= 5.0; ++n) {
    float wavelen = (dd / n - 400.0) / 300.0;
    wave_col += zucconi6(wavelen);
}
col += wave_col;
```
