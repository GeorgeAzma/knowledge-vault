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
- [[Symmetric Matrix|Symmetric]]
### Positive Semi-Definite Matrix Properties
- $v^TAv\geq0$ `any vector v`
- All [[Eigenvalue]][[s]] $\lambda_i\geq0$
### Uses
- [[Convex Optimization]] $f(v)=v^TAv$ is convex function
  [[Hessian Matrix]] must be [[Positive Definite Matrix|Positive Semi-Definite]] `ensuring f curves upwards`
  `Semi-Definite Programming deals with PSD`
- **System of Linear Equations** positive definite [[Matrix]] gaurantees unique solution
  
