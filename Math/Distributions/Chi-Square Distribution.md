Made by taking $k$ random samples from [[Normal Distribution|standard normal distribution]], 
squaring them and summing squares $X_1^2+X_2^2+\dots$, used in [[chi-square test]]
### $\chi^2(x,k)=\dfrac{x^{\tfrac{k}{2}-1}e^{-\tfrac{x}{2}}}{2^\tfrac{k}{2}\Gamma(\dfrac{k}{2})}$

- $\Gamma$ [[gamma function]] $(x-1)!$
- $k=N-1$ [[Math/Probability/Degrees of Freedom|degrees of freedom]]
##### Properties
- [[Mean]] $k$
- [[Median]] $k\left(1-\dfrac{2}{9k}\right)^3$
- [[Mode]] $\max(k-2,0)$
- [[Variance]] $2k$
- [[Skewness]] $\sqrt{\dfrac{8}{k}}$
- [[Kurtosis]] $\dfrac{12}{k}$
- [[Moment Generating Function]] $(1-2t)^{-k/2}$ for $t<\dfrac{1}{2}$
- [[Characteristic Function]] $(1-2it)^{-k/2}$
### [[Cumulative Distribution Function|CDF]] $\int_{\chi^2}^\infty\chi^2(x,k)dx=\dfrac{\gamma(\tfrac{k}{2},\tfrac{x}{2})}{\Gamma(\tfrac{k}{2})}$
Gives [[p-value]]
- $\gamma(x,b)=\int_0^b t^{x-1}e^{-t}\ dt$ [[Gamma Function#Incomplete Gamma Function $ gamma(x,b)= int_0 b t {x-1}e {-t} dt$|incomplete gamma function]]
- If $p<0.05$ samples are significantly different, likely not random noise
- If $p>0.95$ samples are significantly similar, likely they are same
### Usage
If you have 2D velocity components $v_x,v_y$ that are [[Normal Distribution|standard gaussian distributed]], 
since they maybe addition of random forces, which means central limit theorem applies,
then $|v|=\sqrt{v_x^2+v_y^2}$ which is sum of squared gaussian variables, 
meaning length follows chi distribution with 2 [[Math/Probability/Degrees of Freedom|degrees of freedom]]
### Properties
- $X_1+X_2=\chi^2_{k_1+k_2}$