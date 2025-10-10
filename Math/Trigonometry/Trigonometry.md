### [[Simplifications]]
#### $\sin$ & $\cos$
- $\sin x\cos y=(\sin(x-y)+\sin(x+y))/2$
- $\cos x\cos y=(\cos(x-y)+\cos(x+y))/2$
- $\sin x\sin y=(\cos(x-y)-\cos(x+y))/2$
- $\sin(A \pm B)=\sin{A}\cos{B}\pm\cos{A}\sin{B}$ [[#Intuition]]
- $\cos(A \pm B)=\cos{A}\cos{B}\mp\sin{A}\sin{B}$ [[#Intuition]]
- **easily derivable**
    - $\sin x+\sin y=2\sin{\large\frac{x+y}{2}}\cos{\large\frac{x-y}{2}}$ `from sin(x)cos(x)`
    - $\sin x-\sin y=2\sin{\large\frac{x-y}{2}}\cos{\large\frac{x+y}{2}}$ `from sin(x)cos(x)`
    - $\cos x+\cos y=2\cos{\large\frac{x+y}{2}}\cos{\large\frac{x-y}{2}}$ `from cos(x)cos(y)`
    - $\cos x-\cos y=-2\sin{\large\frac{x+y}{2}}\sin{\large\frac{x-y}{2}}$ `from cos(x)cos(y)`
    - $\sin{2x}=2\sin{x}\cos{x}$ `from sin(x+y)`
    - $\cos{2x}=\cos^2{x}-\sin^2{x}$ `from cos(x+y)`
    - $\sin^2{\frac{x}{2}}=\frac{1-\cos{x}}{2}$ `from sin(x)sin(y)`
    - $\cos^2{\frac{x}{2}}=\frac{1+\cos{x}}{2}$ `from cos(x)cos(y)`
- **easy** `to remember`
    - $\sin^2{x}+\cos^2{x}=1$
    - $\sin(-x)=-\sin{x}$
    - $\cos(-x)=\cos{x}$
#### $\tan$ & $\cot$
- $1+\tan^2{x}=\sec^2{x}$
- $1+\cot^2{x}=\csc^2{x}$
- $\tan x\pm\tan y=\large\frac{\sin(x\pm y)}{\cos x\cos y}$
- $\tan(a+b)=\large\frac{\tan{a}+\tan{b}}{1-\tan{a}\tan{b}}$
- $\tan(a-b)=\large\frac{\tan{a}-\tan{b}}{1+\tan{a}\tan{b}}$
- $\tan 2a=\large\frac{2\tan{a}}{1-\tan^2a}$
- $\tan{\large\frac{a}{2}}=\large\frac{\sin a}{1+\cos a}$
##### $\arcsin$ & $\arccos$ & $\arctan$
- $\sin{\large\frac{\arcsin(x)}{2}}=\operatorname{sign}(x)\large\sqrt{\frac{1-\sqrt{1-x^2}}{2}}$
- $\cos{\large\frac{\arcsin(x)}{2}}=\large\sqrt{\frac{1+\sqrt{1-x^2}}{2}}$
- $\sin{\large\frac{\arctan(x)}{2}}=\large\sqrt{\frac{1-1\div{\sqrt{1+x^2}}}{2}}$
- $\sin{\large\frac{\arccos(x)}{2}}=\large\sqrt{\frac{1-x}{2}}$
- $\cos{\large\frac{\arccos(x)}{2}}=\large\sqrt{\frac{1+x}{2}}$
- $a\cos(x)+b\sin(x)=\sqrt{a^2+b^2}\cos(x-\arctan\frac{b}{a})$
- $a\cos^2(x)+b\sin^2(x)=\frac{a+b}{2}+\frac{a-b}{2}\cos(2x)$
- $\arcsin'(x)=\large\frac{1}{\sqrt{1-x^2}}$ `half circle`
- $\arccos'(x)=-\arcsin'(x)$
- $\arccos(x)={\large\frac{\pi}{2}}-\arcsin(x)$
- **integrals**
    - $\arcsin(x)=\large\int\frac{1}{\sqrt{1-x^2}}$
    - $\arccos(x)=\large\frac{\pi}{2}-\int\frac{1}{\sqrt{1-x^2}}$
    - $\arctan(x)=\large\int\frac{1}{x^2+1}$
##### Hyperbolic
- $\cosh x=\large\frac{e^x+e^{-x}}{2}$
- $\sinh x=\large\frac{e^x-e^{-x}}{2}$
- $\tanh x=\large\frac{e^{x}-e^{-x}}{e^{x}+e^{-x}}$
- $\operatorname{sech}=\large\frac{2}{e^x+e^{-x}}$
- $\operatorname{csch}=\large\frac{2}{e^x-e^{-x}}$
- $\sinh^2{x}-\cosh^2{x}=1$ 
- $\sinh^2{x}+\cosh^2{x}=e^x$ 
##### $\operatorname{arsinh}$ & $\operatorname{arcosh}$ & $\operatorname{artanh}$
- $\operatorname{arcsinh}(x)=\ln(x+\sqrt{x^2+1})$
- $\operatorname{arccosh}(x)=\ln(x\pm\sqrt{x^2-1})$
- $\operatorname{arctanh}(x)=\huge\frac{\ln\left(\frac{1+x}{1-x}\right)}{2}$ `derived via complex log`
### other
- $\large\frac{a}{\sin\alpha}=\frac{b}{\sin{\beta}}=\frac{c}{\sin{\gamma}}$ `a, b, c are opposite sides`
- $\cos x+i\sin x=e^{ix}$
### Related
- [[Sine and Cosine]]
- [[Barycentric Coordinates]]
- [[Law of Sines]]
- [[Law of Cosines]]
### Images
![[Trigonometry Visualized.webp]]
![[Trigonometry Visualized Extra.webp]]
![[Cosin.webp]]
![[Trigonometry Square.webp]]
### Intuition
$\sin(A+B)=\sin{A}\cos{B}+\cos{A}\sin{B}$
imagine angle $A$ on unit circle, it's $x=\cos A,y=\sin A$
adding $B$ rotates the point, rotation formula is 
$(x\cos\theta-y\sin\theta,x\sin\theta+y\cos\theta)$ or $(x,y)\cos\theta+(-y,x)\sin\theta$
so rotating angle $A$ by $B$ would be
$(x',y')=(\cos(A+B),\ \sin(A+B))=(\cos A\cos B-\sin A\sin B,\cos A\sin B+\sin A\cos B)$
