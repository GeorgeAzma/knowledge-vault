- interview $n$ candidates
- accept or reject each
- maximize chance of choosing best candidate
`note: it is not best at maximizing average skill of candidate`
``` python
skill ~ U(0,1)

P(skill[i] == max(skill)) = 1 / candidates

r = cutoff index # reject skill[:r], pick = skill[i] > max(skill[:i - 1]) if i > r

P(max(skill[:r]) == max(skill)) = r / candidates;
P(max(skill[i] if i > r) == max(skill)) = (i - r) / i; 

# maximized P(skill[i] == max(skill))
# 1 / n = probability of this i-th candidate being best
# r / (i - 1) = probability of rejected candidates being best
P(success) = sum((1 / n) * (r / (i - 1)), r..=n)
```