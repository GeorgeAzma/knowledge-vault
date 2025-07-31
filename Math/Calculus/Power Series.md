### $\sum_{n=0}^\infty a_n(x-c)^n$
- $c$ center
- only converges if $|x-c|<R$
- if $|x-c|=R$ convergence must manually be checked
### Examples
- [[Geometric Series]]
- $\large\sum_{n=0}^\infty(-1)^nx^n=\frac{1}{1+x}$
- $\large\sum_{n=0}^\infty(-1)^nnx^n=\frac{1}{(1+x)^2}$ `derived from above, by diff-ing both sides`
### Radius of Convergence $R$
which values of $x$ does power series converge
- **Ratio Test**  $L=\lim_{n\to\infty}\huge|\frac{a_{n+1}}{a_n}|$
- **Root Test** $L=\lim_{n\to\infty}\large\sqrt[n]{|a_n|}$ and $R=\large\frac{1}{L}$
> [!example] $\sum_{n=0}^\infty 5^n x^n$ so $a_n=5^n$
> - Using **Ratio Test**
>   $L={\large\lim_{n\to\infty}\frac{5^{n+1}}{5^n}}=5\implies R=\large\frac{1}{5}$
> - Using **Root Test**
> $L=\lim_{n\to\infty}\sqrt[n]{|5^n|}=5\implies R=\large\frac{1}{5}$
> - Convert to [[Geometric Series]] $\sum_{n=0}^\infty (5x)^n$ 
>   which only converges if $|r|<1$ where $r=5x\implies|5x|<1\implies|x|<\frac{1}{5}$
> 
> Meaning at $x=\large\frac{1}{5}$ the function goes to $\infty$
> - also check the endpoints $x=\frac{1}{5}$ and $x=-\frac{1}{5}$
>   $\sum_{n=0}^\infty(5\frac{1}{5})^n=\sum_{n=0}^\infty1$ which diverges to $\infty,-\infty$
### Interval of Convergence
- calculate radius of convergence $R$
- check endpoints
- if endpoints diverge then interval of convergence might be $\large(-\frac{1}{5},\frac{1}{5})$
- otherwise one of $\large[-\frac15,\frac15],(-\frac15,\frac15],[-\frac15,\frac15)$