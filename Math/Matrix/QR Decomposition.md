### $A=QR$
- $A\in\mathbb{R}^{m\times n}$
- $Q\in\mathbb{R}^{m\times m}$ [[Orthogonal Matrix]]
- $R\in\mathbb{R}^{m\times n}$ [[Triangular Matrix#Upper Triangular $ begin{bmatrix}a_{11}&a_{12}&a_{13} 0&a_{22}&a_{23} 0&0&a_{33} end{bmatrix}$|Upper Triangular Matrix]]

### Methods
##### Gram-Schmidt Orthogonalization
construct orthogonal vectors $A=[\vec a_1, \vec a_2\dots\vec a_n]$
construct orthonormal basis $\vec q_i$
- $\vec u_1=\vec a_1,\quad \vec q_1=\large\frac{\vec u_1}{||\vec u_1||}$
- $\vec u_2=\vec a_2 -\text{proj}_{\vec q_1} \vec a_2,\quad q_2=\frac{\vec u_2}{||\vec u_2||}$ 
  proj is [[Dot Product]] multiplied by $\vec q_1$ `assuming q_1 is normalized`
$R_{ij}=\vec q_i^T\vec a_j,\quad Q=[\vec q_1,\vec q_2,\dots,\vec q_n]$
simple but numerically untable
##### Householder Reflections $H_k=I-2\large\frac{\vec v\vec v^T}{\vec v^T \vec v}$
$Q=H_1H_2\dots H_n,\quad R=Q^TA$