### Formula $H=\sum_i\dot{q_i}p_i-L$
- $\sum_i$ sum over all dimensions
- $\dot{q_i}=\dot{x}$ `position`
- $p_i=m\dot{x}$ `momentum`
- $L$ [[Lagrangian]]
- $\dot{q_i}={\huge\frac{\delta H}{\delta p_i}}$
- $\dot{p_i}=-{\huge\frac{\delta H}{\delta q_i}}$

> [!example] [[Spring]] $m\ddot{x}=-kx$, finding using hamiltonian
> $\dot{q_i}=\dot{x}$
> $\dot{p_i}=m\dot{x}$
> $L={\huge\frac{m\dot{x}^2}{2}}-{\huge\frac{kx^2}{2}}$
> $H=\sum_i\dot{q_i}p_i-L=\sum_i\dot{x}m\dot{x}-{\huge\frac{m\dot{x}^2}{2}}+{\huge\frac{kx^2}{2}}={\huge\frac{2m\dot{x}^2-m\dot{x}^2+kx^2}{2}}={\huge\frac{m\dot{x}^2}{2}}+{\huge\frac{kx^2}{2}}$
> $\dot{x}=\huge\frac{p_i}{m}$
> $H={\huge\frac{p_i^2}{2m}+\frac{kx^2}{2}}$
> $\dot{q_i}={\huge\frac{\delta H}{\delta p_i}}={\huge\frac{p_i}{m}}=\dot{x}$
> $\dot{p_i}=-{\huge\frac{\delta H}{\delta q_i}}=-kx$
> $m\ddot{x}=-kx$
> > [!note] 
> > [[Lagrangian]] gave one 2nd order differential equation
> > Hamiltonian gave two 1st order differential equations ($\dot{q_i},\dot{p_i}$)

> [!note] Hamiltonian is often total energy $H=T+V$
> - $T$ [[Kinetic Energy]]
> - $V$ [[Potential Energy]]
