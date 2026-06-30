For solving [[Derivative|Ordinary Differential Equations]]
> [!example] Solving for harmonic oscillator ([[spring]]) $\large\frac{d^2x}{dt^2}+\omega^2x=0$
> convert to 1st order ODEs
> - $\dfrac{dx}{dt}=v$
> - $\dfrac{dv}{dt}=-\omega^2x$
> all methods below include this example
``` rust
// exact solution
let a = INIT_POS;
let b = INIT_VEL / w;
x = a * (w * time).cos() + b * (w * time).sin();
```
### Euler
##### Explicit Euler `forward`
- $x_{n+1}=x_n+dt\cdot v_n$
- $v_{n+1}=v_n+dt\cdot a_n$
##### Semi-Implicit Euler `often more stable`
- $v_{n+1}=v_n+dt\cdot a_n$
- $x_{n+1}=x_n+dt\cdot v_{n+1}$
##### Implicit Euler `backward`
- $v_{n+1}=v_n+dt\cdot a_{n+1}$
- $x_{n+1}=x_n+dt\cdot v_{n+1}$
- 2 unkowns, requires solving, lets solve either $x_{n+1}$ or $v_{n+1}$ for spring ODE
    - $a_n=-\omega^2x_n$ [[spring]] acceleration
    - $v_{n+1}=v_n-dt\cdot \omega^2x_{n+1}$
    - $x_{n+1}=x_n+dt\cdot v_{n+1}$
    - $x_{n+1}=x_n+dt\cdot (v_n-dt\cdot \omega^2x_{n+1})$ `substitute v`
    - $x_{n+1}=x_n+dt\cdot v_n-dt^2\cdot \omega^2x_{n+1}$ `expand`
    - $x_{n+1}+dt^2\cdot\omega^2x_{n+1}=x_n+dt\cdot v_n$ `move unknowns to one side`
    - $(1+dt^2\cdot\omega^2)x_{n+1}=x_n+dt\cdot v_n$ `factor`
        - $x_{n+1}=\dfrac{x_n+dt\cdot v_n}{1+dt^2\cdot\omega^2}$ `solution`
##### Implicit Euler [[Spring]] [[Matrix]] $A\begin{bmatrix}x_{n+1}\\ v_{n+1}\end{bmatrix}=\begin{bmatrix}x_n\\ v_n\end{bmatrix}$ where $A=\begin{bmatrix}1&-dt\\\omega^2dt&1\end{bmatrix}$
- $\begin{bmatrix}x_{n+1}\\ v_{n+1}\end{bmatrix}=A^{-1}\begin{bmatrix}x_n\\ v_n\end{bmatrix}$
- $A^{-1}=A=\dfrac{1}{1+\omega^2dt^2}\begin{bmatrix}1&dt\\-\omega^2dt&1\end{bmatrix}$  [[Inverse]]
- $\begin{bmatrix}x_{n+1}\\ v_{n+1}\end{bmatrix}=A^{-1}\begin{bmatrix}x_n\\ v_n\end{bmatrix}=\begin{bmatrix}\dfrac{x_n+dt\cdot v_n}{1+\omega^2dt^2}\\ \dfrac{v_n-\omega^2dt\cdot x_n}{1+\omega^2dt^2}\end{bmatrix}$ solved both $x_{n+1}$ and $v_{n+1}$
##### Explicit Euler [[Spring]] [[Matrix]] $\begin{bmatrix}x_{n+1}\\ v_{n+1}\end{bmatrix}=A\begin{bmatrix}x_n\\ v_n\end{bmatrix}$ where $A=\begin{bmatrix}1&dt\\-\omega^2dt&1\end{bmatrix}$
##### Semi-Implicit Euler [[Spring]] [[Matrix]] $A=\begin{bmatrix}1-\omega^2dt^2&dt\\-\omega^2dt&1\end{bmatrix}$
- $|A|=1\cdot(1-\omega^2dt^2)+dt\cdot\omega^2dt=1$ meaning it does not gain or lose energy 
     and area in phase space $\begin{bmatrix}x\\ v\end{bmatrix}$ stays the same
### [[Runge-Kutta#RK4|RK4]]
- follow slope $k_1$ for half step $h/2$
- get new slope $k_2$ at that position
- go back to start
- follow new slope for half step
- find final slope $k_3$ there
- follow final slope to get updated variable
``` c
// derivative of state (position/velocity)
// RK4 can solve 1st order ODEs only
// so dv/dt instead of (dx/dt)^2  
vec4 f(vec4 s) {
    vec2 x = s.xy;
    vec2 v = s.zw;
    vec2 a = -k * x - d * v; // k = stiffness, d = damping
    return vec4(v, a); // dx/dt = v; dv/dt = a (for spring)
}

void rk4(inout vec4 s, float dt) {
    vec4 k1 = f(s);
    vec4 k2 = f(s + 0.5 * dt * k1);
    vec4 k3 = f(s + 0.5 * dt * k2);
    vec4 k4 = f(s + dt * k3);

    s += (k1 + 2.0 * k2 + 2.0 * k3 + k4) * (dt / 6.0);
}
```
### Leapfrog
``` c
x[n] = x[n-1] + 2 * dt * dx
```
