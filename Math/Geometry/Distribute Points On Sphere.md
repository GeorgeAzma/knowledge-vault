### [[Fibonacci]] [[Sphere]]
``` python
phi = 1.618033988749895 # (1 + sqrt(5)) / 2;
for i in range(1, n_points):
	theta = TAU / golden_ratio * i
	cos_phi = 1.0 - 2.0 * i / n_points
	sin_phi = sqrt(1.0 - cos_phi * cos_phi)
	point_pos = vec3(cos(theta) * sin_phi, sin(theta) * sin_phi, cos_phi)
```