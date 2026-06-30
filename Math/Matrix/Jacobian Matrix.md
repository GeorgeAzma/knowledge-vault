Derivative of outputs with respect to inputs
### Formula $J_f(x,y)=\begin{bmatrix}\dfrac{\partial f_1}{\partial x} & \dfrac{\partial f_1}{\partial y} \\ \dfrac{\partial f_2}{\partial x} & \dfrac{\partial f_2}{\partial y}\end{bmatrix}$
describes how tiny 1x1 square gets transformed linearly
- $\det(J)$ how tiny square's area gets transformed
###### Shader Intuition
if you distort UVs, jacobian is UV derivatives
jacobian [[determinant]] is how much UVs get squashed or stretched at that pixel coordinate
- if you only transform either $y$ coordinate using $x$ or $x$ coordinate using $y$ then [[determinant]] stays constant, so no squashing or stretching
#### Example $f_1(x,y)=x^2y,\quad f_2(x,y)=5x+\sin y$
$J_f(x,y)=\begin{bmatrix}2x&1\\5&\cos y\end{bmatrix}$
$\det(J_f)=2x\cos y-5$