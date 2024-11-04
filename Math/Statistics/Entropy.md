Measures randomness, information gained from random variable `surprise`
### Formula $-\sum_{x}p(x)\log(p(x))$
- $p(x)$ Discrete [[Probability]] [[Distribution]]
- `log2 = bit, ln = logit` of information
> [!example] Fair coin flip is 1 bit of information
> Because it could've only had 2 states both equally likely
> 
> Dice roll is gives $\log_2(6)$ bits of information
> because it has 6 states equally likely
> 
> Random hex gives $4$ bits of information `16 states`
> 
> Unfair `80/20%` coin flip gives 
> $-0.8\log_2(0.8)-0.2\log_2(0.2)=0.72$ bits of information
### Perplexity $PP(p)=2^{-\sum_xp(x)\log_2(p(x))}=\prod_xp(x)^{-p(x)}$
kinda like states, coin flip has $2$ states $0.5^{-0.5}*0.5^{-0.5}=0.5^{-1}=2$
