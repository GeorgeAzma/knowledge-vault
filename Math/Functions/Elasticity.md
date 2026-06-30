
### $E f(a)=\dfrac{a}{f(a)}f'(a)$
$=\lim_{x\to a}\dfrac{f(x)-f(a)}{x-a}\dfrac{a}{f(a)}=\lim_{x\to a}\dfrac{f(x)-f(a)}{f(a)}\dfrac{a}{x-a}=\lim_{x\to a}\dfrac{\dfrac{f(x)}{f(a)}-1}{\dfrac{x}{a}-1}\approx \dfrac{\%\Delta f(a)}{\%\Delta a}=\dfrac{d \log f(x)}{d \log x}$
### Properties
- $E(f(x)\cdot g(x))=Ef(x)+Eg(x)$
- $E\dfrac{f(x)}{g(x)}=Ef(x)-Eg(x)$
- $E(f(x)\pm g(x))=\dfrac{f(x)E(f(x))\pm g(x)E(g(x))}{f(x)\pm g(x)}$
- $Df(x)=\dfrac{Ef(x)\cdot f(x)}{x}$ [[Derivative]]
- $E(c)=0$
- $E(c\cdot f(x))=E f(x)$
- $E(bx^a)=a$
### Arc Elasticity $E=\dfrac{\dfrac{x_2-x_1}{(x_2+x_1)/2}}{\dfrac{y_2-y_1}{(y_2+y_1)/2}}=\dfrac{\text{\% change in }x}{\text{\% change in }y}$
same thing but instead of using a limit, use two nearby points
> [!example] model sold quantity decrease, when price increases
> - $P_1=4~\$$ `old price`
> - $P_2=6~\$$ `new price`
> - $Q_1=120$ `old quantity sold`
> - $Q_2=80$ `new quantity sold (same timeframe)`
> $E=\dfrac{\dfrac{Q_2-Q_1}{(Q_2+Q_1)/2}}{\dfrac{P_2-P_1}{(P_2+P_1)/2}}=\dfrac{\dfrac{80-120}{(80+120)/2}}{\dfrac{6-4}{(6+4)/2}}=\dfrac{\dfrac{-40}{100}}{\dfrac{2}{5}}=-1$

| $\|E\|$     | Label               | Meaning                                                          |
| ----------- | ------------------- | ---------------------------------------------------------------- |
| $>1$        | elastic             | $\%\Delta Q$ is bigger `lower price for max profit`              |
| $=1$        | unit elastic        | $P,Q$ change is proportional `price perfectly balanced`          |
| $<1$        | inelastic           | $\%\Delta Q$ is smaller `price can be raised`                    |
| $=0$        | perfectly inelastic | $Q$ stays same `price can be infinity`                           |
| $\to\infty$ | perfectly elastic   | any $\Delta P$ causes $\infty$ change in $Q$ `price should be 0` |
