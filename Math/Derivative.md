> [!note] Notations $\large \frac{\delta f}{\delta x}=\frac{d}{dx} f(x)=f'(x)$ 
### Finite Difference Method $f(x+h)-f(x-h) \over 2h$ or $f((x+h)-f(h)) \over h$
[[Partial Derivative]]
### Simplifications
- $\frac{d}{dx}c=0$
- $\frac{d}{dx}(g(x)+h(x))=g'(x)+h'(x)$
- $\frac{d}{dx}(g(x)-h(x))=g'(x)-h'(x)$
- $\frac{d}{dx}(g(x)*h(x))=g(x)h'(x)+h(x)g'(x)$
- $\frac{d}{dx}(g(x)/h(x))=\large\frac{g'(x)h(x)-g(x)h'(x)}{h(x)^2}$
- $\frac{d}{dx}g(x)^{-1}=-\large\frac{g'(x)}{g(x)^2}$
- $\frac{d}{dx}(c*g(x))=c*g'(x)$
- $\frac{d}{dx}x^p=p*x^{p - 1}$
- $\frac{d}{dx}f(g(x))=f'(g(x)) * g'(x)$ [[Chain Rule]]
- $\frac{d}{dx}\sin(x)=\cos(x)$
- $\frac{d}{dx}\cos(x)=-\sin(x)$
- $\frac{d}{dx}\sqrt{x}=\large\frac{1}{2\sqrt{x}}$
- $\frac{d}{dx}\log_b{x}=\large\frac{1}{\ln(b)x}$
- $\frac{d}{dx}e^x=e^x$
- $\frac{d}{dx}\tan{x}=\sec^2(x)$
- $\frac{d}{dx}\arcsin(x)=\large\frac{1}{\sqrt{1-x^2}}$
- $\frac{d}{dx}\arccos(x)=-\large\frac{1}{\sqrt{1-x^2}}$
- $\frac{d}{dx}\arctan(x)=\large\frac{1}{1+x^2}$
- $\frac{d}{dx}\ln{x}=\large\frac{1}{x}$
- $\frac{d}{dx}\log_b{x}=\large\frac{1}{\ln(b)x}\normalsize=\large\frac{\log_b(e)}{x}$
- $\frac{d}{dx}\sinh{x}=\cosh x$
- $\frac{d}{dx}\cosh{x}=\sinh{x}$
### Computational Methods
- [[Numerical Integrator#Euler]]
- [[Numerical Integrator]]