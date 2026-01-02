`a.k.a. outer product, exterior product`
- similar to [[Determinant]], outputs area and orientation of parallelogram made with 2 vectors
- unlike [[Determinant]] output is not a single number, it has it's own unit [[Bivector]]
- wedge product is multiplying unit vectors
### Example
- $\vec{x}=\begin{bmatrix}1\\0\end{bmatrix},\quad\vec{y}=\begin{bmatrix}0\\1\end{bmatrix}$
- $v_1=\begin{bmatrix}x_1\\ y_1\end{bmatrix}=x_1\vec{x}+y_1\vec{y}$
- $v_2=\begin{bmatrix}x_2\\ y_2\end{bmatrix}=x_2\vec{x}+y_2\vec{y}$
- $\text{Area}=|\det[v_1,v_2]|=|\det\begin{bmatrix}x_1&x_2 \\ y_1&y_2\end{bmatrix}|=|x_1y_2-x_2y_1|$
**Now with Wedge Product** 
$$\begin{align}\text{Area}=v_1\wedge v_2
&=(x_1{\color{WildStrawberry}\vec{x}}+y_1{\color{forestgreen}\vec{y}})\wedge(x_2{\color{WildStrawberry}\vec{x}}+y_2{\color{forestgreen}\vec{y}})\\
&=x_1x_2{\color{WildStrawberry}\vec{x}}\wedge{\color{WildStrawberry}\vec{x}}+x_1y_2{\color{WildStrawberry}\vec{x}}\wedge{\color{forestgreen}\vec{y}}+y_1x_2{\color{forestgreen}\vec{y}}\wedge{\color{WildStrawberry}\vec{x}}+y_1y_2{\color{forestgreen}\vec{y}}\wedge{\color{forestgreen}\vec{y}}\\
&=x_1y_2{\color{WildStrawberry}\vec{x}}\wedge{\color{forestgreen}\vec{y}}+y_1x_2{\color{forestgreen}\vec{y}}\wedge{\color{WildStrawberry}\vec{x}}\\
&=x_1y_2{\color{WildStrawberry}\vec{x}}\wedge{\color{forestgreen}\vec{y}}-y_1x_2{\color{WildStrawberry}\vec{x}}\wedge{\color{forestgreen}\vec{y}}\\
&=(x_1y_2-y_1x_2){\color{WildStrawberry}\vec{x}}\wedge{\color{forestgreen}\vec{y}}
\end{align}$$
same output, but with [[Bivector]] unit ${\color{WildStrawberry}\vec{x}}\wedge{\color{forestgreen}\vec{y}}$
### Formula $\vec{a}\wedge\vec{b}=\vec{A}$
- $\vec{A}$ [[Bivector]] 
![[Wedge Product.webp]]
### [[Bivector]] To Vector $\vec{B}\wedge\vec{a}=T$
- $T$ Trivector
### Properties
- Anticommutative $\vec{a}\wedge\vec{b}=-\vec{b}\wedge\vec{a}$
##### $|a\wedge b|^2=|a|^2|b|^2-|a\cdot b|^2$ `geometric identity`
- $ab=a\cdot b+a\wedge b$
- $ba=a\cdot b-a\wedge b$
- $abba=(a\cdot b+a\wedge b)(a\cdot b-a\wedge b)=(a\cdot b)^2-(a\wedge b)^2$ `difference of squares`
- $abba=a(|b|^2)a=|a|^2|b|^2$
- $|a|^2|b|^2=(a\cdot b)^2-(a\wedge b)^2$
- $|a\wedge b|^2=|a\cdot b|^2-|a|^2|b|^2$
##### Resource youtu.be/htYh-Tq7ZBI
