$m\geq1$, higher the multiplicity, slower the [[Newton's Method|root finding]] algorithms get near root
- measures how flat function is near root
### Definition
$r\in\mathbb{R}\text{ or }\mathbb{C}$ is a root of multiplicity $m\geq1$ of $f(x)$ **if**
1. $f(r)=0$
2. $f'(r)=0,f''(r)=0,\dots,f^{(m-1)}(r)=0$
3. $f^{(m)}(r)\neq0$
### Calculate
- differentiate until you get non-zero derivative $f^{(m)}(r)\neq0$
``` python
m = 0
f = ...
while True:
    val = f`m(r)
    if val != 0: break
    m += 1
```

##### $f(x)=(x-r)^mg(x),\quad g(r)\neq0$
- $g(x)$ what is left after removing root factor
- must be non-zero at the root
- compute at or near zero $g(0)=\lim_{x\to0}\dots$ 
> [!example] $f(x)=\sin^2(x)$, find root $r=0$
> $\sin x\approx x$ according to [[Taylor Series]] expansion
> $f(x)=(x-0)^2g(x)$ with $g(x)=\dfrac{\sin^2 x}{x^2}=\left(\dfrac{\sin x}{x}\right)^2$
> $g(0)=\dfrac{\sin^2(0)}{0^2}=\text{undefined}$ so $g(0)=\lim_{x\to0}\left(\dfrac{\sin(x)}{x}\right)^2=1$
> $m=2$
### [[Newton's Method]]
converges quadratically when $m=1$ otherwise converges linearly
unless the root finding function is modified to $x_{n+1}=x_n-m\frac{f(x_n)}{f'(x_n)}$
- $|x_{n+1}-r|\approx\dfrac{m-1}{m}|x_n-r|$ so if $m=4$ then $x_{n+1}=\dfrac{3}{4}x_n$ 
     so only $\dfrac{1}{4}$ of $x_{n+1}$ is new and going towards root