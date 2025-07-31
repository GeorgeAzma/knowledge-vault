### Joint $P(X,Y)=P(X\mid Y)P(Y)$

|  X  |  Y  |  P  |
| :-: | :-: | :-: |
|  0  |  0  | 0.1 |
|  1  |  0  | 0.2 |
|  0  |  1  | 0.3 |
|  1  |  1  | 0.4 |
### Marginal $\int P(x,y) dy=P(x)$
[[Integral]] of joint distribution is marginal distribution

|  X  | P(X) |
| :-: | :--: |
|  0  | 0.4  |
|  1  | 0.6  |

|  Y  | P(Y) |
| :-: | :--: |
|  0  | 0.3  |
|  1  | 0.7  |

### Conditional $P(X|Y)=\large\frac{P(X,Y)}{P(Y)}$

|  X  |  Y  | $P(X\mid Y)$ |
| :-: | :-: | :----------: |
|  0  |  0  |     0.33     |
|  1  |  0  |     0.67     |
|  0  |  1  |     0.43     |
|  1  |  1  |     0.57     |
- $P(X=0|Y=0)={\large\frac{P(X=0,Y=0)}{P(Y=0)}}={\large\frac{0.1}{0.3}}=0.33$
For $Y=0$, $X$ has only 2 options, $0$ and $1$, with probability $0.1$ and $0.2$ resp.
but these weights sum up to $P(Y=0)=0.3$, so we need to normalize them
$0.1/0.3\approx0.33$ and $0.2/0.3\approx0.66$