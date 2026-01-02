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



