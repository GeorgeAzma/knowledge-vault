---
aliases:
  - Positive Semi-Definite Matrix
---
just like $x^2\geq0$ for multiple dimensions $v^TAv\geq0$ where $v\neq0$
- positive definite matrices stretch vectors without flipping them
- just as $v\cdot v=||v||$ is always positive $v^TAv=v\cdot(Av)$ will always be positive, 
  assuming $A$ does not flip any signs in $v$ which means $A$ is positive definite matrix
### Properties
- All [[Eigenvalue]][[s]] $\lambda_i>0$
- [[Symmetric Matrix|Symmetric]] `usually, but not strictly`
### Positive Semi-Definite Matrix Properties
- $v^TAv\geq0$ `any vector v`
- All [[Eigenvalue]][[s]] $\lambda_i\geq0$
### Uses
- [[Convex Optimization]] $f(v)=v^TAv$ is convex function
  [[Hessian Matrix]] must be [[Positive Definite Matrix|Positive Semi-Definite]] `ensuring f curves upwards`
  `Semi-Definite Programming deals with PSD`
- **System of Linear Equations** positive definite [[Matrix]] gaurantees unique solution
### Intuition $x^T Ax$
- $Ax$ transformed $x$ using $A$
- $x^T (Ax)$ dot product of original $x$ and transformed $x$, so it tells how well new transformed $x$ aligns with original $x$
- $A$ being positive semi-definite means $x^TAx\geq0$ so transformed $x$ is pointing in the same direction as original $x$
- $x^T Ax$ always returns a scalar
- $x^T Ax=\sum_{i,j}x_iA_{ij}x_j$ interaction between $x$ components are weighted by $A$ matrix
- $x^Tx=||x||^2$ meaning $x^TAx$ is just deformed $||x||^2$ in warped space using $A$ matrix
- if $x$ is [[Eigenvector]] of $A$ then $Ax=\lambda x\implies x^TAx=\lambda x^Tx=\lambda||x||^2$