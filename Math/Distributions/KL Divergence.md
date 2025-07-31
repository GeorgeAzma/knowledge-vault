Kullback-Leibler Divergence
- Measures surprise after finding out true distribution is $P$ when you assumed it was $Q$
- Measured in bits of information gained, or other [[Entropy]] units
- Specifically it gives average extra info needed to correct your assumption
### Formula $D_{KL}(P||Q)=\sum_x P(x)\log\frac{P(x)}{Q(x)}$
- $D_{KL}(P||Q)=\sum_{x}P(x)\log{P(x)}-\sum_{x}P(x)\log{Q(x)}$
    - rewritten like this, it becomes [[Cross Entropy]] minus [[Entropy]]