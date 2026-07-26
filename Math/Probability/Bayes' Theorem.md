Describes how to update a belief, given some evidence
youtu.be/HZGCoVF3YvM
### Formula $P(A\mid B)={\dfrac{P(B\mid A)P(A)}{P(B)}}={\dfrac{P(B,A)}{P(B)}}$
- $P(A\mid B)$ posterior `probability of A given B`
- $P(B\mid A)$ likelihood `probability of B given A`
- $P(A)$ prior
- $P(B)$ [[Joint, Marginal, Conditional Distribution|Marginal]]
``` python
for observation in observations: # camera says door is open, laser says door is closed
    for hypothesis in hypotheses: # door is open, door is closed
        belief[hypothesis] *= likelihood(observation, hypothesis) # P(A) * P(B|A)
    belief.normalize() # / P(B)
```
![[Bayes.webp#rounded|500]]
> [!example] Rain
> $P(A)=\text{Probability of rain}$
> $P(B)=\text{Probability of clouds}$
> 
> P(rain given cloudy) = P(rain) * P(cloudy given raining) / P(cloudy)
> 
> let's say $P(A)=0.27$ and $P(B)=0.4$ and $P(B\mid A)=0.98$
> $P(A\mid B)=\dfrac{0.27*0.98}{0.4}$
> $P(A\mid B)\approx0.66$
> 
> So probability of rain given it's cloudy is ~$66\%$

> [!example] Coin Flip
> $P(\theta)=\text{Beta}(1,1)=1\quad\text{for }~\theta\in[0,1]$
