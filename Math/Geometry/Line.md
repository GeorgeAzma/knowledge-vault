## Forms
#### General Form $Ax+By+C=0$
- **Normal** $\vec{n}=(A,B)$
- **Slope** $k=-\dfrac{A}{B}$
#### Slope-Intercept Form $y=kx+b$ 
- $k=-\dfrac{A}{B}=\tan\theta$ `slope`
- $b=-\dfrac{C}{B}$ `y-intercept`
#### Symmetric Form $\dfrac{x-x_0}{a}=\dfrac{y-y_0}{b}$
- $(x_0,y_0)$ `passes through this point`
- $\vec{d}=(a,b)$ `direction`
- $a=-\dfrac{C}{A},\quad b=\dfrac{C}{B}$
- **Line Passing Through 2 Points** $\dfrac{x-x_1}{x_2-x_1}=\dfrac{y-y_1}{y_2-y_1}\implies(x-x_1)(y_2-y_1)=(y-y_1)(x_2-x_1)$
#### Intercept Form $\dfrac{x}{a}+\dfrac{y}{b}=1$
- $a=-\dfrac{C}{A}$ `x-intercept`
- $b-\dfrac{C}{B}$ `y-intercept`
#### Parameteric Form $\begin{cases}x_0+at\\ y_0+bt\end{cases}$
- $(x_0,y_0)$ `starts on this point`
- $\vec{d}=(a,b)$ `direction`
#### Point-Slope Form $y-y_0=k(x-x_0)$
`symmetric form defined with slope instead of direction`
#### Normal Form $x\cos\theta+y\sin\theta-p=0$
- $\theta$ normal angle $\vec{n}=(\cos\theta,\sin\theta)$
- $p$ distance from origin
$\dfrac{Ax+By+C}{-\operatorname{sign}(C)\sqrt{A^2+B^2}}=0$ `equivalent general form`
- $\cos\theta=\dfrac{A}{-\operatorname{sign}(C)\sqrt{A^2+B^2}}$
- $\sin\theta=\dfrac{B}{-\operatorname{sign}(C)\sqrt{A^2+B^2}}$
- $p=-\dfrac{C}{\sqrt{A^2+B^2}}$

### Distance Formulas
- $d=\dfrac{|Ax_0+By_0+C|}{\sqrt{A^2+B^2}}=\dfrac{|L(P.x,P.y,A,B,C)|}{|n|}$ `point-line`
     plug in the point in line equation to get distance from laying on the line $L(\dots)=0$
     and divide by line scale to get unit distance
    
### Angle Between Lines
- $\tan\theta=\left|\dfrac{A_1B_2-A_2B_1}{A_1A_2+B_1B_2}\right|=\left|\dfrac{k_2-k_1}{1+k_1k_2}\right|=\dfrac{|n_1\times n_2|}{n_1\cdot n_2}$
- $\cos\theta=\dfrac{|A_1A_2+B_1B_2|}{\sqrt{A_1^2+B_1^2}\sqrt{A_2^2+B_2^2}}=\dfrac{|n_1\cdot n_2|}{||n_1||~||n_2||}$
- **perpendicular** $A_1A_2+B_1B_2=0$ or $k_1k_2=-1$
    - `tan(x2) = tan(x1 + pi/2)`
    - `tan(x2) = -1/tan(x1)`
    - `k2 = -1/k1`
    - `k1k2 = -1` 
    - $(-\dfrac{A_1}{B_1})(-\dfrac{A_2}{B_2})=\dfrac{A_1A_2}{B_1B_2}=-1\implies A_1A_2=-B_1B_2\implies A_1A_2+B_1B_2=0$
- **parallel** $A_1A_2-B_1B_2=0$ `k1 = k2 => A1/B1 = A2/B2 => A1B2 = A2B1`

### Point-Line Projection
- $x_h=x_0-A\dfrac{Ax_0+By_0+C}{A^2+B^2}$
- $y_h=y_0-B\dfrac{Ax_0+By_0+C}{A^2+B^2}$
**Intuition** $(x_0,y_0)-t\vec{n}$ must lay on the line, meaning $A(x_0-tA)+B(y_0-tB)+C=0$
- $t=\dfrac{Ax_0+By_0+C}{A^2+B^2}$ `how far along normal is the point`
- $x_0-At$ `subtracting moves point on the line`

### Observations
- $\vec{n}\cdot\vec{M_0M}=0$ `dot(dir, norm) = 0`
    - $(A,B)\cdot(x-x_0,y-y_0)=0$
    - $A(x-x_0)+B(y-y_0)=0$
    - $Ax+By+(-Ax_0-By_0)=0$
    - $C=-Ax_0-By_0$