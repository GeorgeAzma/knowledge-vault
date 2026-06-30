Minimizes a function by iteratively moving towards direction of steepest descent
Used for minimizing [[Loss Function]] in [[Neural Network]][[s]]
### Problem $\min_X f(X)$
- $X$ [[Matrix]] `like weight matrix`
- $X_{k+1}=X_k-\eta\nabla_Xf$ basic gradient descent
    - $\eta$ learning rate
- $V_{k+1}=\beta V_k-\eta\nabla_Xf$ momentum `stochastic gradient descent (SGD)`
    - $X_{k+1}=X_k+V_{k+1}$
### Types
- **AdaGrad** per element learning rate
- [[RMSProp]]
- [[Adam]]
- **AdamW** [[Adam|Adam]] + weight decay
### Batching
- **Standard** calculates steepest descent from all the inputs, very slow and memory inefficient since it has to consider all inputs to take a single step downwards
- **Stochastic** only considers single input for calculating steepest descent, so it often completly miscalculates it and accidentally goes upwards, but it is much faster and takes least memory
- **Mini-batch** In between standard and stochastic, considers $\text{BatchSize}=64$ inputs to calculate good enough steepest descent, more parallelizable than 2 above and decently memory efficient, depending on $\text{BatchSize}$ slower step than **Stochastic**, however converges much faster, so it's most popular and usually better option
