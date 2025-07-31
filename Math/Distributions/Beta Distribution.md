### $f(x;a,b)=\large\frac{x^{a-1}(1-x)^{b-1}}{B(a,b)}$
- $a$ lean to right and makes it more spiky $[1;\infty]$ `1 is uniform`
- $b$ lean to left and makes it more spiky $[1;\infty]$ `1 is uniform`
- $B=\large\frac{(a-1)!(b-1)!}{(a+b-1)!}$ [[Beta Function]] normalizes probability integral to 1
> [!example] ad click success rate
> - **prior belief** $p\sim B(2,2)$ expecting 2 clicks/successes and 2 non-clicks
> - **observed** 8 clicks and 2 non-clicks
> - **posterior** $p\sim B(2+8,2+2)=B(10,4)$
> - $f(x;10,4)$ is click success rate [[Probability Density Function|PDF]]
> - use [[Cumulative Distribution Function|CDF]] of $f(0.7;10,4)$ to see chance of click success rate being $<70\%$
> - $F(0.7;10,4)=42\%$ chance of click rate being below $70\%$
### [[Cumulative Distribution Function|CDF]] $F(x;a,b)=\frac{1}{B(a,b)}\int_0^x x^{a-1}(1-x)^{b-1}$
- [[Integral]] is [[Beta Function#Incomplete Beta Function $B(x;a,b)= int_0 xt {a-1}(1-t) {b-1}dt$|Incomplete Beta Function]]
