root finding algorithm $f(x)=0$
like how [[Quadratic Equation|Discriminant]] is used for finding roots of $ax^2+bx+c$
newton's method is used for finding root of any differentiable function
### Formula $x_{n+1}=x_n-\dfrac{f(x_n)}{f'(x_n)}$
![[Newton's Method.webp|500]]
### Derivation $y\approx f(x_n)+f'(x_n)(x-x_n)$
related to [[Taylor Series]] definition of a function
- we want root $y=0\approx f(x_n)+f'(x_n)(x-x_n)$
- rearrange to find next approximate $x_{n+1}$
    - $0\approx \dfrac{f(x_n)+f'(x_n)(x-x_n)}{f'(x_n)}$
    - $0\approx \dfrac{f(x_n)}{f'(x_n)}+(x-x_n)$
    - $-x\approx \dfrac{f(x_n)}{f'(x_n)}-x_n$
    - $x\approx x_n-\dfrac{f(x_n)}{f'(x_n)}$
### Not Guaranteed To Converge If
- $f(x)$ has multiple roots `cyclic functions`
- $f(x)$ is non-differentiable
- $f(x)$ discontinuous near root
- $x_0$ is a terrible initial guess
