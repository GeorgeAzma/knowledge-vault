Minimizes a function by iteratively moving towards direction of steepest descent
Used for minimizing [[Loss Function]] in [[Neural Network]][[s]]
### Types
- **Standard** calculates steepest descent from all the inputs
  very slow and memory inefficient 
  as it has to consider all inputs to take a single step downwards
- **Stochastic** only considers single input for calculating steepest descent,
  so it often completly miscalculates it and accidentally goes upwards,
  but it is much faster and takes least memory
- **Mini-batch** In between standard and stochastic
  considers $BatchSize=64$ inputs to calculate good enough
  steepest descent, more parallelizable than 2 above
  and decently memory efficient, depending on $BatchSize$
  slower step than **Stochastic**, however converges much faster
  so it's most popular and usually better option than above 2
