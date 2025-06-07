**Analysis of Variance** tests if means of 2+ groups are significantly different
compares **variance between groups** to **variance within groups**
if between-group variance is significantly larger than within-group variance
then means are not equal ([[Null Hypothesis]] is rejected)

> [!note] ANOVA assumes [[Normal Distribution]] and equal [[Variance]][[s]] across groups

> [!example] Compare working efficiency of $3$ teams
> Time taken to complete task over $5$ days
> - **Team A** $5,7,6,8,5$
> - **Team B** $8,9,7,10,9$
> - **Team C** $6,5,6,7,6$
>  1. Calculate [[Mean]][[s]] $[\mu_A,\mu_B,\mu_C]=[6.2,8.6,6.0]$
>  2. Calculate overall [[Mean]] $\mu=\frac{\sum A+\sum B+\sum C}{5+5+5}=7$
>  3. Calculate sum of squares between groups `SSB`
>  $\text{SSB}=5\cdot((6.2-7)^2+(8.6-7)^2+(6.0-7)^2)=21$
>  4. Calculate sum of squares within groups `SSW`
>  - $\text{SSW}_A=\sum(A-\mu_A)^2=6.8$
>  - $\text{SSW}_B=\sum(B-\mu_B)^2=5.2$
>  - $\text{SSW}_C=\sum(C-\mu_C)^2=2.0$
>  - $\text{SSW}=6.8+5.2+2.0=14$
>  5. Calculate sum of squares $\text{SST}=\text{SSB}+\text{SSW}=21+14=35$
>  6. Calculate [[Mean]] squares 
>   - [[Mean]] square between $\text{MSB}=\frac{\text{SSB}}{\text{df}_\text{between}}=\frac{21}{2}=10.5$
>   - [[Mean]] square within $\text{MSW}=\frac{\text{SSW}}{\text{df}_\text{within}}=\frac{14}{12}=1.16$
>  - $\text{df}_\text{between}=n_\text{groups}-1$
>  - $\text{df}_\text{within}=n_\text{observations}-n_\text{groups}$
>  7. Calculate F-ratio $F\large=\frac{\text{MSB}}{\text{MSW}}=\frac{10.5}{1.16}=9$
>  8. Plug F-value in [[F-Distribution]] [[Cumulative Distribution Function|CDF]] with
>    $\text{df}_\text{between}=2,\text{df}_\text{within}=12$ or $d_1=2,d_2=12$
>    to get $p=1-F_\text{CDF}$ [[p-value]]
>    $F=\huge\frac{B_2(\frac{d_1}{2},\frac{d_2}{2},\frac{d_1x}{d_1x+d_2})}{B(\frac{d_1}{2},\frac{d_2}{2})}=\frac{B_2(\frac{2}{2},\frac{12}{2},\frac{2x}{2x+12})}{B(\frac{2}{2},\frac{12}{2})}=\frac{B_2(1,6,\frac{2x}{2x+12})}{B(1,6)}$
>    substitute $x=9$ to get $\frac{B_2(1,6,0.6)}{B(1,6)}=0.995904$
>    $1-F_\text{CDF}=1-0.995904=0.04096=4.096\%$ 
>    which is statistically significant so [[Null Hypothesis]] is rejected
>    `Mean is significantly different between teams`
>    `meaning some of them are more efficient then others`
