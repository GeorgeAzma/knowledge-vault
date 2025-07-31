---
aliases:
  - Perspective
  - Look At View Matrix
---
### Perspective Projection
### $$\begin{bmatrix}
\frac{1}{\text{aspect}\cdot\tan\frac{\text{fov}}{2}}&0&0&0\\
0&\frac{1}{\tan\frac{\text{fov}}{2}}&0&0\\
0&0&\frac{z_\text{far}+z_\text{near}}{z_\text{near}-z_\text{far}}&\frac{2\cdot z_\text{far}\cdot z_\text{near}}{z_\text{near}-z_\text{far}}\\
0&0&-1&0\\
\end{bmatrix}$$
### Look At View
- `z = normalize(camera - target)`
- `x = normalize(cross(vec3(0, 1, 0), z))`
- `y = cross(z, x)`
### $$\begin{bmatrix}
x.x&x.y&x.z&-x\cdot \text{camera}\\
y.x&y.y&y.z&-y\cdot \text{camera}\\
z.x&z.y&z.z&-z\cdot \text{camera}\\
0&0&0&1
\end{bmatrix}$$
### Model
### $$\begin{bmatrix}
s_x\cos\theta&-s_y\sin\theta&0&t_x\\
s_x\sin\theta&s_y\cos\theta&0&t_y\\
0&0&s_z&t_z\\
0&0&0&1
\end{bmatrix}$$

> [!warning] Only rotates around $z$
### 2D
calculating perspective approximation using uv's
``` c
// z changes as y changes similar to ground 
// and +1 to make closest ground be 1 away
float z = (uv.y * 0.5 + 0.5) + 1.0; 
vec3 p = vec3(uv, z); // uv is -1 to 1 or -aspect to aspect
// look down a bit to the ground (so along x)
p.yz = cos(PI * 0.1) * p.yz + sin(PI * 0.1) * vec2(-p.z, p.y);
// rotate along y
p.xz = cos(iTime) * p.xz + sin(iTime) * vec2(-p.z, p.x);
// rotate 90 deg along x to make grid shader lie down like ground
p.yz = cos(PI * 0.5) * p.yz + sin(PI * 0.5) * vec2(-p.z, p.y);
// perspective division
uv = p.xy / p.z; // note: do p.xz / p.y to avoid 90 deg x rotation
uv *= 4.0; // makes grid smaller so it looks further
```
