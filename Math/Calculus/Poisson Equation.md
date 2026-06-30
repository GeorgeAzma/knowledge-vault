### $\nabla^2u=f$
- $\nabla^2$ [[Laplacian]]
- $u$ scalar function
- $f$ known function representing source/influence, laplacian tries to diffuse scalar field like temperature to this value
     $f$ can be a single hot pixel and zero elsewhere `dirac delta function`, so simulation would average all pixels out 
### Discrete Solve $\nabla^2u=f\implies A\mathbf{x}=\mathbf{b}$
- $A$ discrete [[laplacian]] [[matrix]]
- $\mathbf{x}$ unknown scalars from scalar function
- $\mathbf{b}$ source, diffuse target
for `512x512` grid this is `262,144` unkowns, matrix inversion is impossible, so we use simplified iterative methods
##### Jacobi Iteration
- calculate [[laplacian]] for each pixel using [[finite difference]] 
     $\nabla^2u\approx\dfrac{u(x-h_x,y,z)-2u(x,y,z)+u(x+h_x,y,z)}{h_x^2}+\dfrac{u(x,y-h_y,z)-2u(x,y,z)+u(x,y+h_y,z)}{h_y^2}=f$
    - lets assume $h_x=h_y$ for simplicity $\nabla^2u\approx\dfrac{u(x-h,y,z)+u(x+h,y,z)+u(x,y-h,z)+u(x,y+h,z)-4u(x,y,z)}{h^2}=f$
- rearrange for center pixel $u(x,y,z)=\dfrac{u(x-h,y,z)+u(x+h,y,z)+u(x,y-h,z)+u(x,y+h,z)-fh^2}{4}$
    - `pressure becomes average of neighbors, corrected by divergence`
