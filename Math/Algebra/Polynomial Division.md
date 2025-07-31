#### Steps
1. Divide leading terms
2. Multiply it with divisor
3. Subtract that from the current dividend
4. Repeat using the result as the new dividend
>[!example] $\huge\frac{2x^3+3x^2-x+5}{x-2}$
> 1. $\frac{2x^3}{x}=2x^2$
>    - $(x-2)2x^2=2x^3-4x^2$ `multiply`
>    - $(2x^3+3x^2-x+5)-(2x^3-4x^2)=7x^2-x+5$ `subtract`
> 2. $\frac{7x^2}{x}=7x$
>    - $(x-2)7x=7x^2-14x$
>    - $(7x^2-x+5)-(7x^2-14x)=13x+5$
> 3. $\frac{13x}{x}=13$
>    - $(x-2)13=13x-26$
>    - $(13x+5)-(13x-26)=31$
> - **Result** $2x^2+7x+13$ remainder $\frac{31}{x-2}$

``` python
def n/d:
    assert d ≠ 0
    q = 0
    r = n # each step n = d × q + r
    while r ≠ 0 and degree(r) ≥ degree(d):
        t = lead(r) / lead(d)
        q += t
        r -= t × d
    return (q, r)
```
