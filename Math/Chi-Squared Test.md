Tests how closely distribution/histogram matches to expected distribution
> [!example] Test RNG uniformity
> [[Null Hypothesis]] is that rng samples are random
### Formula $\chi^2=\sum_i^N{\frac{(o_i-e_i)^2}{e_i}}$
- $o$ observed
- $e$ expected
> [!note] size and sum of $o$ and $e$ should be same
### Chi-Distribution $\chi^2(x,k)=\frac{1}{2^\frac{k}{2}\Gamma(\frac{k}{2})}x^{\frac{k}{2}-1}e^{-\frac{x}{2}}$
- $\Gamma$ [[Gamma Function]] $(x-1)!$
- $k=N-1$ [[Math/Degrees of Freedom (DOF)|Degrees of Freedom (DOF)]]
### Get [[p-value]] $\int_{\chi^2}^\infty\chi^2(x,k)dx$
> [!note] Above is [[Cumulative Distribution Function (CDF)|CDF]] of chi-distribution 
- If $p<0.05$ samples are significantly different, likely not random noise
- If $p>0.95$ samples are significantly similar, likely they are same
