# $e^{A}$
- $e^x=\sum_{n=0}^{\infty}\dfrac{x^n}{n!}$ [[Euler's Number]]
- $e^A=\sum_{n=0}^{\infty}\dfrac{A^n}{n!}$
### Usecase
- Instead of using [[Numerical Integrator#Euler|Euler Integration]] for approximately solving $x_{n+1}=x_n+hAx_n$ 
    - [[Matrix]] exponential gives exact solution $x_{n+1}=e^{hA}x_n$
- also if you multiply [[eigenvector]] of $A$ by $e^{At}v=e^{\lambda t}v$ where
    - $\text{Re}(\lambda)<0$ decay
    - $\text{Re}(\lambda)>0$ explosion
    - $\text{Re}(\lambda)=0$ oscillation (If $\text{Im}(\lambda)=0$ then $A=0$ and $e^{At}=I$)
### Properties
- $\begin{bmatrix}a&0\\0&b\end{bmatrix}=\begin{bmatrix}e^a&0\\0&e^b\end{bmatrix}$
- $\dfrac{dx}{dt}=Ax\implies x=e^{At}$
- $e^{i\theta}~~\leftrightarrow~~e^{\theta\begin{bmatrix}0&-1\\1&0\end{bmatrix}}$ [[Complex Number]] behaves similar as a matrix
