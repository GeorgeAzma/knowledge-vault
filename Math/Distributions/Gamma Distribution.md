### Formula $f(x;\alpha,\beta)=\huge\frac{x^{\alpha-1}e^{-\frac{x}{\beta}}}{\beta^\alpha\Gamma(\alpha)}$
- $\alpha$ shape `controls form/peak`
- $\beta$ scale `controls width/distribution`
> [!example] Call center call waiting time
> 
> - collect data and calculate [[Mean]] and [[Standard Deviation]]
> - $\alpha=\large\frac{\mu^2}{\sigma^2}$
> - $\beta=\large\frac{\sigma^2}{\mu}$
> - $\mu=3$ `takes 3 mins on average to recieve a call`
> - $\sigma^2=4$ `4 min^2 variance`
> - $\alpha=\frac{3^2}{4}=\frac{9}{4}=2.25$
> - $\beta=\frac{4}{3}\approx1.33$
> - [[Mean]] is $\alpha\beta$ `how long operators have to wait on average`
> - Mode is $\max(\alpha-1,0)\beta$ `time when you are most likely to get a call`
> - $f(x;\alpha,\beta)$ will return [[Probability]] [[Distribution]]

> [!note] [[Chi-Squared Test#Chi-Distribution $ chi 2(x,k)= huge frac{x { frac{k}{2}-1}e {- frac{x}{2}}}{2 frac{k}{2} Gamma( frac{k}{2})}$|Chi-Distribution]] is gamma distribution with $\alpha=\frac{k}{2}$ and $\beta=2$
### [[Cumulative Distribution Function|CDF]] $F(x;\alpha,\beta)=\large\frac{\gamma(\alpha,\frac{x}{\beta})}{\Gamma(\alpha)}$
- $\gamma$ [[Gamma Function#Incomplete Gamma Function $ gamma(x,s)= int_0 s t {x-1}e {-t} dt$|Incomplete Gamma Function]]
> [!example] Probability that you'd get a call if you waited $x$ minutes
