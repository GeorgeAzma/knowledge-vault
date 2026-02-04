root finding algorithm
- **cubic convergence** `faster than` [[Newton's Method]]
- **requires 2nd derivative**
### Formula $x_{n+1}=x_n-\dfrac{2f(x_n)f'(x_n)}{2(f'(x_n))^2-f(x_n)f''(x_n)}$
### Derivation $y\approx f(x_n)+f'(x_n)(x-x_n)+\dfrac{1}{2}f''(x_n)(x-x_n)^2$
same derivation as [[Newton's Method]] but includes 2nd derivative from [[Taylor Series]]
- we want root $y=0\approx f(x_n)+f'(x_n)(x-x_n)+\dfrac{1}{2}f''(x_n)(x-x_n)^2$
- rearrange $0\approx f(x_n)+(x-x_n)(f'(x_n)+\dfrac{1}{2}f''(x_n)(x-x_n))$
- rearrange to find next approximate $x_{n+1}$
    - $0\approx \dfrac{f(x_n)+(x-x_n)(f'(x_n)+\dfrac{1}{2}f''(x_n)(x-x_n))}{f'(x_n)+\dfrac{1}{2}f''(x_n)(x-x_n)}$
    - $0\approx \dfrac{f(x_n)}{f'(x_n)+\dfrac{1}{2}f''(x_n)(x-x_n)}+(x-x_n)$
    - $x\approx x_n-\dfrac{f(x_n)}{f'(x_n)+\dfrac{1}{2}f''(x_n)(x-x_n)}$
- apply [[Newton's Method]] $x_{n+1}-x_n=-\dfrac{f(x_n)}{f'(x_n)}$ to denominator 
    - $f'(x_n)+\dfrac{1}{2}f''(x_n)(x-x_n)$ becomes $f'(x_n)+\dfrac{1}{2}f''(x_n)(-\dfrac{f(x_n)}{f'(x_n)})$
    - $f'(x_n)-\dfrac{f(x_n)f''(x_n)}{2f'(x_n)}$ `simplify`
    - $\dfrac{2f'(x_n)^2-f(x_n)f''(x_n)}{2f'(x_n)}$ `multiply by denominator`
    - $x\approx x_n-\dfrac{f(x_n)}{\dfrac{2f'(x_n)^2-f(x_n)f''(x_n)}{2f'(x_n)}}$
    - $x\approx x_n-\dfrac{2f(x_n)f'(x_n)}{2f'(x_n)^2-f(x_n)f''(x_n)}$
    - 
