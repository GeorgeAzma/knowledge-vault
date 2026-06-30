#### $\nabla\times\mathbf{F}=\begin{vmatrix}\mathbf{i}&\mathbf{j}&\mathbf{k}\\\frac{\partial}{\partial x}&\frac{\partial}{\partial y}&\frac{\partial}{\partial z}\\ F_x&F_y&F_z\end{vmatrix}$
#### Derive via [[Geometric Algebra]]
- $\nabla=\sum_i e_i\partial_i$ and $\mathbf{F}=\sum_j e_j\mathbf{F}_j$
- $\nabla\land\mathbf{F}=(\sum_i e_i\partial_i)\land(\sum_j e_j\mathbf{F}_j)$
- $\nabla\land\mathbf{F}=\sum_{i,j} (e_i\land e_j)\partial_i\mathbf{F}_j$
- $\nabla\land\mathbf{F}=\sum_{i<j}(e_i\land e_j\partial_i\mathbf{F}_j+e_j\land e_i\partial_j\mathbf{F}_i)$ 
- $\nabla\land\mathbf{F}=\sum_{i<j}(e_i\land e_j\partial_i\mathbf{F}_j-e_i\land e_j\partial_j\mathbf{F}_i)$ 
   - since $e_i\land e_j=-e_j\land e_i$ and $e_i\land e_i=0$
- $\nabla\land\mathbf{F}=\sum_{i<j}e_i\land e_j(\partial_i\mathbf{F}_j-\partial_j\mathbf{F}_i)$ 
##### Apply in 3D
$\nabla\land\mathbf{F}=\begin{aligned}e_x\land e_y(\partial_x\mathbf{F}_y-\partial_y\mathbf{F}_x)\\+e_x\land e_z(\partial_x\mathbf{F}_z-\partial_z\mathbf{F}_x)\\+e_y\land e_z(\partial_y\mathbf{F}_z-\partial_z\mathbf{F}_y)\end{aligned}$ [[bivector]]
##### Convert [[Bivector]] to Curl [[Vector]] via [[Hodge Star Operator]]
$\begin{array}{l}\star(e_x\land e_y)=(e_x\land e_y)e_ze_ye_x=-e_xe_ye_ye_ze_x=-e_xe_ze_x=e_xe_xe_z=e_z\\\star(e_x\land e_z)=(e_x\land e_z)e_ze_ye_x=e_xe_ye_x=-e_xe_xe_y=-e_y\\\star(e_y\land e_z)=(e_y\land e_z)e_ze_ye_x=e_ye_ze_ze_ye_x=e_ye_ye_x=e_x\end{array}$
$\nabla\times\mathbf{F}=\star(\nabla\land\mathbf{F})=\begin{aligned}e_z(\partial_x\mathbf{F}_y-\partial_y\mathbf{F}_x)\\-e_y(\partial_x\mathbf{F}_z-\partial_z\mathbf{F}_x)\\+e_x(\partial_y\mathbf{F}_z-\partial_z\mathbf{F}_y)\end{aligned}=\begin{pmatrix}\partial_y\mathbf{F}_z-\partial_z\mathbf{F}_y\\\partial_z\mathbf{F}_x-\partial_x\mathbf{F}_z\\\partial_x\mathbf{F}_y-\partial_y\mathbf{F}_x\end{pmatrix}$
##### Discretize via [[Finite Difference]]
- $\partial_y\mathbf{F}_z\approx\dfrac{\mathbf{F}_z(x,y+h_y,z)-\mathbf{F}_z(x,y-h_y,z)}{2h_y},\quad\partial_z\mathbf{F}_y\approx\dfrac{\mathbf{F}_y(x,y,z+h_z)-\mathbf{F}_y(x,y,z-h_z)}{2h_z}$
- $\partial_z\mathbf{F}_x\approx\dfrac{\mathbf{F}_x(x,y,z+h_z)-\mathbf{F}_x(x,y,z-h_z)}{2h_z},\quad\partial_x\mathbf{F}_z\approx\dfrac{\mathbf{F}_z(x+h_x,y,z)-\mathbf{F}_z(x-h_x,y,z)}{2h_x}$
- $\partial_x\mathbf{F}_y\approx\dfrac{\mathbf{F}_y(x+h_x,y,z)-\mathbf{F}_y(x-h_x,y,z)}{2h_x},\quad\partial_y\mathbf{F}_x\approx\dfrac{\mathbf{F}_x(x,y+h_y,z)-\mathbf{F}_x(x,y-h_y,z)}{2h_y}$
- $\nabla\times\mathbf{F}\approx\begin{pmatrix}\dfrac{\mathbf{F}_z(x,y+h_y,z)-\mathbf{F}_z(x,y-h_y,z)}{2h_y}-\dfrac{\mathbf{F}_y(x,y,z+h_z)-\mathbf{F}_y(x,y,z-h_z)}{2h_z}\\\dfrac{\mathbf{F}_x(x,y,z+h_z)-\mathbf{F}_x(x,y,z-h_z)}{2h_z}-\dfrac{\mathbf{F}_z(x+h_x,y,z)-\mathbf{F}_z(x-h_x,y,z)}{2h_x}\\\dfrac{\mathbf{F}_y(x+h_x,y,z)-\mathbf{F}_y(x-h_x,y,z)}{2h_x}-\dfrac{\mathbf{F}_x(x,y+h_y,z)-\mathbf{F}_x(x,y-h_y,z)}{2h_y}\end{pmatrix}$
``` c
// 3D
vec2 h = vec2(0.001, 0);
vec2 dx = f(p + h.xyy).yz - f(p - h.xyy).yz;
vec2 dy = f(p + h.yxy).xz - f(p - h.yxy).xz;
vec2 dz = f(p + h.yyx).xy - f(p - h.yyx).xy;
vec3 curl = (dy.y - dz.y, dz.x - dx.y, dx.x - dy.x) / h.x * 0.5;

// 2D
vec2 h = vec2(0.001, 0);
float dx = f(p + h.xy).y - f(p - h.xy).y;
float dy = f(p + h.yx).x - f(p - h.yx).x;
float curl = (dx - dy) / h.x * 0.5;
```
