---
aliases:
  - Positive Semi-Definite Matrix
---
just like $x^2\geq0$ for multiple dimensions $v^TAv\geq0$ where $x\in\mathbb{R}^n,\ x\neq0$
- kinda like generilized squared length along vector $v$
- PDs stretch vectors without flipping them
### Properties
- All [[Eigen Value]][[s]] $\lambda_i>0$
- [[Symmetric Matrix|Symmetric]]
### Positive Semi-Definite Matrix Properties
- $v^TAv\geq0$ `any vector v`
- All [[Eigen Value]][[s]] $\lambda_i\geq0$
### Uses
- [[Convex Optimization]] $f(v)=v^TAv$ is convex function
  [[Hessian Matrix]] must be [[Positive Definite Matrix|Positive Semi-Definite]] `ensuring f curves upwards`
  `Semi-Definite Programming deals with PSD`
- **System of Linear Equations** positive definite [[Matrix]] gaurantees unique solution
  
