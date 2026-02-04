youtu.be/ttuKNuEuRwk?t=800
### Solves $\dfrac{dy}{dx}=f(x,y),\quad y(x_0)=y_0$
- $f(x,y)$ measures how $y$ changes with respect to $x$
**Example** $x$ = velocity, $y$ = position. how does position change with respect to velocity 
### RK4
- $h$ step size
- $k_1=f(x_n,y_n)$ `dy/dx slope at (x,y) at timestep n`
- $k_2=f(x_n+\dfrac{h}{2},~y_n+\dfrac{h}{2}k_1)$ `k2 = half-step using k1 and see dy/dx`
- $k_3=f(x_n+\dfrac{h}{2},~y_n+\dfrac{h}{2}k_2)$ `k3 = half-step using k2 and see dy/dx`
- $k_4=f(x_n+h,y_n+hk_3)$ `k4 = step using k3 and see dy/dx`
- $y_{n+1}=y_n+\dfrac{h}{6}(k_1+2k_2+2k_3+k_4)$  `half-steps are more valuable predictions`
![[RK4.webp|500]]
