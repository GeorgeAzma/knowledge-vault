youtu.be/Q78wvrQ9xsU
### Formulas
1. $\huge\frac{\delta u}{\delta t}+(u\cdot\nabla)u=v\nabla^2u-\frac{1}{\rho}\nabla p+f_e$
2. $\large\nabla\cdot u=0$ `no divergence, constant density`
    - `a.k.a` $\huge\frac{\delta u_x}{\delta x}+\frac{\delta u_y}{\delta y}+\frac{\delta u_z}{\delta z}=0$
3. $\large u(\mathbf{x},t_0)=u_0$ `initial condition, x = any position`
- $u$ velocity
- $\rho$ density
- $p$ pressure
- $f$ external force `gravity`
- $v$ viscosity `like friction between fluid particles` 
    - `assuming v is constant, so fluid is newtonian`
    - `non-newtonian fluid would be ooblek`
### Simpler Formula $a=\dfrac{-\nabla p}{\rho}+v\nabla^2u,\ \nabla\cdot u=0$
`optionally` $+\dfrac{F_{external}}{\rho}$
- follow negative pressure gradient
- denser fluids are harder to accelerate
- how much velocity differs from average velocity around it ([[Laplacian]])
    - try to reduce velocity difference based on viscosity `+viscosity = -vel difference`