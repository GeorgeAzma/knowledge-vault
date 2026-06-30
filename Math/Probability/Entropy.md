Measures the uncertainty or average information content of a random variable; equivalently, the expected amount of surprise when its outcome is observed.
If entropy is 10 bits, then each new random sample gives you 10 bits of new information
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

> [!example] Compressing information of $1000$ images in a dataset
 > we want to represent images with minimum information possible
 > since all images appear once, probability of each image is $p(x)=\dfrac{1}{1000}$
 > entropy is $-\sum_x \dfrac{1}{1000}\log_2(\dfrac{1}{1000})=-\log_2(\dfrac{1}{1000})\approx9.96$ 
 > so images can be compressed to $10$ bits at minimum, which can just be their index in the dataset
### [[Perplexity]]

colah.github.io/posts/2015-09-Visual-Information
