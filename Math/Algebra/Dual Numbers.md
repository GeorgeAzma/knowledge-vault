Useful for calculating [[Derivative]][[s]]
### $x+y\epsilon$ where $\epsilon^2=0$ and $\epsilon\neq0$
Dual parts cancel out when multiplied
- $\epsilon^{2,3\dots}=0$
- $d_1\pm d_2=x_1\pm y_1\epsilon\pm\epsilon(x_2\pm y_2\epsilon)$
- $d_1d_2=x_1x_2+(x_1y_2+x_2y_1)\epsilon$
- $d^n=x^n+nx^{n-1}y\epsilon$
- $\dfrac{d_1}{d_2}=\dfrac{x_1}{x_2}+\dfrac{x_2y_1-x_1y_2}{x_2^2}\epsilon$
- $d^{-1}=\dfrac{1}{x}-\dfrac{y}{x^2}\epsilon$
- $e^{d}=e^x+ye^x\epsilon$
- $\sin d=\sin x+y\cos x\epsilon$
- $\cos d=\cos x-y\sin x\epsilon$ `derived from trig identities, or from below`
- $f(x+y\epsilon)=f(x)+yf'(x)\epsilon$ `derived from` [[Taylor Series]] `for smooth functions`
- $f^{(n)}(x+y\epsilon_n)$  where $\epsilon_n^n=0$
- **Comparison** unordered, but practically ignore dual part and compare, proof $0<\epsilon\implies0<\epsilon^2\implies0<0$
> [!tip] Think of $x+y\epsilon$ as 2D vector, where 1st dimension is real and 2nd is slope dimension
> slope can be any direction, you can move along it using $y$
> For [[Complex Number]][[s]] you think of them as a 2D circle
