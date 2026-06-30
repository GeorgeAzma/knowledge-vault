---
aliases:
  - Outer Product
  - Exterior Product
---
### Formula $\mathbf{a}\wedge\mathbf{b}=\vec{A}$
- $\vec{A}$ [[Bivector]] 
![[Wedge Product.webp#rounded|200]]
### Properties
- $\mathbf{a}\wedge\mathbf{b}=-\mathbf{b}\wedge\mathbf{a}$ [[Commutativity|anticommutative]]
- $\mathbf{a}\wedge\mathbf{a}=0$
- $\mathbf{a}\wedge\mathbf{b}=\huge\frac{\mathbf{a}\mathbf{b}-\mathbf{b}\mathbf{a}}{2}$ `dot product cancels out`
### What It Does
- similar to [[Determinant]], outputs area and orientation of parallelogram made with 2 vectors
- unlike [[Determinant]] output is not a single number, it has it's own unit [[Bivector]]
- wedge product is multiplying unit vectors
### Example `2 vector area`
##### Using Wedge Product 
- $\vec{x}=\begin{bmatrix}1\\0\end{bmatrix},\quad\vec{y}=\begin{bmatrix}0\\1\end{bmatrix}$
- $v_1=\begin{bmatrix}x_1\\ y_1\end{bmatrix}=x_1\vec{x}+y_1\vec{y}$
- $v_2=\begin{bmatrix}x_2\\ y_2\end{bmatrix}=x_2\vec{x}+y_2\vec{y}$
$$\begin{align}\text{Area}=v_1\wedge v_2
&=(x_1{\color{WildStrawberry}\vec{x}}+y_1{\color{forestgreen}\vec{y}})\wedge(x_2{\color{WildStrawberry}\vec{x}}+y_2{\color{forestgreen}\vec{y}})\\
&=x_1x_2{\color{WildStrawberry}\vec{x}}\wedge{\color{WildStrawberry}\vec{x}}+x_1y_2{\color{WildStrawberry}\vec{x}}\wedge{\color{forestgreen}\vec{y}}+y_1x_2{\color{forestgreen}\vec{y}}\wedge{\color{WildStrawberry}\vec{x}}+y_1y_2{\color{forestgreen}\vec{y}}\wedge{\color{forestgreen}\vec{y}}\\
&=x_1y_2{\color{WildStrawberry}\vec{x}}\wedge{\color{forestgreen}\vec{y}}+y_1x_2{\color{forestgreen}\vec{y}}\wedge{\color{WildStrawberry}\vec{x}}\\
&=x_1y_2{\color{WildStrawberry}\vec{x}}\wedge{\color{forestgreen}\vec{y}}-y_1x_2{\color{WildStrawberry}\vec{x}}\wedge{\color{forestgreen}\vec{y}}\\
&=(x_1y_2-y_1x_2){\color{WildStrawberry}\vec{x}}\wedge{\color{forestgreen}\vec{y}}
\end{align}$$
Outputs [[bivector]] unit ${\color{WildStrawberry}\vec{x}}\wedge{\color{forestgreen}\vec{y}}$
##### Using [[Determinant]]
- $\text{Area}=|\det\begin{bmatrix}x_1&x_2 \\ y_1&y_2\end{bmatrix}|=|x_1y_2-x_2y_1|$
### [[Bivector]] To Vector $\vec{B}\wedge\vec{a}=T$
- $T$ Trivector
##### Resource youtu.be/htYh-Tq7ZBI
