Compares [[Mean]][[s]] of 2 groups, used for [[Null Hypothesis|Hypothesis]] testing
- **one-tailed** tests if $\mu_1<or>\mu_2$
- **two-tailed** tests if $\mu_1\neq\mu_2$
### One-sample/Student's $t=\frac{\sqrt{n}(\bar{x}-\mu_0)}{s}$
- $\bar{x}$ sample [[Mean]]
- $\mu_0$ test [[Mean]]
- $s$ [[Standard Deviation#Sample SD $s= sqrt{ frac{ sum(x_i- bar{x}) 2}{n-1}}$|Sample Standard Deviation]]
- $n$ sample count
> [!note] Here [[Null Hypothesis]] is that $\mu=\mu_0$

> [!example] Testing that RNG mean is $\mu_0=0$
> $r=[0.5,0.1,-0.3,0.9,-0.7]$ `-1 to 1` $\mu=0.1$
> $s=\large\sqrt\frac{(0.5-0.1)^2+(0.1-0.1)^2+(-0.3-0.1)^2+(0.9-0.1)^2+(-0.7-0.1)^2}{5-1}$ 
> $s=\large\sqrt{\frac{0.4^2+0.4^2+0.8^2+0.8^2}{4}}=\sqrt{\frac{1.6}{4}}=\sqrt{0.4}\approx0.632$
> $\large t\approx\frac{\sqrt5(0.1-0)}{0.632}\approx\frac{0.224}{0.632}\approx0.354$ 
> $p=2(1-CDF)\approx0.741$ [[p-value]] using [[#t-distribution $f(t,v)= frac{ Gamma( frac{v+1}{2})}{ sqrt{ pi v} Gamma( frac{v}{2})}(1+ frac{t {2}}{v}) {- frac{(v+1)}{2}}$|t_distribution]] [[Cumulative Distribution Function|CDF]] with $5-1$ [[Physics/Degrees of Freedom|Degrees of Freedom]]
### Two-sample/Independent $t=\frac{\bar{x}_1-\bar{x}_2}{s\sqrt{n_1^{-1}+n_2^{-1}}}=\frac{\bar{x}_1-\bar{x}_2}{s\sqrt{\frac{2}{n}}}$
> [!note] Assumes variances are equal between groups
- $\bar{x}_1,\bar{x}_2$ sample [[Mean]][[s]] for each group
- $s$ [[Standard Deviation#Pooled|Pooled Standard Deviation]]
- $n_1,n_2$ number of samples for each group
> [!example] Comparing grades of 2 groups of students
> Group x $[80,85,90,88,92]$ $\bar{x}=87$ $\sigma_x^2=22$
> Group y $[75,78,82,80,85]$ $\bar{y}=80$ $\sigma_y^2=14.5$
> $s=\sqrt{\frac{22+14.5}{2}}=\sqrt{18.25}\approx4.27$
> $t=\frac{87-80}{4.27\sqrt{1/5+1/5}}=\frac{7}{4.27\sqrt{0.4}}\approx\frac{7}{4.27*0.63}\approx\frac{7}{2.7}\approx2.59$
### Welch's $t=\frac{\bar{x}_1-\bar{x}_2}{\sqrt{\frac{s_1^2}{n_1}+\frac{s_2^2}{n_2}}}$
> [!note] Independent t-test that doesn't assume equal variances
- $\bar{x}_1,\bar{x}_2$ sample [[Mean]][[s]] for each group
- $s_1,s_2$ sample [[Standard Deviation]][[s]] for each group
- $n_1,n_2$ number of samples for each group
### Paired/Related $t=\frac{\sum d}{\sqrt{\frac{n(\sum d^2) - (\sum d)^2}{n-1}}}$
- $d$ differences between same sample pairs seperated by time
> [!example] Grades of same group of students over time
> Year 1 $[80,85,90,88,92]$
> Year 2 $[75,78,82,80,85]$
> $d=5+7+8+8+7=35$
> $d_2=25+49+64+64+49=251$
> $t={\huge\frac{35}{\sqrt{\frac{5*251-1225}{5-1}}}}={\huge\frac{35}{\sqrt{\frac{30}{4}}}}={\huge\frac{35}{\sqrt{7.5}}}\approx12.78$
### t-distribution $f(t,v)=\frac{\Gamma(\frac{v+1}{2})}{\sqrt{\pi v}\Gamma(\frac{v}{2})}(1+\frac{t^{2}}{v})^{-\frac{(v+1)}{2}}$
- $\Gamma$ [[Gamma Function]] $(x-1)!$
- $v$ [[Math/Statistics/Degrees of Freedom]]
> [!tip] Use standard [[Normal Distribution]] for $v\geq30$
### Get [[p-value]] $2\int_{|t_{value}|}^\infty f(t,v)dt$
> [!note] Above is [[Cumulative Distribution Function|CDF]] of t-distribution 
- **One-sample/Student's** $v=n-1$
-  **Two-sample/Independent** $v=n_1+n_2-2$
- **Welch's** $v\approx\huge\frac{(\frac{s_1^2}{n_1}+\frac{s_2^2}{n_2})^2}{\frac{(\frac{s_1^2}{n_1})^2}{n_1-1}+\frac{(\frac{s_2^2}{n_2})^2}{n_2-2}}$
- **Paired/Related** $v=n-1$
> [!tip] Use standard [[Normal Distribution]] [[Cumulative Distribution Function|CDF]] for $v\geq30$
- If $p<0.05$ samples are significantly similar, likely not random noise
- If $p>0.95$ samples are significantly different, likely they are same
