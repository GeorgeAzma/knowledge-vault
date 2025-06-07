Measures randomness, information gained from random variable `surprise`
### Formula $-\sum_{x}p(x)\log(p(x))$
- $p(x)$ discrete [[Probability]] distribution
- `log2 = bit, ln = nat` of information
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
How many equally likely options or branches a probability model is effectively choosing among
For [[GPT|LLM]][[s]] lower perplexity means model is confident at next prediction

Like number of equally likely states, coin flip has $2$ states $PP=0.5^{-0.5}*0.5^{-0.5}=0.5^{-1}=2$
