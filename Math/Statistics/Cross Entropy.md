similar to [[Entropy]] but between 2 distributions

measures how many bits of information it costs 
to correct predicted probability $q(x)$ to be like $p(x)$
> [!example] $p(x)=[1,0]$ correct class is class $0$
> $q(x)=[0.7,0.3]$ model predicts correct class with $70\%$ certainty
> $-1\cdot\log(0.7)=0.357$ bits of information required to correct the model
> if model was fully confident it would cost zero bits $-1\cdot\log(1)=-1\cdot0=0$
### Formula $-\sum_{x}p(x)\log(q(x))$
- $p(x)$ discrete [[Probability]] distribution
sum is the highest when $p(x)$ and $q(x)$ are high together,
meaning it's highest when $p(x)=q(x)$, where it becomes [[Entropy]]
[[Cross Entropy]] is always greater than [[Entropy]] with same $p(x)$
`note: p(x), q(x) add up to 1`