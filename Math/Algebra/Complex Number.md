Similar to 2D vectors
### Simple Operations
- $i=\sqrt{-1},\quad i^2=-1,\quad i^3=-i,\quad i^4=1,\quad i^5=i,\quad i^6=-1\dots$
- $z=x+yi,\quad \bar{z}=x-yi$
- $x=\large\frac{z+\bar{z}}{2},\quad y=\frac{z-\bar{z}}{2}$
- $z_1\pm z_2=x_1\pm x_2+i(y_1\pm y_2)$
- $z_1z_2=(x_1x_2-y_1y_2)+i(x_1y_2+x_2y_1)$
- $z^2=(x^2-y^2)+i(2xy)$
- $z\bar{z}=|z|^2=x^2+y^2$  where $\bar{c}$ is complex [[Conjugate]]
- $\sqrt{c\bar{c}}=\sqrt{x^2+y^2}=r$ `complex number length`
- $\large\frac{z_1}{z_2}=\frac{z_1\bar{z_2}}{|z_2|^2}$
- $\operatorname{abs}(c)=|c|^2=x^2+y^2=r^2$
### Polar Formulas
- $x+yi=e^{i\theta}\sqrt{x^2+y^2}=e^{i\theta}r$
- $e^{i\theta}=\cos\theta+i\sin\theta$
- $\overline{e^{i\theta}}=e^{-i\theta}$
- $\ln(re^{i\theta})=\ln r+i\theta$
- $z_1z_2=r_1e^{i\theta_1}r_2e^{i\theta_2}=r_1r_2e^{i(\theta_1+\theta_2)}$
- $\large\frac{z_1}{z_2}=\frac{r_1e^{i\theta_1}}{r_2e^{i\theta_2}}=\frac{r_1}{r_2}e^{i(\theta_1-\theta_2)}$
### [[Trigonometry|Trigonometric]] Formulas

- $z=|z|(\cos\theta+i\sin\theta)$
- $z^n=|z|^n(\cos(n\theta)+i\sin(n\theta))$
- $z_1z_2=|z_1||z_2|(\cos(\theta_1+\theta_2)+i\sin(\theta_1+\theta_2))$
- ${\large\frac{z_1}{z_2}}={\large\frac{|z_1|}{|z_2|}}(\cos(\theta_1-\theta_2)+i\sin(\theta_1-\theta_2))$
$$\begin{array}{r}
z_1z_2=\\
{|z_1|}({\color{pink}\cos\theta_1}+{\color{skyblue}i\sin\theta_1})|z_2|({\color{palegreen}\cos\theta_2}+{\color{orange}i\sin\theta_2})=\\
|z_1||z_2|({\color{pink}\cos\theta_1\cos\theta_2}+{\color{skyblue}i\sin\theta_1i\sin\theta_2}+i{\color{palegreen}\sin\theta_1\cos\theta_2}+i{\color{orange}{\cos\theta_1\sin\theta_2}})=\\
|z_1||z_2|({\color{pink}\cos\theta_1\cos\theta_2}-{\color{skyblue}\sin\theta_1\sin\theta_2}+i({\color{palegreen}\sin\theta_1\cos\theta_2}+{\color{orange}\cos\theta_1\sin\theta_2}))=\\
|z_1||z_2|({\color{pink}(\cos(\theta_1-\theta_2)+\cos(\theta_1+\theta_2))/2}-{\color{skyblue}(\cos(\theta_1-\theta_2)-\cos(\theta_1+\theta_2))/2}+i({\color{palegreen}(\sin\theta_1\cos\theta_2)}+{\color{orange}(\sin\theta_2\cos\theta_1)}))=\\
|z_1||z_2|({\color{plum}\cos(\theta_1+\theta_2)}+i({\color{palegreen}(\sin(\theta_1-\theta_2)+\sin(\theta_1+\theta_2))/2}+{\color{orange}(\sin(\theta_2-\theta_1)+\sin(\theta_2+\theta_1))/2}))=\\
|z_1||z_2|({\color{plum}\cos(\theta_1+\theta_2)}+i{\color{coral}\sin(\theta_1+\theta_2)})\\
\end{array}$$

- $\cos y={\large\frac{e^{iy}+e^{-iy}}{2}},\quad\sin y={\large\frac{e^{iy}-e^{-iy}}{2i}}$
### Properties
- $|z|=0\iff z=0$
- $|z_1+z_2|\leq z_1+z_2$
- $|z_1z_2|=|z_1||z_2|,\quad{\large|\frac{z_1}{z_2}|=\frac{|z_1|}{|z_2|}}$
- $\overline{z_1\pm z_2}=\bar{z_1}\pm\bar{z_2}$
- $\overline{z_1z_2}=\bar{z_1}\bar{z_2}$
- $\overline{\large\frac{z_1}{z_2}}=\large\frac{\bar{z_1}}{\bar{z_2}}$
- 
### Code
``` c
#define ccjg(a) vec2((a).x, -(a).y)
#define cmul(a, b) vec2(dot(a, ccjg(b)), dot(a, (b).yx))
#define csqr(z) vec2(ccjg(z * z), 2.0 * (z).x * (z).y)
#define cdiv(a, b) (vec2(dot(a, b), dot(ccjg(a.yx), b)) / dot(b, b))
#define cexp(z) (exp((z).x) * vec2(cos((z).y), sin((z).y)))
#define clog(z) vec2(0.5 * log(dot(z, z)), atan((z).y, (z).x))
#define cabs(z) length(z)
```
**Intuition**
- `cexp = spherical -> cartesian`
- `clog = cartesian -> spherical`
- `cdiv`
