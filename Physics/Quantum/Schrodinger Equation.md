### $i\hbar\dfrac{d}{dt}\ket{\psi}=\hat{H}\ket{\psi}$
- [[Quantum|Bra-Ket Notation]]
- $\hat{H}=-\dfrac{\hbar^2}{2m}\nabla^2+V(x)$ energy evolution operator (scalar if $\psi$ is a scalar, [[matrix]] if $\psi$ is a [[vector]])
    -  $-\dfrac{\hbar^2}{2m}\nabla^2$ [[kinetic energy]]
    - $V(x)$ [[potential energy]]
    - $i\hbar\dfrac{d}{dt}\ket{\psi}=-\dfrac{\hbar^2}{2m}\nabla^2\ket{\psi}+V(x)\ket{\psi}$ fully expanded form
    
        - $\dfrac{d}{dt}\ket{\psi}=-\dfrac{\hbar}{2im}\nabla^2\ket{\psi}+V(x)\ket{\psi}$ simplified expanded form
    
### Simplified $\dfrac{\partial\psi(x,y,t)}{\partial t}=i\nabla^2\psi(x,y,t)$
- [[heat equation]] but with [[complex number]]
- $i$ makes wave spin, instead of decaying/spreading
##### Intuition
- $\dfrac{dx}{dt}=i\alpha\cdot x\implies x(t)=e^{i\alpha t}x(0)$
    - any time rate of change depends on itself, exponential is involved
- usually exponential causes exponential growth or decay over time
- but in this case growth factor $\alpha$ is multiplied by [[complex number]] $i$
- which causes $e^{i\alpha t}$, this is rotation formula in complex plane
- so instead of decaying/growing based on $\alpha=\nabla^2\psi$ the wave rotates
- when $a\leq0$, meaning $\psi(x)\geq\psi(x\pm h)$ then $\psi$ rotates clockwise over time $e^{iat}\psi(x,0)$
### Properties
- $\ket{\Psi(t)}=e^{-\hat{H}t/\hbar}\ket{\Psi(0)}$ analytic solution for constant $\hat{H}$