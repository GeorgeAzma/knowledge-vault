### Terms
- $\int$ indefinite integral `no-limits, computes antiderivative`
- $\int_a^\infty$ improper integral, also $\int_{-\infty}^b$, $\int_0^1\frac{1}{x}$ `blows up`
- $\int_a^b$ definite integral
### Simplifications
##### Simple
- $\int_a^b f'(x)= f(b)-f(a)$    `fundamental theorem of calculus`
    - $[f(x)]_a^b=f(b)-f(a)$ `definite integral shorthand`
- $\int c=cx+C$
- $\int kf(x)=k\int f(x)$    `constant multiplies`
- $\int(f(x)\pm g(x))=\int f(x)\pm\int g(x)$    `sums and differences`
##### Common
- $\int x^{n}={\large\frac{x^{n+1}}{n+1}}+C$    `power rule`
- $\int{\large\frac1{x}}=\ln|x|+C$    `power rule`
- $\int e^x=e^x+C$    `exponential`
- $\int a^x={\large\frac{a^x}{\ln a}}+C$    `exponential`
- $\int|x|={\large\frac{x|x|}{2}}+C$    `absolute value`
- $\int f(g(x))\cdot g'(x)dx$ substitute $u=g(x)\implies du=g'(x)dx$ so $\int f(u)du$ `u-substitution`
##### Trig
- $\int\sin=-\cos+C$
- $\int\cos=\sin+C$
- $\int\tan=-\ln|\cos x|+C$
- $\int\cot=\ln|\sin x|+C$
- $\int{\large\frac{1}{x^2+1}}=\arctan(x)+C$
- [[Trigonometric Substitution]]
##### Other
- $\int{\large\frac{f'(x)}{f(x)}}=\ln|f(x)|+C$ `substitution`
- $\int_{-\infty}^\infty e^{-x}=\sqrt{\pi}$
### Examples
- **Improper Integral** evaluation using [[Limit]][[s]] $\large\int_1^\infty\frac{1}{x^2}dx$
    - compute definite antiderivative $-\large\frac{1}{x}$
    - apply limits $\lim_{b\to\infty}\large\int_1^b \frac{1}{x^2}dx=[-\frac{1}{x}]^b_1=\lim_{b\to\infty}(-\frac{1}{b}+\frac{1}{1})=0+1=1$
    - result $\large\int_1^\infty\frac{1}{x^2}dx=1$