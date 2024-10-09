For solving [[Derivative|Ordinary Differential Equations (ODE)]]
> [!note] 
> higher order ODEs need to be converted to 
> 1st order ODEs and solved separately

> [!example] Solving for harmonic oscillator $\large\frac{d^2x}{dt^2}+\omega^2x=0$
> convert to 1st order ODEs
> - $\large\frac{dx}{dt}=v$
> - $\large\frac{dv}{dt}=-\omega^2x$
> all methods below include this example
``` rust
// exact solution
let a = INIT_POS;
let b = INIT_VEL / w;
x = a * (w * time).cos() + b * (w * time).sin();
```
### Euler
- find slope
- add slope `pos += vel`
``` rust
let a = -w * w * self.ex;
let dv = a * dt;
let dx = self.ev * dt;
self.ev += dv;
self.ex += dx;
```
### Runge-Kutta 4
- follow slope `k1` for half step `dt`
- get new slope `k2` at that position
- go back to start
- follow new slope for half step
- find final slope `k3` there
- follow final slope to get updated variable
``` rust
// K1
let a1 = -w * w * x; // acceleration based on current position
let dxk1 = v * dt;
let dvk1 = a1 * dt;

// K2
let a2 = -w * w * (x + dxk1 * 0.5);
let dxk2 = (v + dvk1 * 0.5) * dt;
let dvk2 = a2 * dt;

// K3
let a3 = -w * w * (x + dxk2 * 0.5);
let dxk3 = (v + dvk2 * 0.5) * dt;
let dvk3 = a3 * dt;

// K4
let a4 = -w * w * (x + dxk3);
let dxk4 = (v + dvk3) * dt;
let dvk4 = a4 * dt;

x += (dxk1 + 2.0 * dxk2 + 2.0 * dxk3 + dxk4) / 6.0;
v += (dvk1 + 2.0 * dvk2 + 2.0 * dvk3 + dvk4) / 6.0;
```
