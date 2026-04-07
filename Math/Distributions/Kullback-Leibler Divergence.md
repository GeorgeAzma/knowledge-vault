- Measures surprise after finding out true distribution is $P$ when you assumed it was $Q$
- Measured in bits of information gained, or other [[Entropy]] units
- Specifically it gives average extra info needed to correct your assumption
### Formula $\text{KL}(P||Q)=\sum_x P(x)\log\frac{P(x)}{Q(x)}$
- $\text{KL}(P||Q)=\sum_{x}P(x)\log{P(x)}-\sum_{x}P(x)\log{Q(x)}$
    - rewritten like this, it becomes [[Cross Entropy]] minus [[Entropy]]
- $P||Q$ how $P$ differs from $Q$
**Properties**
- **Assymetric** $\text{KL}(P||Q)\neq\text{KL}(Q||P)$
- **Unbounded** if $P\neq0$ when $Q=0$ then $\text{KL}(P||Q)=\infty$
### Jensen-Shannon Divergence $\text{JSD}(P||Q)=\dfrac{\text{KL}(P||M)+\text{KL}(Q||M)}{2}$ where $M=\dfrac{P+Q}{2}$
**Properties**
- **Symmetric** $\text{JSD}(P||Q)=\text{JSD}(Q||P)$
- **Bounded** $[0;1]$ for log base 2 `M being average of P and Q, means it is never zero when P/Q is non-zero, meaning KL(P||M) never explodes to infinity, unlike KL`
- $\sqrt{\text{JSD}}$ is [[Distance Metric]] `satisfies triangle inequality`
