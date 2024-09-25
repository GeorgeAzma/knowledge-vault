### $\sum_{k=0}^{n-1}a+kd$
### Sum 
- $\sum_{k=0}^{n-1}{a+kd}=\frac{n}{2}(2a+(n-1)d)$
- $\sum_{k=0}^{n-1}{a+kd}=\frac{n}{2}(a + a_n)$
- $a=0\text{or}1\text{and}a_n\geq a$
	$\sum_{k=0}^{n-1}{a+kd}=\huge\frac{a_n(a_n+1)}{2}$
### Delta: $d=\large\frac{a_{n2}-a_{n1}}{n2-n1}$
### First element $a=a_n-(n-1)d$
### Nth element $a_n=a+(n-1)d$
### Element count $n=\frac{a_n-a_1}{d}+1$

> [!note]
> This assumes start index is 1, in code you don't need $(n-1)d$ instead do $nd$
