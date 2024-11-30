---
aliases:
  - Bell Numbers
---
Number of ways to partition set of $n$ objects into $k$ subsets `non-empty`
### Formula $S(m,n)=n\cdot S(m-1,n)+S(m-1,n-1)$
$S(m,n)=\sum_{i=0}^n(-1)^{n-k}\huge\frac{i^m}{(n-i)!i!}$
- $S(m,1)=1$ for $m\geq1$
- $S(m,m)=1$ for all $m$
- $S(m,0)=0$ for $m>0$
> [!example] $\set{1,2,3,4}$, so $m=4,n=2$
> $\set{\set{1},\set{2,3,4}}$
> $\set{\set{2},\set{1,3,4}}$
> $\set{\set{3},\set{1,2,4}}$
> $\set{\set{4},\set{1,2,3}}$
> $\set{\set{1,2},\set{3,4}}$
> $\set{\set{1,3},\set{2,4}}$
> $\set{\set{1,4},\set{2,3}}$
> $7$ ways to partition/distribute $4$ objects into $2$ subsets
### Bell Numbers $B_m=\sum_{n=1}^m S(m,n)$
> [!example] $\set{1,2,3,4}$, so $m=4$
> $\sum_{n=1}^m S(4,n)$
> $S(4,1)=1$
> $S(4,2)=2S(3,2)+S(3,1)=2(2S(2,2)+S(2,1))+1=2(2\cdot1+1)+1=4+2+1=7$
> $S(4,3)=3S(3,3)+S(3,2)=3+(2S(2,2)+S(2,1))=3+(2\cdot1+1)=3+3+1=6$
> $S(4,4)=1$
> $B_m=1+7+6+1=15$
```
Precomputed
B_00 = 0
B_01 = 1
B_02 = 2
B_03 = 5
B_04 = 15
B_05 = 52
B_06 = 203
B_07 = 877
B_08 = 4140
B_09 = 21147
B_10 = 115975
B_11 = 678570
B_12 = 4213597
B_13 = 27644437
B_14 = 190899322
B_15 = 1382958545
B_16 = 10480142147

Approx polynomial exp(-0.4316 + 0.278*x + 0.1621*x^2 - 0.01048*x^3 + 0.0004347*x^4 - 0.000007642*x^5)
Max relative error (0-08): 0.0046%
Max relative error (0-16): 0.9501%
```
