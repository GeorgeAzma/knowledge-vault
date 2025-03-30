### Formula $\vec{a}\vec{b}=\vec{a}\cdot\vec{b}+\vec{a}\wedge\vec{b}$
- $\cdot$ [[Dot Product]]
- $\wedge$ [[Wedge Product]]
### Properties
- $\vec{a}^2=|a|^2$
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
\vec{u}\vec{v}=(a_1\hat{x}+b_1\hat{y}+c_1\hat{z})(a_2\hat{x}+b_2\hat{y}+c_2\hat{z})=\\\\
a_1\hat{x}(a_2\hat{x}+b_2\hat{y}+c_2\hat{z})+\\
b_1\hat{y}(a_2\hat{x}+b_2\hat{y}+c_2\hat{z})+\\
c_1\hat{z}(a_2\hat{x}+b_2\hat{y}+c_2\hat{z})=\\
\\
a_1a_2\hat{x}^2+a_1b_2\hat{x}\hat{y}+a_1c_2\hat{x}\hat{z}+\\
b_1a_2\hat{y}\hat{x}+b_1b_2\hat{y}^2+b_1c_2\hat{y}\hat{z}+\\
c_1a_2\hat{z}\hat{x}+c_1b_2\hat{z}\hat{y}+c_1c_2\hat{z}^2=\\
\\
a_1a_2+a_1b_2\hat{x}\hat{y}-a_1c_2\hat{z}\hat{x}-\\
b_1a_2\hat{x}\hat{y}+b_1b_2+b_1c_2\hat{y}\hat{z}+\\
c_1a_2\hat{z}\hat{x}-c_1b_2\hat{y}\hat{z}+c_1c_2=\\
\\
a_1a_2+b_1b_2+c_1c_2+\\
(a_1b_2-b_1a_2)\hat{x}\hat{y}+\\
(b_1c_2-c_1b_2)\hat{y}\hat{z}+\\
(c_1a_2-a_1c_2)\hat{z}\hat{x}=\\
\\
\vec{u}\cdot\vec{v}+\vec{u}\wedge\vec{v}
\end{array}
$$
