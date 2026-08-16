### Theorems
- $\lim_\limits{x\to a}=L$ if $\lim_\limits{x\to a-}=\lim_\limits{x\to a+}=L$ ($+$ means $x>a$)
### [[Simplifications]]
- for $\lim_\limits{x\to\pm\infty}$ highest growth rate terms dominate
  $1<\log n<\sqrt n<n<n\log n<n^2<\exp n<n!<n^n$
  $\lim_\limits{x\to\infty}\dfrac{x^2+x^3}{2x^3}=\dfrac{1}{2}$
- If $\lim_\limits{x\to a}f(x)\land\lim_\limits{x\to a}g(x)$ exist then arithmetic operations applies as usual
    - $\lim_\limits{x\to a}(f(x)\pm g(x))=\lim_\limits{x\to a}f(x)\pm \lim_\limits{x\to a}g(x)$
    - $\lim_\limits{x\to a}(f(x)g(x))=\lim_\limits{x\to a}f(x)\lim_\limits{x\to a}g(x)$
    - $\lim_\limits{x\to a}\dfrac{f(x)}{g(x)}=\dfrac{\lim_\limits{x\to a}f(x)}{\lim_\limits{x\to a}g(x)}$ where $\lim_\limits{x\to a}g(x)\neq0$
    - $\lim_\limits{x\to a}[f(x)]^n=[\lim_\limits{x\to a}f(x)]^n$ `n is real`
    - $\lim_\limits{x\to a}(cf(x))=c\lim_\limits{x\to a}f(x)$
    - $\lim_\limits{x\to a}c=c$
    - $\lim_\limits{x\to a}x^n=a^n$
- $f$ is continuous at $a$ if $\lim_\limits{x\to a}f(x)=f(a)$
### $\epsilon$-$\delta$ Definition
$\lim_\limits{x\to a}f(x)=L\iff \forall\epsilon>0\ \exists\delta>0:0<|x-a|<\delta\implies|f(x)-L|<\epsilon$
### L'Hospital's Rule
If $\lim_\limits{x\to c}f(x)=\lim_\limits{x\to c}g(x)=0\mid\infty$ and $\exists f'(x),g'(x)\neq0$ near $c$ 
then $\lim_\limits{x\to c}\dfrac{f(x)}{g(x)}=\lim_\limits{x\to c}\dfrac{f'(x)}{g'(x)}$
useful for evaluating $\dfrac{0}{0},\dfrac{\infty}{\infty}$
