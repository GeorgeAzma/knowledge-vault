### Theorems
- $\lim_{x\to a}=L$ if $\lim_{x\to a-}=\lim_{x\to a+}=L$ ($+$ means $x>a$)
### [[Simplifications]]
- for $\lim_{\large x\to\pm\infty}$ highest growth rate terms dominate
  $1<\log n<\sqrt n<n<n\log n<n^2<\exp n<n!<n^n$
  $\lim_{x\to\infty}\large\frac{x^2+x^3}{2x^3}=\frac{1}{2}$
- If $\lim_{x\to a}f(x)\land\lim_{x\to a}g(x)$ exist then arithmetic operations applies as usual
    - $\lim_{x\to a}(f(x)\pm g(x))=\lim_{x\to a}f(x)\pm \lim_{x\to a}g(x)$
    - $\lim_{x\to a}(f(x)g(x))=\lim_{x\to a}f(x)\lim_{x\to a}g(x)$
    - $\lim_{x\to a}\frac{f(x)}{g(x)}=\frac{\lim_{x\to a}f(x)}{\lim_{x\to a}g(x)}$ where $\lim_{x\to a}g(x)\neq0$
    - $\lim_{x\to a}[f(x)]^n=[\lim_{x\to a}f(x)]^n$ `n is real`
    - $\lim_{x\to a}(cf(x))=c\lim_{x\to a}f(x)$
    - $\lim_{x\to a}c=c$
    - $\lim_{x\to a}x^n=a^n$
- $f$ is continuous at $a$ if $\lim_{x\to a}f(x)=f(a)$
### $\epsilon$-$\delta$ Definition
$\lim_{x\to a}f(x)=L\iff \forall\epsilon>0\ \exists\delta>0:0<|x-a|<\delta\implies|f(x)-L|<\epsilon$
### L'Hospital's Rule
If $\lim_{x\to c}f(x)=\lim_{x\to c}g(x)=0\mid\infty$ and $\exists f'(x),g'(x)\neq0$ near $c$ 
then $\lim_{x\to c}\frac{f(x)}{g(x)}=\lim_{x\to c}\frac{f'(x)}{g'(x)}$
useful for evaluating $\frac{0}{0},\frac{\infty}{\infty}$