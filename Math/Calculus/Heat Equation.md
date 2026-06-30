### $\dfrac{\partial T}{\partial t}=\alpha\nabla^2T$
- $\nabla^2$ [[Laplacian]]
##### Intuition
- $\alpha=\nabla^2 T(x)$ where discrete $\nabla^2=T(x-h)+T(x+h)-2T(x)$ `neighbors - center`
    - $\alpha>0$ means $T(x)$ curves up, so neighbors $x\pm h$ are higher `on average`
    - $\alpha<0$ means $T(x)$ curves down, so neighbors $x\pm h$ are lower `on average`
- $\dfrac{\partial}{\partial t}T(x,t)=\alpha T(x,t)\implies T(x,t)=e^{\alpha t}T(x,0)$
    - any time rate of change depends on itself, exponential is involved
    - $\alpha>0$ exponential growth
    - $\alpha<0$ exponential decay
    - so when neighbors are lower $\alpha<0$ for example when $\alpha=-0.3$, 
         current temperature also gets lower $T(x,t)=e^{-0.3 t}T(x,0)$
