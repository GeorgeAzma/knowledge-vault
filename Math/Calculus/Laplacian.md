### $\Delta f=\nabla^2 f=\nabla\cdot\nabla f=\dfrac{\partial^2f}{\partial x^2}+\dfrac{\partial^2f}{\partial y^2}+\dots$
[[Divergence]] of gradient ($\Delta$), so it's like how much gradient flows outwards/inwards
if it flows a lot you can imagine 2D function is similar to a bump, if it's $0$ then it's flat
> [!tip] laplacian is linear operator, so it can be represented as a [[matrix]]
> meaning matrix algebra can be used for simplifications
#### Derive using [[Geometric Algebra]] 
- $\nabla^2=\nabla\nabla=(\sum_i e_i\partial_i)(\sum_j e_j\partial_j)$ [[gradient]] squared
- $\nabla^2=\sum_{i,j} e_i e_j\partial_i\partial_j$
- $\nabla^2=\sum_{i} e_i^2\partial_i^2 +\sum_{i<j} (e_i e_j\partial_i\partial_j + e_j e_i\partial_j\partial_i)$
- $\nabla^2=\sum_{i} e_i^2\partial_i^2 +\sum_{i<j} (e_i e_j+e_j e_i)\partial_j\partial_i$ `multiplication is associative`
- $\nabla^2=\sum_{i} e_i^2\partial_i^2 +\sum_{i<j} (e_i e_j-e_i e_j)\partial_j\partial_i$ [[wedge product]] property $e_i\land e_j=-e_j\land e_i$
- $\nabla^2=\sum_{i} \partial_i^2$ [[geometric product]] property $e^2=1$
- $\nabla^2=\sum_{i} \partial_i^2$
**Simpler Derivation** $\nabla^2=\nabla\nabla=\nabla\cdot\nabla+\nabla\land\nabla$ ([[geometric product]]) and since $\nabla\land\nabla=0\implies\nabla^2=\nabla\cdot\nabla$
**Use Derived Laplacian For 2D [[Vector Field]]**  $\nabla^2\mathbf{F}=(\partial_x^2+\partial_y^2)(e_xF_x+e_yF_y)=e_x(\partial_x^2F_x+\partial_y^2F_x)+e_y(\partial_x^2F_y+\partial_y^2F_y)$

#### Discretize $\nabla^2f$ via [[Finite Difference]]
$f(x\pm h)=\sum_{n=0}^{\infty}{\dfrac{f^{(n)}(x)}{n!}(\pm h)^n}$ `taylor series when a = x, evaluated at x + h or x - h`
$f(x\pm h)$ **Expanded** $f(x)\pm hf'(x)+\dfrac{h^2}{2}f''(x)\pm\dfrac{h^3}{6}f'''(x)+\dfrac{h^4}{24}f'''(x)\pm\dots$
$f(x+h)+f(x-h)=2f(x)+h^2f''(x)+\dfrac{h^4}{12}f'''(x)+\dots$ `odd terms cancel`
##### Solve for $f''(x)$
$f''(x)=\dfrac{-2f(x)+f(x+h)+f(x-h)-\dfrac{h^4}{12}f'''(x)-\dots}{h^2}$
$f''(x)=\dfrac{f(x+h)-2f(x)+f(x-h)}{h^2}-\dfrac{h^2}{12}f'''(x)-\dots$
$f''(x)\approx\dfrac{f(x+h)-2f(x)+f(x-h)}{h^2}+\mathcal{O}(h^2)$
**Same Process For $f(x,y)$** but sum the results for each axis
$\nabla^2f(x,y)\approx\dfrac{f(x+h_x,y)-2f(x,y)+f(x-h_x,y)}{h_x^2}+\dfrac{f(x,y+h_y)-2f(x,y)+f(x,y-h_y)}{h_y^2}$ `if h_x = h_y join these`
**Same Process For $\mathbf{F}$ [[Vector Field]]** just calculate it for each axis $F_x,F_y$
