### $f(n)=O(g(n))\iff\exists c>0,~\exists n_0:\forall n\geq n_0,~f(n)\leq c\cdot g(n)$
- $\Omega(g(n))$ same but $f(n)\geq c\cdot g(n)$
- $\Theta(g(n))$ same but $c_1\cdot g(n)\leq f(n)\leq c_2\cdot g(n)$. also $\Omega(g(n)),O(g(n))\implies\Theta(g(n))$
> [!note] programmers say $O(n)$ but they mean $\Theta(n)$

> [!example] $f(n)=3n^2+5n+2$ and candidate $g(n)=n^2$
> - find $c>0$ where $f(n)\leq c\cdot g(n)\implies3n^2+5n+2\leq c\cdot n^2$
> - since $3n^2$ grows fastest we only care about $c\cdot n^2$ being bigger than $3n^2$
> - meaning $c=4$ since $3n^2+5n+2\leq 4\cdot n^2$
> - this assumes $n\geq 6$ so $n_0=6$
### Master Theorem $T(n)=aT(\dfrac{n}{b})+f(n)$
- $a\geq1$ subproblems
- $b>1$ subproblem size
- $f(n)$ non-recursive part
- $c_\text{crit}=\log_ba$ critical exponent

|    case    | $f(n)$ relation to $c_{crit}$ | Constraint   | $T(n)=O(?)$                  |
| :--------: | ----------------------------- | ------------ | ---------------------------- |
| leaf-heavy | $f(n)=O(n^c)$                 | $c<c_{crit}$ | $O(n^{c_{crit}})$            |
|  balanced  | $f(n)=O(n^{c_{crit}}\log^kn)$ | $k\geq0$     | $O(n^{c_{crit}}\log^{k+1}n)$ |
| root-heavy | $f(n)=\Omega(n^c)$            | $c>c_{crit}$ | $O(f(n))$                    |
3rd case assumes regularity condition holds $af(\frac{n}{b})\leq kf(n)$ for $k<1$ and large $n$
> [!example] $a=2,~b=4,~f(n)=0$
>$f_1(1)=1$ and $f_1(n)=2f_1(n/4)=4f_1(n/16)=8f_1(n/64)=2^xf_1(n/4^x)$
  base case is reached when $4^x=n$ so $x=\log_4(n)$
  plug that in $2^{\log_4(n)}f_1(n/4^{\log_4(n)})=2^{\log_4(n)}=\sqrt{n}$, or $O(\sqrt{n})$
``` python
# leaf-heavy: 2 * T(n/2) + 1 => 
# 2^k * T(n/2^k) + sum(2^i, 0, k-1) # 1+2+4... = n-1
# stop condition when n/2^k = 1 => k = log2(n) 
# 2^log2(n) * T(n/2^log2(n)) + sum(2^i, 0, log2(n)-1) => n * T(1) + (n - 1) 
def f(n):
    if n <= 1:
        return 1
    return 2 * f(n//2) + 1

f(4) => 2 * f(2) + 1 => 2 * (2 * f(1) + 1) + 1 => 2 * (2 * 1 + 1) + 1
f(4) => 2 * f(2) + 1 => 4 * f(1) + 2 => 4 * 1 + 2 + 1

f(n) => 2^log2(n) + sum(2^i, 0, log2(n)-1) => n + (n - 1) => 2n - 1 => O(n)
```
### Arithmetic $f_1(n)=O(g_1(n)),\quad f_2(n)=O(g_2(n))$
- $c\cdot f_1(n)=O(g_1(n))$
- $f_1(n)+f_2(n)=O(\max(g_1(n),g_2(n)))$
- $f_1(n)f_2(n)=O(g_1(n)g_2(n))$
