### Vector Field $\mathbf{F}\in(V,\mathbb{R}^n)$ where $V\subseteq\mathbb{R}^n$
vector field is function which maps domain $V$ to $\mathbb{R}^n$
- $\mathbf{F}(\mathbf{r})$ vector field vector value at vector location $\mathbf{r}\in V$ 
> [!note] Most vector fields need to be differentiable $\mathbf{F}\in C_1(V,\mathbb{R}^n)$ where $V\in\mathbb{R}^n$
>  $F(x,y,z)=(x^2,~\sin y,~xz)$ can exist but $F(x,y,z)=(x^2,~3,~xz)$ can't
> This allows gradient, divergence and curl operations to exist
> - $\Omega$ is often used instead of $V$ since it means a domain or a bounded region in space

#### [[Gradient]] $\nabla\mathbf{F}=\begin{pmatrix}\dfrac{\partial F_x}{\partial x}&\dfrac{\partial F_y}{\partial y}&\dfrac{\partial F_z}{\partial z}\end{pmatrix}$
#### [[Divergence]] $\nabla\cdot\mathbf{F}=\dfrac{\partial F_x}{\partial x}+\dfrac{\partial F_y}{\partial y}+\dfrac{\partial F_z}{\partial z}$

#### [[Curl]] $\nabla\times\mathbf{F}=\begin{vmatrix}\mathbf{i}&\mathbf{j}&\mathbf{k}\\\frac{\partial}{\partial x}&\frac{\partial}{\partial y}&\frac{\partial}{\partial z}\\ F_x&F_y&F_z\end{vmatrix}$
#### [[Laplacian]] $\Delta f=\dfrac{\partial^2f}{\partial x^2}+\dfrac{\partial^2f}{\partial y^2}+\dots$
#### [[Helmholtz Decomposition]]