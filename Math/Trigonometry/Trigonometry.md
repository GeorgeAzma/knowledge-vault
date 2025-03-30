### [[Simplifications]]
- $\sin^2{x}+\cos^2{x}=1$ `trig identities`
- $1+\tan^2{x}=\sec^2{x}$
- $1+\cot^2{x}=\csc^2{x}$
- $\sin^2{\frac{x}{2}}=\frac{1-\cos{x}}{2}$
- $\cos^2{\frac{x}{2}}=\frac{1+\cos{x}}{2}$
- $\large\frac{a}{\sin\alpha}=\frac{b}{\sin{\beta}}=\frac{c}{\sin{\gamma}}$ `a, b, c are opposite sides`
- $\sin{2x}=2\sin{x}\cos{x}$
- $\cos{2x}=\cos^2{x}-\sin^2{x}$
- $\sin(A \pm B)=\sin{A}\cos{B}\pm\cos{A}\sin{B}$ [[#Intuition]]
- $\cos(A \pm B)=\cos{A}\cos{B}\mp\sin{A}\sin{B}$ [[#Intuition]]
- $\cos x + i\sin x = e^{ix}$
- $\tan(a+b)=\large\frac{\tan{a}+\tan{b}}{1-\tan{a}\tan{b}}$
- $\tan(a-b)=\large\frac{\tan{a}-\tan{b}}{1+\tan{a}\tan{b}}$
- $\tan 2a=\large\frac{2\tan{a}}{1-\tan^2a}$
- $\tan{\large\frac{a}{2}}=\large\frac{\sin a}{1+\cos a}$
- $\sin(-x)=-\sin{x}$
- $\cos(-x)=\cos{x}$
- $\sin x\pm\sin y=2\sin{\large\frac{x\pm y}{2}}\cos{\large\frac{x\mp y}{2}}$
- $\cos x+\cos y=2\cos{\large\frac{x+y}{2}}\cos{\large\frac{x-y}{2}}$
- $\cos x-\cos y=-2\sin{\large\frac{x+y}{2}}\sin{\large\frac{x-y}{2}}$
- $\tan x\pm\tan y=\large\frac{\sin(x\pm y)}{\cos x\cos y}$
- $\sin x\cos y=0.5(\sin(x+y)+\sin(x-y))$
- $\cos x\cos y=0.5(\cos(x+y)+\cos(x-y))$
- $\sin x\sin y=0.5(\cos(x-y)-\cos(x+y))$
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
##### Hyperbolic Simplifications
- $\cosh x=\large\frac{e^x+e^{-x}}{2}$
- $\sinh x=\large\frac{e^x-e^{-x}}{2}$
- $\tanh x=\large\frac{e^{x}-e^{-x}}{e^{x}+e^{-x}}$
- $\operatorname{sech}=\large\frac{2}{e^x+e^{-x}}$
- $\operatorname{csch}=\large\frac{2}{e^x-e^{-x}}$
- $\sinh^2{x}-\cosh^2{x}=1$ 
- $\sinh^2{x}+\cosh^2{x}=e^x$ 
- $\operatorname{arccosh}(x)=\ln(x\pm\sqrt{x^2-1})$ `derived from above`
- $\operatorname{arcsinh}(x)=\ln(x+\sqrt{x^2+1})$ `derived from above`
- $\operatorname{arctanh}(x)=\huge\frac{\ln\left(\frac{1+x}{1-x}\right)}{2}$ `derivation had complex log`
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
$(\cos A\cos B-\sin A\sin B,\cos A\sin B+\sin A\cos B)$
where $\sin(A+B)$ is vertical and $\cos(A+B)$ is horizontal component
