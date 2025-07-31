Graphs from mathcha.io/editor
##### $\huge1-e^{-x}$
![[1-exp(-x).svg]]
##### $\huge\frac{x}{1+x}$
![[x over (1+x).svg]]
### [[Normal Distribution|Bell Curves]]
##### $\huge e^{-x^2}$
![[exp(-x^2).svg]]
##### $\huge \frac{1}{1+x^2}$
![[1 over (1+x^2).svg]]
##### Anti-Smoothstep $\large 2x-x^2(3-2x)$
also $x-x\sqrt{1-x}+\sqrt{x}(1-x)$
 ![[Anti-Smoothstep.svg]]
##### [[Random Decay|Exponential Decay]] $\huge e^{-x}$
![[exp(-x).svg]]
##### Guassian Derivative $\huge-2x e^{-x^2}$
![[Gaussian Derivative (-2x e^{-x^2}).svg]]
##### $\huge\frac{x}{1+x^2}$
![[x over (1+x^2).svg]]
##### Sinc $\huge\frac{\sin(2\pi)}{2\pi x}$
![[Sinc.svg]]

### Smooth Functions
##### $\operatorname{abs}$ $\huge\sqrt{x^2+\epsilon}-\sqrt{\epsilon}$
![[Smooth Abs.svg]]
##### $\operatorname{floor}$ $\operatorname{floor}(x)+\huge\frac{\operatorname{mod}(x,1)^k-(1-\operatorname{mod}(x,1))^k}{2}$  `good k=[8;64]`
![[Smooth Floor.svg]]
``` c
float sfloor(float x, float k) {
    float i = floor(x);
    return i + 0.5 * (pow(x - i, k) - pow(1.0 - x + i, k));
}
```
##### $\operatorname{fract}$ $\huge\frac{\operatorname{mod}(x,1)\operatorname{sstep}(1,k,\operatorname{mod}(x,1))}{k}$ `k=0.9`
``` c
float sfract(float x, float k) {
    float f = fract(x);
    return f * smoothstep(1.0, k, f) / k;
}
```
### [[Sound#Sound Wave Types|Waves]]
##### Bump $\huge e^{\frac{1}{x^2-1}}$
![[exp(1 over (x^2 - 1)).svg]]
### $\huge\frac{x}{1+|x|}$
like `tan`
### $\frac{x}{\sqrt{1+x^2}}$
even more like `tan`
### $\frac{x}{\sqrt{1-x^2}}$
inverse of above, like `atan`
