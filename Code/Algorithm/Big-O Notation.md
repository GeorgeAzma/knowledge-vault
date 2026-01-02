$$\huge\begin{array}{l}
f,g:\mathbb{N}\to\mathbb{R}\\
f(n)=O(g(n))\leftrightarrow(\exists n_0\in\mathbb{N},c>0,\forall n\geq n_0, f(n)\leq c\cdot g(n))
\end{array}
$$
> [!example] $f(n)=3n^2+5n+2$
> candidate $g(n)=n^2$
> find $c$ where $f(n)\leq c\cdot g(n)$
> $3n^2$ dominates, so $c=4$ because $3n^2+5n+2\leq4n^2$
> this is true when $n\geq n_0=2$
### Master Theorem $T(n)=aT(\frac{n}{b})+f(n)$
- $a$ subproblems
- $b$ subproblem size
- $f(n)$ non-recursive part
- $\huge c_{crit}=\large\log_ba$

| $f(n)$ relation to $\large c_{crit}$ | Constraint          | $T(n)=O(?)$                         |            |
| ------------------------------------ | ------------------- | ----------------------------------- | ---------- |
| $\large f(n)=O(n^c)$                 | $\large c<c_{crit}$ | $\large O(n^{c_{crit}})$            | leaf-heavy |
| $\large f(n)=O(n^{c_{crit}}\log^kn)$ | $\large k\geq0$     | $\large O(n^{c_{crit}}\log^{k+1}n)$ | balanced   |
| $\large f(n)=\Omega(n^c)$            | $\large c>c_{crit}$ | $\large O(f(n))$                    | root-heavy |
3rd case assumes regularity condition holds $af(\frac{n}{b})\leq kf(n)$ for $k<1$ and large $n$
> [!example] $a=2,b=4,f(n)=0$
>$f_1(1)=1$ and $f_1(n)=2f_1(n/4)$
  $=4f_1(n/16)=8f_1(n/64)=2^xf_1(n/4^x)$
  base case is reached when $4^x=n$ so $x=\log_4(n)$
  plug that in $2^{\log_4(n)}f_1(n/4^{\log_4(n)})=2^{\log_4(n)}=\sqrt{n}$, or $O(\sqrt{n})$
### Arithmetic $f_1(n)=O(g_1(n)),f_2(n)=O(g_2(n))$
- $c\cdot f_1(n)=O(g_1(n))$
- $f_1(n)+f_2(n)=O(\max(g_1(n),g_2(n)))$
- $f_1(n)f_2(n)=O(g_1(n)g_2(n))$
