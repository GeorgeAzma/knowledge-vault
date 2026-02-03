#### Steps `Q = quotient, N = numerator, D = denominator, R = result`
1. `Q = lead(N) / lead(D)`
2. `R += Q`
3. `N -= Q * D`
4. `while lead(N) >= lead(Q)`
5. `REM = N / D`
### Example $\dfrac{2x^3+3x^2-x+5}{x-2}$
1. $\dfrac{2x^3}{x}=2x^2$
   - $(x-2)2x^2=2x^3-4x^2$ `multiply`
   - $(2x^3+3x^2-x+5)-(2x^3-4x^2)=7x^2-x+5$ `subtract`
2. $\dfrac{7x^2}{x}=7x$
   - $(x-2)7x=7x^2-14x$
   - $(7x^2-x+5)-(7x^2-14x)=13x+5$
3. $\dfrac{13x}{x}=13$
   - $(x-2)13=13x-26$
   - $(13x+5)-(13x-26)=31$
**Result** $2x^2+7x+13+\left(\dfrac{31}{x-2}\right)$ `last part = remainder`
``` python
N = 2x^3 + 3x^2 - x + 5
D = x - 2
# constants: [D, lead(Q)]

# steps
while lead(N) > lead(Q) and R != 0:
    Q = lead(N) / lead(D)
    R = R + Q
    S = Q * D
    N = N - S
REM = N / D

# 1. 
Q = lead(N)[2x^3] / lead(Q)[x] = [2x^2]
R = R(0) + Q(2x^2) = [2x^2]
S = Q(2x^2) * D(x - 2) = [2x^3 - 4x^2]
N = N(2x^3 + 3x^2 - x + 5) - S(2x^3 - 4x^2) = [7x^2 - x + 5]

# 2. 
Q = lead(N)[7x^2] / lead(Q)[x] = [7x]
R = R(2x^2) + Q(7x) = [2x^2 + 7x]
S = Q(7x) * D(x - 2) = [7x^2 - 14x]
N = N(7x^2 - x + 5) - S(7x^2 - 14x) = [13x + 5]

# 3. 
Q = lead(N)[13x] / lead(Q)[x] = [13]
R = R(2x^2 + 7x) + Q(13) = [2x^2 + 7x + 13]
S = Q(13) * D(x - 2) = [13x - 26]
N = N(13x + 5) - S(13x - 26) = [31]
lead(31) >= lead(x) == False # stop
REM = N(31) / D(x - 2) = [31 / (x - 2)] 

R = 2x^2 + 7x + 13 + (31 / (x - 2))
```