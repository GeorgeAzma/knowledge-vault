### $\nabla\mathbf{F}=\begin{pmatrix}\dfrac{\partial F_x}{\partial x}&\dfrac{\partial F_y}{\partial y}&\dfrac{\partial F_z}{\partial z}\end{pmatrix}$
#### [[Geometric Algebra]] $\nabla=e_x\partial_x+e_y\partial_y+e_z\partial_z+\dots$
- $\nabla\mathbf{F}=\nabla\cdot\mathbf{F}+\nabla\wedge\mathbf{F}$ [[Geometric Product]]
- $\nabla\times F=-I(\nabla\wedge\mathbf{F})$ where $I=e_x~e_y~e_z$ [[pseudoscalar]]
#### [[Finite Difference]]
``` c
// 2D
vec2 h = vec2(0.001, 0);
vec2 p = vec2(f(p + h.xy), f(p + h.yx));
vec2 n = vec2(f(p - h.xy), f(p - h.yx));
vec2 grad = (p - n) / h.x * 0.5;

// 3D
vec2 h = vec2(0.001, 0);
vec3 p = vec3(f(p + h.xyy), f(p + h.yxy), f(p + h.yyx));
vec3 n = vec3(f(p - h.xyy), f(p - h.yxy), f(p - h.yyx));
vec3 grad = (p - n) / h.x * 0.5;
```