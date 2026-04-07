### $\dfrac{dy}{dt}=\lim_{\Delta t\to0}\dfrac{y(t+\Delta t)-y(t)}{\Delta t}$
- so it's basically a ratio, meaning we can do regular ratio simplifications
- `note: with dy/dt we are assuming y is a function of time y(t)` 
### Examples
##### $\dfrac{dy}{dt}=3y$ solve for $y(t)$ when $y(0)=2$
- $\dfrac{1}{y}dy=3dt$
- $\int \dfrac{1}{y}dy=\int3 dt$
- $\ln |y|=3t+C$ `abs, because y can be negative`
- $|y|=e^{3t+C}=e^{3t}e^C$
- $y(t)=Ce^{3t}$ where $C=\pm e^C$
- $y(0)=Ce^{0}=2\implies C=2$
- $y(t)=2e^{3t}$