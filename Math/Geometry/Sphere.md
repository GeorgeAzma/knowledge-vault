### Volume $\frac{4}{3}\pi r^3$
### Area $4\pi r^2$
### Formulas
- Distance between two points along a sphere $r\arccos{\huge \frac{a\cdot b}{r^2}}$
- $(\text{longitude},\text{latitude})=(arctan_2(x, z),arcsin(y))=(arctan_2(z, x),arccos(-y))$
- $(x,y,z)=(\cos(\text{latitude})\cos(\text{longitude}),\sin(\text{latitude}),\cos(\text{latitude})\sin(\text{longitude}))$
- $(x,y,z)=(uv_x,uv_y,\sqrt{1-|uv|^2})$
- Average efficiency for packing spheres in a cube $\frac{​\pi}{3\sqrt{2}}=0.74048$ or $~0.74\%$
- Best arrangment for filling space is Face Centered Cubic (FCC)
- Evenly distributing points on a sphere
``` c
float golden_ratio = 1.618033988749895; // (1.0 + sqrt(5.0)) / 2.0;
for (float point_index = 1.0; point_index < num_points; ++point_index) {
	float theta = 2.0 * PI * point_index / golden_ratio; // 3.8832220774509331546937312599254 * point_index
	float cos_phi = 1.0 - 2.0 * point_index / num_points;
	float sin_phi = sqrt(1.0 - cos_phi * cos_phi);
	vec3 point_pos = vec3(cos(theta) * sin_phi, sin(theta) * sin_phi, cos_phi);
}
```
