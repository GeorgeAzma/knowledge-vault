---
aliases:
  - Bra-Ket Notation
---
youtu.be/p7bzE1E5PMY
### Bra-Ket Notation
- $\ket{\psi}=\int\psi(x)\ket{x}dx\iff\mathbf{v}=\sum_iv_ie_i$ `continuous vector`
    - $\psi(x)$ [[complex number]] describing complex amplitude of state $\ket{x}$
    - $|\psi(x)|^2$  probability density of finding particle at position $\ket{x}$
- $\bra{\psi}=\ket{\psi}^\dagger$ [[adjoint]] ([[Complex Number|complex]] [[conjugate]] [[transpose]])
- $\braket{\phi\mid\psi}\iff\mathbf{u}^\dagger\mathbf{v}=\sum_iu_i^*v_i$ `complex dot product`
- $\hat{H}\ket{\psi}\iff Hv$ operator acting on ket `complex matrix multiplication`
- $\bra{\psi}\hat{H}\ket{\psi}\iff v^\dagger Hv$ `complex quadratic form`
    - $=\mathbb{E}[H]$ average measured energy, [[expectation]] of energy
- $\ket{\psi}\bra{\phi}\iff\mathbf{v}\mathbf{u}^\dagger$ [[outer product]]
- $v_1=\braket{e_1\mid\psi},\quad v_2=\braket{e_2\mid\psi},\quad v_3=\braket{e_3\mid\psi}$
    - `vector = projections onto basis vectors`
    - $\psi(x)=\braket{x\mid\psi}$ same idea, but instead of $e_i$ you have continuous $x$
    - describes quantum state mixture at $x$, similar to how vector describes $e_x,e_y,e_z$ mixture
### Properties
- $\braket{\Psi|\Psi}=a_1\bar{a_1}+a_2\bar{a_2}=1$ `total probability is always 100%`
- $a_1\bar{a_1}=|a_1|^2$ `probability of measuring first state`
### [[Schrodinger Equation]]
> [!example] Coin Flip Quantum State $\frac{1}{\sqrt2}\ket0+\frac{1}{\sqrt2}\ket1$
> - $\frac{\sqrt2}{2}$ instead of $\frac{1}{2}$ because probabilities make a normalized vector
> - $\ket0$ short for first state $(1,0)$ which is heads
> - quantum states use [[complex number]][[s]]
>   - ${\color{gray}(\frac{\sqrt2}{2}+0i)}~\ket{0}+{\color{gray}(\frac{\sqrt2}{2}+0i)}~\ket{1}$