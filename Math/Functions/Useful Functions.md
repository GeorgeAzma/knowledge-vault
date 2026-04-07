Graphs from mathcha.io/editor
- https://iquilezles.org/articles/functions/
### [[Easing Functions]]
#### $1-e^{-x}$
`1.0 - exp(-x)`
![[1-exp(-x).svg]]
#### $\dfrac{x}{1+x}$
`x / (1.0 + x)`
![[x over (1+x).svg]]
### [[Normal Distribution|Bell Curves]]
#### $e^{-x^2}$
`exp(-x*x)`
![[exp(-x^2).svg]]
#### $\dfrac{1}{1+x^2}$
`1.0 / (1.0 + x * x)`
![[1 over (1+x^2).svg]]
#### Anti-Smoothstep $2x-x^2(3-2x)$
`2.0 * x - x * x * (3.0-2.0 * x)`
also $x-x\sqrt{1-x}+\sqrt{x}(1-x)$
 ![[Anti-Smoothstep.svg]]
#### Impulse $kx\exp(1-kx)$ `k = 8`
`k * x * exp(1.0 - k * x)`
highest point `x = 1/k`
 ![[Impulse.svg]]
#### Sustained Impulse $\min(\dfrac{x^2}{f^2},1+\dfrac{2}{f}\max(x-f,0)\exp(-k(x-f)))$
`min(x * x / (f * f), 1.0 + 2.0 / f * max(x - f, 0.0) * exp(-k * (x - f)))`
![[Sustained Impulse.svg]]
#### [[Random Decay|Exponential Decay]] $\huge e^{-x}$
`exp(-x)`
![[exp(-x).svg]]
#### Guassian Derivative $-2x e^{-x^2}$
`-2.0 * x * exp(-x * x)`
![[Gaussian Derivative (-2x e^{-x^2}).svg]]
#### $\dfrac{x}{1+x^2}$
`x / (1.0 + x * x)`
![[x over (1+x^2).svg]]
#### Sinc $\dfrac{\sin(2\pi)}{2\pi x}$
`sin(2.0 * PI) / (2.0 * PI * x)
![[Sinc.svg]]

### Smooth Functions
##### abs $\sqrt{x^2+\epsilon}-\sqrt{\epsilon}$
`sqrt(x^2 + e) - sqrt(e)`
![[Smooth Abs.svg]]
##### floor $\operatorname{floor}(x)+\dfrac{\operatorname{mod}(x,1)^k-(1-\operatorname{mod}(x,1))^k}{2}$  `good k=[8;64]`
`floor(x) + 0.5 * (pow(fract(x), k) - pow(1.0 - fract(x), k))`
![[Smooth Floor.svg]]
#### fract $\dfrac{\operatorname{mod}(x,1)\operatorname{smoothstep}(1,k,\operatorname{mod}(x,1))}{k}$ `k = 0.9`
`fract(x) * smoothstep(1.0, k, fract(x)) / k`
#### [[Sound#Sound Wave Types|Waves]]
#### Bump $e^{\dfrac{1}{x^2-1}}$
![[exp(1 over (x^2 - 1)).svg]]
#### $\dfrac{x}{1+|x|}$
like `tan`
#### $\dfrac{x}{\sqrt{1+x^2}}$
even more like `tan`
#### $\dfrac{x}{\sqrt{1-x^2}}$
inverse of above, like `atan`
#### $\sqrt{x^{2}+a}-x$
similar to $e^{-x}$ but with much longer tail and linear-like decay