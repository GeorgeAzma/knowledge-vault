### Finite Difference Method $\lim_{h\to0}\dfrac{f(x+h)-f(h)}{h}$
Tho $\frac{f(x+h)-f(x-h)}{2h}$ is more accurate
[[Partial Derivative]]
### Formulas
##### Simple
- $\large c=0$
- $\large a+b=a'+b'$
- $\large ab=ab'+ba'$
##### Common
- $\dfrac{a}{b}=\dfrac{a'b-ab'}{b^2}$
- $\dfrac{1}{a}=-\dfrac{a'}{a^2}$
- $c\cdot a=c\cdot a'$
- $f(g(x))=f'(g(x))\cdot g'(x)$ [[Chain Rule]]
- $\dfrac{f(x)}{g(x)}=\dfrac{f'(x)g(x)-f(x)g'(x)}{g^2(x)}$
##### power
- $x^n=n\cdot x^{n-1}$
- $y^x=\ln{y}\cdot e^{x\ln{y}}$
- $a^u=a^u\ln a \dfrac{du}{dx}$
- $\sqrt x=\dfrac{1}{2\sqrt{x}}$
##### $\log$ & $\exp$
- $\log_b{x}=\dfrac{1}{\ln(b)x}$
- $e^x=e^x$
- $\ln{x}=\dfrac{1}{x}$
- $\log_b{x}=\dfrac{1}{\ln(b)x}=\dfrac{\log_b(e)}{x}$
##### [[Trigonometry]]
- $\sin(x)=\cos(x)$
- $\cos(x)=-\sin(x)$
- $\tan{x}=\sec^2(x)$
- $\arcsin(x)=\dfrac{1}{\sqrt{1-x^2}}$
- $\arccos(x)=-\dfrac{1}{\sqrt{1-x^2}}$
- $\arctan(x)=\dfrac{1}{1+x^2}$
- $\arctan_2(y,x)=\dfrac{x-y}{x^2+y^2}\implies\dfrac{d}{dx}=\dfrac{x}{x^2+y^2},\quad\dfrac{d}{dy}=-\dfrac{x}{x^2+y^2}$
- $\sinh{x}=\cosh x$
- $\cosh{x}=\sinh{x}$
##### Conditional
- $x<y\dots$ ignore derivatives when `false`
- $\max(x,y)=\{x>y:1,0\}$ assuming $\dfrac{d}{dx}$
- $x~\%~y=1$ except at $x=y$ where it's undefined, assuming $y$ is independent from $x$
### Notations
- $\dfrac{d}{dx}$ **Total Derivative** change with respect to $x$ `variable`
- $\dfrac{\partial f}{\partial x}=\dfrac{f(x+h)-f(h)}{h}$ **Partial Derivative** `of f(x) w.r.t. x`
- $\delta S$ change of an entire function
> [!example] $x^2+y^2=1$
> - $\dfrac{d}{dx}(x^2+y^2)=\dfrac{d}{dx}(1)$
> - $2x+2y\dfrac{dy}{dx}=0$
