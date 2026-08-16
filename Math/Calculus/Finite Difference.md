---
aliases:
  - Finite Difference Method
---
For calculating [[Derivative|derivatives]] in a discrete space
### $\dfrac{f(x+h)-f(x-h)}{2h}$ `central difference
 more accurate than forward difference $\lim_\limits{h\to0}\dfrac{f(x+h)-f(h)}{h}$ (accuracy is $\mathcal{O}(h^2)$ instead of $\mathcal{O}(h)$)
#### Derive Finite Difference Method Using [[Taylor Series]]
$f(x\pm h)=\sum_{n=0}^{\infty}{\dfrac{f^{(n)}(x)}{n!}(\pm h)^n}$ `taylor series when a = x, evaluated at x + h or x - h`
$f(x\pm h)$ **Expanded** $f(x)\pm hf'(x)+\dfrac{h^2}{2}f''(x)\pm\dfrac{h^3}{6}f'''(x)+\dots$
$f(x+h)-f(x-h)=2hf'(x)+\dfrac{h^3}{3}f'''(x)+\dots$ `even terms cancel`
##### Solve for $f'(x)$
$f'(x)=\dfrac{f(x+h)-f(x-h)}{2h}-\dfrac{h^2}{6}-\dots$
$f'(x)\approx\dfrac{f(x+h)-f(x-h)}{2h}+\mathcal{O}(h^2)$ `assuming small h` using [[Big-O Notation]] `error grows no faster than h^2`

**Same Process For Computing [[Gradient]]** just do it for each dimension $\nabla f(x,y)=\begin{pmatrix}\dfrac{f(x+h_x,y)-f(x-h_x,y)}{2h_x}\\\dfrac{f(x,y+h_y)-f(x,y-h_y)}{2h_y}\end{pmatrix}$
**Same Process For Computing [[Divergence]]** just compute finite difference for all dimensions and sum them
$\nabla\cdot\mathbf{F}(x,y)=\dfrac{F_x(x+h_x,y)-F_x(x-h_x,y)}{2h_x}+\dfrac{F_y(x,y+h_y)-F_y(x,y-h_y)}{2h_y}$

**Same Process For Computing [[Curl]]** just compute these partial derivatives $\partial_y\mathbf{F}_z,\partial_z\mathbf{F}_y,~~\partial_z\mathbf{F}_x,\partial_x\mathbf{F}_z,~~\partial_x\mathbf{F}_y,\partial_y\mathbf{F}_x$
same as partial derivatives in the [[Gradient]] calculation, then use these components to calculate [[curl]] $\begin{pmatrix}\partial_y\mathbf{F}_z-\partial_z\mathbf{F}_y\\\partial_z\mathbf{F}_x-\partial_x\mathbf{F}_z\\\partial_x\mathbf{F}_y-\partial_y\mathbf{F}_x\end{pmatrix}$
