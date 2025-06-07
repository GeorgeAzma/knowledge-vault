Tests how closely distribution/histogram matches to expected distribution
special case of [[Gamma Function]] family
> [!example] Survey preferred transportation
> people surveyed is $N=100$
> have initial expectation $[\text{car}=100\cdot70\%,\ \text{bus}=100\cdot20\%,\ \text{bike}=100\cdot10\%]$
> get result $[\text{car}=100\cdot50\%,\ \text{bus}=100\cdot20\%,\ \text{bike}=100\cdot30\%]$
> $\chi^2=\frac{(50-70)^2}{70}+\frac{(20-20)^2}{20}+\frac{(30-10)^2}{10}=5.71+0+40=45.71$
> $\chi^2(45.71,2)=\huge\frac{45.71^{\frac{2}{2}-1}e^{-\frac{45.71}{2}}}{2^\frac{2}{2}\Gamma(\frac{2}{2})}=\frac{e^{-22.86}}{2}=5.9\times10^{-11}$
### Formula $\chi^2=\sum_i^N{\frac{(o_i-e_i)^2}{e_i}}$
- $o$ observed
- $e$ expected
### Chi-Distribution $\chi^2(x,k)=\huge\frac{x^{\frac{k}{2}-1}e^{-\frac{x}{2}}}{2^\frac{k}{2}\Gamma(\frac{k}{2})}$
made by taking $k$ random samples from standard [[Normal Distribution]], squaring and summing them
- $\Gamma$ [[Gamma Function]] $(x-1)!$
- $k=N-1$ [[Math/Statistics/Degrees of Freedom|Degrees of Freedom]]
### [[Cumulative Distribution Function|CDF]] $\int_{\chi^2}^\infty\chi^2(x,k)dx=\large\frac{\gamma(\frac{k}{2},\frac{x}{2})}{\Gamma(\frac{k}{2})}$
gives [[p-value]]
- If $p<0.05$ samples are significantly different, likely not random noise
- If $p>0.95$ samples are significantly similar, likely they are same
