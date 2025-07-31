
| Likes Apples | Likes Soda | Likes Apple Juice |
| :----------: | :--------: | :---------------: |
|     Yes      |    Yes     |        Yes        |
|      No      |    Yes     |        No         |
|     Yes      |    Yes     |        No         |
|     Yes      |     No     |        Yes        |
tables contain less useful information, slowing algorithms
mutual information finds how much information variable/column
gives about other variable of interest
helpful for removing less useful information `Likes Soda`
### Formula $I(X;Y)=\sum_{x\in X}\sum_{y\in Y}P(x,y)\log(\frac{P(x,y)}{P(x)P(y)})$
- $X,Y$ discrete random variables
- $P(x,y)$ joint [[Probability]]
- $P(x)$ marginal [[Probability]] of $X$
- $P(y)$ marginal [[Probability]] of $Y$

| Apples `x` / Juice `y` |  Yes `P(x, Yes)`  |  No `P(x, No)`   | Apples `P(x)` | Juice `P(y)` |
| :--------------------: | :---------------: | :--------------: | :-----------: | :----------: |
|    Yes `P(Yes, y)`     | 2/4 `P(Yes, Yes)` | 1/4 `P(Yes, No)` | 3/4 `(2+1)/4` |     2/4      |
|     No `P(No, y)`      | 0/4 `P(No, Yes)`  | 1/4 `P(No, No)`  | 1/4 `(0+1)/4` |     2/4      |
```
Pj  = Probability of liking juice (marginal probability)
Pa  = Probability of liking apple (marginal probability)
Paj = Probability of liking both  (joint    probability)

I(X;Y) = 
Paj(N, N) * log(Paj(N, N) / (Pa(N) * Pj(N))) +
Paj(N, Y) * log(Paj(N, Y) / (Pa(N) * Pj(Y))) +
Paj(Y, N) * log(Paj(Y, N) / (Pa(Y) * Pj(N))) +
Paj(Y, Y) * log(Paj(Y, Y) / (Pa(Y) * Pj(Y))) =
1/4 * log(1/4 / (1/4 * 2/4)) + 
0/4 * log(0/4 / (1/4 * 2/4)) +
1/4 * log(1/4 / (3/4 * 2/4)) +
2/4 * log(2/4 / (3/4 * 2/4)) =
1/4 * log(2) + 0 + 1/4 * log(2/3) + 1/2 * log(4/3) = 
1/4 * 0.693 + 1/4 * -0.405 + 1/2 * 0.287 = 
0.173 - 0.101 + 0.143 = 0.215

0.215 is usefuleness of this column
do the same formula for soda/juice column
and see which one is less useful to be disposed (soda)

Note: 
- log() can be any base (natural usually)
- If apples rows were all Yes-es
  that'd give no information
  so calculations would be 0
- If apples were always opposite of juice
  it gives complete information about juice, so output is 1
```
