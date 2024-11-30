Similar to 2D vectors
### Operations
- $i=\sqrt{-1}$ or $i^2=1$
- $c_1\pm c_2=x_1\pm x_2+i(y_1\pm y_2)$
- $c_1c_2=(x_1x_2-y_1y_2)+i(x_1y_2+x_2y_1)$
- $c^2=(x^2-y^2)+i(2xy)$
- $c\bar{c}=|c|^2=x^2+y^2$  where $\bar{c}$ is complex [[Conjugate]]
- $\sqrt{c\bar{c}}=\sqrt{x^2+y^2}=R$ `complex number length`
- $\large\frac{c_1}{c_2}=\frac{c_1\bar{c_2}}{|c_2|^2}$
### Formulas
- $x+yi=e^{i\theta}\sqrt{x^2+y^2}$ `R`
- $e^{i\theta}=\cos\theta+i\sin\theta$
- $\ln(Re^{i\theta})=\ln(R)+i\theta$
- $c_1c_2=R_1e^{i\theta_1}R_2e^{i\theta_2}=R_1R_2e^{i(\theta_1+\theta_2)}$
- $\large\frac{c_1}{c_2}=\frac{R_1e^{i\theta_1}}{R_2e^{i\theta_2}}=\frac{R_1}{R_2}e^{i(\theta_1-\theta_2)}$
- $\operatorname{abs}(c)=|c|=x^2+y^2=R$
### Code
```
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
