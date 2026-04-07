According to NIST (National Institute of Standards and Technology)
1. Frequency (Monobit) `number of 0s and 1s must be same-ish`
2. Frequency within a Block ``
3. Runs
4. Longest Run of Ones in a Block
5. Binary Matrix Rank
6. Discrete Fourier Transform (Spectral)
7. Non-overlapping Template Matching 
8. Overlapping Template Matching
9. Maurer's "Universal Statistical"
10. Linear Complexity
11. Serial
12. Approximate Entropy
13. Cumulative Sums (Cusums)
14. Random Excursions
15. Random Excursions Variant
##### My Tests
1. Decide randomly to go left or right, see if it gives gaussian curve
2. Each bit has 50/50 chance of being 0 or 1
3. Each byte has uniformly distributed chance of being in a bucket 0-255
4. Mean is $\frac{MAX-MIN}{2}$ and Standard deviation is $\frac{MAX}{2}$
- Chi-Squared or kolmogorov–smirnov test for 1, 2 and 3
### Bias Test
single bit-flip should cause all other bits to have 50% chance of also flipping
1. build a matrix $M_{ij}$ which increments $m_{ij}$ when flipping bit $i$ causes bit $j$ to also flip
2. for every input $x$ for each bit $x_i$ flip it and see which bits $x_j$ changed and increment $m_{ij}$ 
3. after all iterations, divide each $m_{ij}$ by total iterations, ideally all values should be $0.5$
4. measure RMSE or [[Standard Deviation]] of $m_{ij}$ relative to ideal $0.5$ $\text{Bias}=\dfrac{1}{N}\sqrt{\sum_{i,j}(m_{ij}-0.5)^2}$
- $\text{Bias}<0.2$ passable
- $\text{Bias}<0.02$ theoritical limit of 3 round xor-shift
