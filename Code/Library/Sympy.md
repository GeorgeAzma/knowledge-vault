### Simplify
``` python
from sympy import *

x, y = symbols('x y')

expr = (x - y) * (x + y) - (x + y)

simplify(expr) # x^2 - y^2 - x - y
factor(expr) # (x - y - 1) * (x + y)
expand(expr) # x^2 - y^2 - x - y


n = symbol('n')
expr = (x ** 2) * n + (x ** 2) * y + x * y + y

# collects common powers
collected = collect(expr, x) # x^2(n + y) + xy + y
# coefficient of x ** 2
collected.coeff(x, 2) # n + y

expr = (2 * x) / (4 * y)
cancel(expr) # x / 2y

expr = expr.subs(y, n ** 2) # (2 * x) / (4 * n^2)
expr = expr.subs((x, 4), (y, 2)) # 1
```
### Matrices
https://docs.sympy.org/latest/tutorials/intro-tutorial/matrices.html
``` python
M = Matrix([[1, 2, 3], [3, 2, 1]])
N = Matrix([0, 1, 1])

M * N # [5, 3]
M.nullspace()
M.columnspace() # set of all possible linear combinations of columns
```
### Calculus
``` python
diff(cos(x), x) # -sin(x)
diff(x**4, x, x, x) # 24 (triple derivative)
diff(x**4, x, 3)    # 24 (triple derivative)

integrate(sin(x ** 2), (x, -oo, oo)) # √(π/2)
limit(sin(x) / x, x, 0) # 1
# y'' - y = e^t
dsolve(Eq(y(t).diff(t, t) - y(t), exp(t)), y(t))
```
### Logic
``` python
solve_logic(True ^ True) # False (XOR)
```
### Trigonometry
``` python
trigsimp(expr) # simplify trigonometry only
expand_trig(sin(x + y)) #sin(x)cos(y) + sin(y)cos(x)
```
### Solve
``` python
solve(x ** 2 - x) # [0, 1] (quadratic equation roots)

# x^2 = x + 1 (golden ratio)
# x^2 - x - 1 = 0
nsolve(x ** 2 - x - 1) # 1.6180339 (numerical solve)
```
### Others
``` python
# help simpy make assumptions
symbols('x y', positive=True)
symbols('x y', real=True)  
symbols('x y', integer=True)

apart(expr) # partial fraction decomposition
expand_func(gamma(x + 3)) #x(x + 1)(x + 2)Γ(x)
```