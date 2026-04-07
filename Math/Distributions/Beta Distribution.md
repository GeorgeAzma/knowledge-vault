When you have a ratio of successes and failures from limited trials, beta distribution gives probability distribution of what the ratio is 
> [!example] ad click success rate
> - **prior belief** $p\sim B(2,2)$ expecting 2 successful clicks and 2 failed non-clicks
> - **observed** 8 clicks and 2 non-clicks
> - **posterior** $p\sim B(2+8,2+2)=B(10,4)$
> - $f(x;10,4)$ is click/non-click ratio [[Probability Density Function|PDF]] (we don't know exact ratio with just $14$ trials) 
>     but as we do more trials the [[Probability Density Function|PDF]] narrows, e.g. $f(x,7000,3000)$ will be [[Probability Density Function|PDF]] with big spike at $70\%$ and very low probabilities elsewhere
> - use [[Cumulative Distribution Function|CDF]] of $f(0.7;10,4)$ to see chance of click success rate being $<70\%$
> - $F(0.7;10,4)=42\%$ chance of click rate being below $70\%$
### $f(x;a,b)=\dfrac{x^{a-1}(1-x)^{b-1}}{B(a,b)}$
- $a$ leans toward right and makes it more spiky $[1;\infty]$ `1 is uniform`
- $b$ leans toward left and makes it more spiky $[1;\infty]$ `1 is uniform`
- $B=\dfrac{(a-1)!(b-1)!}{(a+b-1)!}$ [[Beta Function]] normalizes probability integral to 1
### [[Cumulative Distribution Function|CDF]] $F(x;a,b)=\dfrac{1}{B(a,b)}\int_0^x x^{a-1}(1-x)^{b-1}$
- [[Integral]] is [[Beta Function#Incomplete Beta Function $B(x;a,b)= int_0 xt {a-1}(1-t) {b-1}dt$|Incomplete Beta Function]]
