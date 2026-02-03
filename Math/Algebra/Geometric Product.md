### Formula $\vec{a}\vec{b}=\vec{a}\cdot\vec{b}+\vec{a}\wedge\vec{b}$
- $\cdot$ [[Dot Product]]
- $\wedge$ [[Wedge Product]]
### Properties
- $\vec{a}^2=|a|^2$
- $\vec{a}\wedge\vec{a}=0$
- $\vec{a}^{-1}=\huge\frac{\vec{a}}{|a|^2}$
- $\vec{b}\vec{a}=\vec{a}\cdot\vec{b}-\vec{a}\wedge\vec{b}$
- $\vec{a}\cdot\vec{b}=\huge\frac{\vec{a}\vec{b}+\vec{b}\vec{a}}{2}$
- $\vec{a}\wedge\vec{b}=\huge\frac{\vec{a}\vec{b}-\vec{b}\vec{a}}{2}$
##### For [[Standard Basis Vector]]
- $\hat{a}^2=1$
- $\hat{a}\hat{b}=-\hat{b}\hat{a}$
### Derivation
$\vec{u}=a_1\hat{x}+b_1\hat{y}+c_1\hat{z}$
$\vec{v}=a_2\hat{x}+b_2\hat{y}+c_2\hat{z}$
$(\hat{x},\hat{y},\hat{z})$ are [[Standard Basis Vector]][[s]]
$$
\begin{array}{}

\vec{u}\vec{v}=(
a_1{\color{WildStrawberry}{\hat{x}}}{\color{gray}+}
b_1{\color{forestgreen}{\hat{y}}}{\color{gray}+}
c_1{\color{cornflowerblue}{\hat{z}}})(
a_2{\color{WildStrawberry}{\hat{x}}}{\color{gray}+}
b_2{\color{forestgreen}{\hat{y}}}{\color{gray}+}
c_2{\color{cornflowerblue}{\hat{z}}})
=\\\\

a_1{\color{WildStrawberry}\hat{x}}(
a_2{\color{WildStrawberry}\hat{x}}{\color{gray}+}
b_2{\color{forestgreen}\hat{y}}{\color{gray}+}
c_2{\color{cornflowerblue}\hat{z}}){\color{gray}+}\\
b_1{\color{forestgreen}\hat{y}}(
a_2{\color{WildStrawberry}\hat{x}}{\color{gray}+}
b_2{\color{forestgreen}\hat{y}}{\color{gray}+}
c_2{\color{cornflowerblue}\hat{z}}){\color{gray}+}\\
c_1{\color{cornflowerblue}\hat{z}}(
a_2{\color{WildStrawberry}\hat{x}}{\color{gray}+}
b_2{\color{forestgreen}\hat{y}}{\color{gray}+}
c_2{\color{cornflowerblue}\hat{z}})=\\\\

a_1a_2{\color{WildStrawberry}\hat{x}}^2{\color{gray}+}
a_1b_2{\color{orange}\hat{x}\hat{y}}{\color{gray}+}
a_1c_2{\color{violet}\hat{x}\hat{z}}{\color{gray}+}\\
b_1a_2{\color{orange}\hat{y}\hat{x}}{\color{gray}+}
b_1b_2{\color{forestgreen}\hat{y}}^2{\color{gray}+}
b_1c_2{\color{teal}\hat{y}\hat{z}}{\color{gray}+}\\
c_1a_2{\color{violet}\hat{z}\hat{x}}{\color{gray}+}
c_1b_2{\color{teal}\hat{z}\hat{y}}{\color{gray}+}
c_1c_2{\color{cornflowerblue}\hat{z}}^2=\\\\

{\color{gray}\text{remove squares and swap axis}}\\
a_1a_2{\color{gray}+}
{\color{orange}a_1b_2\hat{x}\hat{y}}{\color{gray}-}
{\color{violet}a_1c_2\hat{z}\hat{x}}{\color{gray}-}\\
{\color{orange}b_1a_2\hat{x}\hat{y}}{\color{gray}+}
b_1b_2{\color{gray}+}
{\color{teal}b_1c_2\hat{y}\hat{z}}{\color{gray}+}\\
{\color{violet}c_1a_2\hat{z}\hat{x}}{\color{gray}-}
{\color{teal}c_1b_2\hat{y}\hat{z}}{\color{gray}+}
c_1c_2=\\\\

a_1a_2{\color{gray}+}b_1b_2{\color{gray}+}c_1c_2{\color{gray}+}
{\color{orange}(a_1b_2{\color{gray}-}b_1a_2)\hat{x}\hat{y}}{\color{gray}+}
{\color{teal}(b_1c_2{\color{gray}-}c_1b_2)\hat{y}\hat{z}}{\color{gray}+}
{\color{violet}(c_1a_2{\color{gray}-}a_1c_2)\hat{z}\hat{x}}
=\\\\

\vec{u}\cdot\vec{v}+\vec{u}\wedge\vec{v}

\end{array}
$$
### Simplification $a\wedge b$
- $a=\sum_ia_ie_i,\quad b=\sum_jb_je_j$
- $a\wedge b=\sum_{i,j}a_ib_j(e_i\wedge e_j)$
- $e_i\wedge e_i=0$ and $e_i\wedge e_j=-e_j\wedge e_i$
- so only lower triangle $e_{i<j}$ and upper triangle $e_{i>j}$ with same basis but flipped sign is left
- $a\wedge b=\sum_{i<j}(a_ib_j-a_jb_i)e_i\wedge e_j$ or $a\wedge b\implies ab^T-ba^T$
- $(a_x\quad a_y\quad a_z)\begin{bmatrix}x\wedge x & x\wedge y & x\wedge z \\ y\wedge x & y\wedge y & y\wedge z\\ z\wedge x & z\wedge y & z\wedge z\end{bmatrix}\begin{pmatrix}b_x\\ b_y\\ b_z\end{pmatrix}$
- $(a_x\quad a_y\quad a_z)\begin{bmatrix}0 & x\wedge y & x\wedge z \\ -x\wedge y & 0 & y\wedge z\\ -x\wedge z & -z\wedge y & 0\end{bmatrix}\begin{pmatrix}b_x\\ b_y\\ b_z\end{pmatrix}$
- $\begin{array}{l} a\wedge b&=&(a_xb_y-a_yb_x)&x\wedge y\\&+&(a_xb_z-a_zb_x)&x\wedge z\\&+&(a_yb_z-a_zb_y)&y\wedge z\end{array}$
- **Cross Product**
    - $a\times b=-I(a\wedge b)$ where $I=x\wedge y\wedge z$ `pseudo scalar`
    - $\begin{array}{l}-I(x\wedge y)=z\\ -I(x\wedge z)=-y\\ -I(y\wedge z)=x\end{array}$ `perpendicular vectors (right handed)`
    - $\begin{array}{l} a\times b&=&(a_xb_y-a_yb_x)&z\\&+&(a_zb_x-a_xb_z)&y\\&+&(a_yb_z-a_zb_y)&x\end{array}$
