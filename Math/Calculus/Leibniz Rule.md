### $G(x)=\int_a^{h(x)}f(t)dt\implies G'(x)=f(h(x))\cdot h'(x)-f(a(x))\cdot a'(x)$
> [!example] for $F(x)=\int_0^{\cos^x}(e^t+3\tan(t))dt$ find $\frac{d}{dx}F(x)$
> - $a=0$ `constant`
> - $h(x)=(\cos x)^x=e^{x\ln(\cos x)}$
> - $h'(x)=e^{x\ln(\cos x)}\cdot\frac{d}{dx}[x\ln(\cos x)]$
>   - $\frac{d}{dx}[x\ln(\cos x)]=\ln(\cos x)+x\cdot\frac{d}{dx}[\ln(\cos x)]$
>     - $\frac{d}{dx}[\ln(\cos x)]=\frac{1}{\cos x}(-\sin(x))=-\frac{\sin(x)}{\cos x}=-\tan x$
>   - $\frac{d}{dx}[x\ln(\cos x)]=\ln(\cos x)-x\tan x$ 
> - $h'(x)=e^{x\ln(\cos x)}(\ln(\cos x)-x\tan x)$ 
### Intuition
imagine $\large\int_0^\infty f(t)dt$ as $\large\int_a^{h(x)}f(t)dt$ where $h(x)=x$ and $a=0$
derivative of that would be $G'(x)=f(h(x))\cdot h'(x)=f(x)x'=f(x)$

works similar to [[Chain Rule]] $f(g(x))=f'(g(x))g'(x)$ and `u-substitution`
$F(x)=\int_a^{g(x)}f'(t)dt\implies F'(x)=f'(g(x))\cdot g'(x)$