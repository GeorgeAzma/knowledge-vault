### [[Derivative]] of function with more than one parameter

> [!example]
> ##### $f(x, y)=\sin{x}+y^2$
> 
> **How To Calculate:** Imagine that all of the other variables are constants and solve for current variable 
> 
> $\huge\frac{\delta f}{\delta x}=\normalsize\cos{x}$
> `Converted y^2 to const^2, derivative of that is 0, added derivative of sin(x) which is cos(x)`
> 
> $\huge\frac{\delta f}{\delta y}=\normalsize2y$    
> `Converted sin(x) to sin(const), derivative of that is 0, added derivative of y^2 which is 2y`
> 
> So $\Delta f=\begin{bmatrix}\cos{x}\\y\end{bmatrix}$ `This is called a Gradient`
