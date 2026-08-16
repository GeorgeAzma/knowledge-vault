### $R=\dfrac{1}{L}$
which values of $x$ does power series converge
- **Ratio Test**  $L=\lim_\limits{n\to\infty}|\dfrac{a_{n+1}}{a_n}|$
- **Root Test** $L=\lim_\limits{n\to\infty}\sqrt[n]{|a_n|}$
> [!example] $\sum_{n=0}^\infty 5^n x^n$ so $a_n=5^n$
> - Using **Ratio Test**
>   $L=\lim_\limits{n\to\infty}\dfrac{5^{n+1}}{5^n}=5\implies R=\dfrac{1}{5}$
> - Using **Root Test**
> $L=\lim_\limits{n\to\infty}\sqrt[n]{|5^n|}=5\implies R=\dfrac{1}{5}$
> - Convert to [[Geometric Series]] $\sum_{n=0}^\infty (5x)^n$ 
>   which only converges if $|r|<1$ where $r=5x\implies|5x|<1\implies|x|<\dfrac{1}{5}$
> 
> Meaning at $x=\dfrac{1}{5}$ the function goes to $\infty$
> - also check the endpoints $x=\dfrac{1}{5}$ and $x=-\dfrac{1}{5}$
>   $\sum_{n=0}^\infty(5\dfrac{1}{5})^n=\sum_{n=0}^\infty1$ which diverges to $\infty,-\infty$
### Interval of Convergence
- calculate radius of convergence $R$
- check endpoints
- if endpoints diverge then interval of convergence might be $\large(-\frac{1}{5},\frac{1}{5})$
- otherwise one of $\large[-\frac15,\frac15],(-\frac15,\frac15],[-\frac15,\frac15)$
