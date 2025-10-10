[[Power Series]] with $a_n=\large\frac{f^{(n)}(a)}{n!}$
### Formula $f(x)=\sum_{n=0}^{\infty}{\frac{f^{(n)}(a)}{n!}(x-a)^n}$
- $f^{(n)}$ $n$th derivative of $f$ at $a$
- $a$ any real/complex number
- **Note** it gives better approximation close to `a`
> [!example] $\ln(x)$
> $\ln'(x)={\large\frac{1}{x}}=x^{-1}$
> $\ln''(x)=(x^{-1})'=-x^{-2}$
> $\ln^{(3)}(x)=2x^{-3}$
> $\ln(x)={\large\frac{\ln^{(1)}(a)}{1!}}(x-a)^1+{\large\frac{\ln^{(2)}(a)}{2!}}(x-a)^2+{\large\frac{\ln^{(3)}(a)}{3!}}(x-a)^3\dots$
> lets choose $a=1$ so
> $\ln(x)={\large\frac{\ln^{(1)}(1)}{1!}}(x-1)^1+{\large\frac{\ln^{(2)}(1)}{2!}}(x-1)^2+{\large\frac{\ln^{(3)}(1)}{3!}}(x-1)^3\dots$
> $\ln(x)={\large\frac{1^{-1}}{1!}}(x-1)^1-{\large\frac{1^{-2}}{2!}}(x-1)^2+{\large\frac{2\cdot1^{-3}}{3!}}(x-1)^3\dots$
> $\ln(x)={\large\frac{1}{1!}}(x-1)^1-{\large\frac{1}{2!}}(x-1)^2+{\large\frac{2}{3!}}(x-1)^3\dots$
> $\ln(x)=(x-1)-{\large\frac{1}{2}}(x-1)^2+{\large\frac{1}{3}}(x-1)^3\dots$
