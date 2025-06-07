Used for generating samples from a probability distribution 
that is difficult to directly sample from
### Calculate
- **Generate Random Sample**
- **Accept-Reject Mechanism** Propose new samples based on current state and decide to accept or reject it
- **Random Walk** Take steps from one point to another guided by probabilities (a.k.a. [[Markov Chain]])
- **Acceptance Probability** ratio of probabilities between proposed state and current state
- **Iterate** Accept and Reject samples by some probability and after many iterations you will converge to desired probability distribution
> [!example] Placing a tree randomly on a terrain
> You don't know terrain function to place tree directly, so instead:
> - you start at a random position $a$
> - Move randomly to $b$
> - Have a probability function (e.g. $f(x)=\exp(-DistToSurf)$)
> - Probability of moving to $b$ is $f(b)/f(a)$
> - Move to $b$ using that probability
> - Repeat
