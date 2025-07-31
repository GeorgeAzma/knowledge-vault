- **Population** group of individuals
- **Individual** memory that represents 1 solution candidate
- **Chromosome** data/genes that represent the individual `0111`
- **Gene** singular data of a chromosome `bit`
- **Allele** possible values of gene `0 or 1`
- **Phenotype** visual representation of individual
### Phases
- initialize population
- loop
    - evaluate fitness
    - select parents `delete unselected`
    - do crossover
    - mutate children
### Crossover
- **One-Point** chromosome data is split at random point for both parents
  and bits to the right of that point are swapped between parents
- **Two-Point** same as one-point but data in the middle of 2 points are swapped
- **N-Point** split chromosome at $n$ random points and swap alternating segments
- **Uniform** each bit has same chance of being selected from either parent
- **Arithmetic** blend of 2 parent genes using $\alpha\sim\mathcal{U}(0,1)$
- **Multi-Parent**
- **Homologous** one-point but crossover point is based on similar genes
- **Shuffle** genes do n-point crossover and unshuffle
### Selection
- **Rank** fitness and select top rankers `maybe with some randomness`
    - **Truncation** select top percentage of population, discard the rest
- **Roulette** spin with selection chances proportional to fitness
    - **Stochastic Universal Sampling** roulette with multiple random arrows
    - **Rank-Based Roulette** where rank is fitness
- **Steady State** replace worst individuals with offspring from better ones
- **Tournament** select $k$ individuals choose the best
  from that with probability $p$, so 2nd best has $p(1-p)$
  repeat until enough parents are selected
- **Elitist** small portion of best individuals are carried over without change
- **[[Simulated Annealing|Boltzmann]]** start with low selection pressure and increase it slowly
- **Deterministic Crowding** replace parent with offspring only if they are better
- **Random**
- **Age-Based** prefer younger individuals
- **Hybrid** `tournament + elitist + age-based`
