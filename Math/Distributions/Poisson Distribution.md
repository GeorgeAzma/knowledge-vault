With expectation of $\lambda$ events in a given interval
probability of $k$ events in the same interval is poisson distribution
### Formula $\huge\frac{\lambda^{k}e^{-\lambda}}{k!}$
- $\mu=\sigma^2=\lambda$
> [!example] $\lambda=3$ cars pass by in a minute on average 
> `lambda stays constant, cars are independent`
> $k=2$ cars/minute 
> $\frac{3^2e^{-3}}{2!}\approx9*0.05/2\approx0.225=22.5\%$ chance
> 
> $k=1\to4$ has $0.15+0.22+0.22+0.17=0.77=77\%$ chance
> which is same formula done 4 times and summed
> > [!note] we are not integrating since $1.5$ cars can't pass by
### Poisson distribution related to programming
Random distribution where samples are evenly spaced
#### Cem Yuksel Poisson Distribution Algorithm
- Generate more samples then specified
- Calculate weight for each sample based on distance to it's neighbors
- Remove sample with highest weight
- Decrease weight for neighboring samples 
- Do it till you reach desired number of samples
> [!tip] 
> - Use kd-tree for finding the closest neighbors
> - Use heap to keep track of sample with highest weight

> [!note] Fun thing you can do
> Generate image by multiplying sample's weight by image's brightness
> Low brightness = lower weight = more samples there
