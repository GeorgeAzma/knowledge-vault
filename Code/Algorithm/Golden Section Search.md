Finds minimum section for unimodal 1D function `unimodal = single minimum, like parabola`
- Iteratively shrinks minimum section to $61\%$ of original size each iteration
- Uses golden ratio, which allows to reuse previous point to avoid recalculation
### Algorithm
- calculate $r=\dfrac{1-\sqrt{5}}{2}\approx0.61803398874989$ [[Golden Ratio]]
1. pick interval $[a,b]$ which contains the minimum
2. pick two interior points 
    - $x_1=b-r(b-a)$ point $61\%$ from $b$ to $a$
    - $x_2=a+r(b-a)$ point $61\%$ from $a$ to $b$
3. evaluate $f(x_1),~f(x_2)$
4. compare $f(x_1)<f(x_2)$
    - $f(x_1)<f(x_2)\implies$min is in $[a,x_2]$
        - set $b'=x_2$
        - set $x_2'=x_1$ `reused`
    - $f(x_1)\geq f(x_2)\implies$min is in $[x_1,b]$
        - set $a'=x_1$
        - $x_1'=x_2$ `reused`
5. repeat $N$ iterations
    - section shrinks to $0.618^N$ of its original size
##### Resource
- https://youtu.be/hLm8xfwWYPw
