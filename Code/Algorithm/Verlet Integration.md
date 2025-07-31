### Deriving
- Start with semi-implicit euler integration 
  `explicit euler with swapped velocity updating`
  $\large v_{n+1}=v_n+a\Delta t$
  $\large x_{n+1}=x_n+v_{n+1}\Delta t$
  $\large x_{n+1}=x_n+(v_n+a\Delta t)\Delta t=x_n+v_n\Delta t+a\Delta t^2$
- Verlet integration is just semi-implicit euler integration with $n=n-1$
  $\large x_n=x_{n-1}+v_n\Delta t$
  $\large v_n=\huge\frac{x_n-x_{n-1}}{\Delta t}$ `above reordered`
- Replace $\large v_n$ in euler formula
  $x_{n+1}=x_n+{\huge\frac{x_n-x_{n-1}}{\Delta t}}\Delta t+a\Delta t^2$
  $x_{n+1}=x_n+x_n-x_{n-1}+a\Delta t^2=2x_n-x_{n-1}+a\Delta t^2$
  
