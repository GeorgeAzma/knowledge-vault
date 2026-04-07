**Goal** sample from hard distribution $\pi(x)$
**MCMC** builds [[Markov Chain]] and does a random walk [[Monte Carlo]] approximating $\pi(x)$ iteratively 
- https://youtu.be/3qodjHRUxAo

| Method                  | Mixing Time      | Usecase                                   |
| ----------------------- | ---------------- | ----------------------------------------- |
| [[Metropolis-Hastings]] | $O(d)$           | simple                                    |
| [[Metropolis]]          |                  | $q(x'\mid x)=q(x\mid x')$                 |
| MALA                    | $O(\sqrt[3]{d})$ | gradients are available and HMC is heavy  |
| HMC                     | $O(\sqrt[4]{d})$ | high dimensional and smooth distributions |
| Gibbs                   |                  | $\alpha=1$ `always move to new sample`    |
| Slice                   |                  | scale is hard to tune                     |
- **burn-in period** since MCMC uses random initial guesses which may not be representative of target distribution, often first few samples are ignored
- **thinning** new sample depends on current sample, to remove this correlation you can ignore samples between samples
