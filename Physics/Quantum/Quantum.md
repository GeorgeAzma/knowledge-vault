youtu.be/p7bzE1E5PMY
### Bra-Ket Notation
- Vector's can be written as $\pmatrix{a_1\\ a_2}=a_1 \pmatrix{1\\0}+a_2\pmatrix{0\\1}$
- Quantum state is similar, but $a_1,a_2$ are [[Complex Number]][[s]]
- $\ket{\Psi}=\begin{pmatrix}a_1\\ a_2\end{pmatrix}=a_1 \pmatrix{1\\0}+a_2\pmatrix{0\\1}$ `column vector`
- $\bra{\Psi}=(\bar{a_1}\quad \bar{a_2})$ `row vector`
> [!note] To convert complex column vector to row vector you need to also take [[Complex Number|Complex Conjugate]] of the values
- This notation exists for convenience
> [!example] Coin Flip Quantum State $\frac{\sqrt2}{2}\ket0+\frac{\sqrt2}{2}\ket1$
> > [!note] $\frac{\sqrt2}{2}$ instead of $\frac{1}{2}$ because probabilities make a normalized vector
> - $\ket0,\ket1$ Heads, Tails
> > [!note] $\ket0$ is short for first state e.g. $(1,0)$  
> - $\frac{\sqrt2}{2}$ Probability of the quantum state to be measured
> - In classical notation you can write: $\large\frac{\sqrt2}{2}\small \pmatrix{0\\1}+\large\frac{\sqrt2}{2}\small\pmatrix{1\\0}$
> - But quantum states use [[Complex Number]][[s]]
>   - $(\frac{\sqrt2}{2}+0i)\ket{0}+(\frac{\sqrt2}{2}+0i)\ket{1}$
### Formulas
- $\ket{\Psi}=\pmatrix{a_1\\ a_2}=a_1\ket{X}+a_2\ket{Y}$ `says that state Psi is probability combination of other states`
- $\bra{\Psi}=(\bar{a_1}\quad \bar{a_2})=\pmatrix{a_1\\ a_2}=\bar{a_1}\ket{X}+\bar{a_2}\ket{Y}$
- $\braket{\Psi|\Psi}=a_1\bar{a_1}+a_2\bar{a_2}=1$ `total probability is always 100%`
- $a_1\bar{a_1}=|a_1|^2$ `probability of measuring first state`
> [!note] $\ket{X}$ is short for first state e.g. (1,0)
