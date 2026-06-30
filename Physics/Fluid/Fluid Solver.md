### [[Navier Stokes]]
1. initialize state
    - velocity $\mathbf{u}$
    - density $\rho$
    - add external forces to velocity `gravity`
2. advect velocity `move velocities based on current velocity`
3. diffuse/decay velocity `(optional) blur velocities`
4. compute [[divergence]] of the [[Vector Field|velocity field]] $\nabla\cdot\mathbf{u}$
5. solve pressure $\nabla^2\Phi=\nabla\cdot\mathbf{u}$ (derived from [[Helmholtz Decomposition]])
    - use jacobi iteration $\Phi(x,y)=\dfrac{\Phi(x-1,y)+\Phi(x+1,y)+\Phi(x,y-1)+\Phi(x,y+1)-h^2(\nabla\cdot\mathbf{u})}{4}$ 
         `averages pressure, corrected by divergence`
    - derived from $\nabla^2\Phi=\nabla\cdot\mathbf{u}\implies\dfrac{\Phi(x-1,y)+\Phi(x+1,y)+\Phi(x,y-1)+\Phi(x,y+1)-4\Phi(x,y)}{h^2}=\nabla\cdot\mathbf{u}$
    - rearrange to solve for $\Phi(x,y)=\dfrac{\Phi(x-1,y)+\Phi(x+1,y)+\Phi(x,y-1)+\Phi(x,y+1)-h^2(\nabla\cdot\mathbf{u})}{4}$
6. remove [[divergence]] from velocity $\mathbf{u}'=0$ by subtracting pressure gradient $\mathbf{u}'=\mathbf{u}-\nabla\Phi$ 
7. advect density/color
8. render

###### Calculating Residual Error
- $\nabla^2\Phi=\nabla\cdot\mathbf{u}$ `trying to solve this ODE`
- $A\cdot p=b$ `discretized ODE` equivalently $b-A\cdot p=0$ 
    - $A$ is [[laplacian]] discretized as a [[matrix]]
    - $p$ discretized $\Phi$ `pressure`
    - $b$ discretized $\nabla\cdot\mathbf{u}$ `velocity divergence`
- $e=p^*-p$ `error` = `true pressure` - `current pressure solution`
- $r=b-A\cdot p$ residual error, since $b-A\cdot p$ must be $0$ for true solution
- $A\cdot e=A\cdot p^*-A\cdot p$
- $A\cdot e=b-A\cdot p$ substitute $A\cdot p^*=b$
- $A\cdot e=r$ `residual error`
