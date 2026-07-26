Tests how closely distribution/histogram matches to expected distribution
special case of [[gamma function]] family
> [!example] Preferred Transportation Survey
> people surveyed is $N=100$
> have initial expectation $[~\text{car}=100\cdot70\%,\ \text{bus}=100\cdot20\%,\ \text{bike}=100\cdot10\%~]$
> get result $[~\text{car}=100\cdot50\%,\ \text{bus}=100\cdot20\%,\ \text{bike}=100\cdot30\%~]$
> $\chi^2=\dfrac{(50-70)^2}{70}+\dfrac{(20-20)^2}{20}+\dfrac{(30-10)^2}{10}=5.71+0+40=45.71$
> $\chi^2(45.71,2)=\dfrac{45.71^{\dfrac{2}{2}-1}e^{-\dfrac{45.71}{2}}}{2^\dfrac{2}{2}\Gamma(\dfrac{2}{2})}=\dfrac{e^{-22.86}}{2}=5.9\times10^{-11}$ `DoF = categories - 1 = 2`
> This can be plugged into [[#Cumulative Distribution Function CDF $ int_{ chi 2} infty chi 2(x,k)dx= large frac{ gamma( frac{k}{2}, frac{x}{2})}{ Gamma( frac{k}{2})}$|CDF]] to get [[p-value]]
> $p=\dfrac{\gamma(\dfrac{k}{2},\dfrac{x}{2})}{\Gamma(\dfrac{k}{2})}=\dfrac{\gamma(\dfrac{2}{2},\dfrac{45.71}{2})}{\Gamma(\dfrac{2}{2})}=\dfrac{\gamma(1,22.855)}{\Gamma(1)}=\gamma(1,22.855)=$
### Formula $\chi^2=\sum_i^N{\dfrac{(o_i-e_i)^2}{e_i}}$
- $o$ observed
- $e$ expected
### [[Chi-Square Distribution]]