https://youtu.be/Q78wvrQ9xsU `sebastian lague fluid solver`
### Formulas
##### 1. $\dfrac{\partial u}{\partial t}+(u\cdot\nabla)u=v\nabla^2u-\dfrac{1}{\rho}\nabla p+f$
- $u$ velocity
- $\rho$ density
- $p$ pressure
- $f$ external force `gravity`
- $v$ viscosity `like friction between fluid particles` 
    - `assuming v is constant, so fluid is newtonian`
    - `non-newtonian fluid would be ooblek`
##### 2. $\nabla\cdot u=0$ `no divergence, constant density`
- $\dfrac{\partial u_x}{\partial x}+\dfrac{\partial u_y}{\partial y}+\dfrac{\partial u_z}{\partial z}=0$
##### 3. $u(\mathbf{x},t_0)=u_0$ `initial condition, x = any position`
### Simpler Formula $a=\dfrac{-\nabla p}{\rho}+v\nabla^2u,\ \nabla\cdot u=0$
`optionally` $+\dfrac{F_{external}}{\rho}$
- follow negative pressure gradient
- denser fluids are harder to accelerate
- how much velocity differs from average velocity around it ([[Laplacian]])
    - try to reduce velocity difference based on viscosity `+viscosity = -vel difference`
https://youtu.be/3uBm8UB6oyw `simple blender fluid solver`
