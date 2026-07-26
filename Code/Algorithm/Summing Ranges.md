---
aliases:
  - Prefix Sum
  - Fenwick Tree
---
### [[Big-O Notation|Time Complexities]]

| Algorithm    | Construction | Sum Up To   | Sum Between | Update      |
| ------------ | ------------ | ----------- | ----------- | ----------- |
| Naive        | $O(1)$       | $O(n)$      | $O(n)$      | $O(1)$      |
| Prefix Sum   | $O(n)$       | $O(1)$      | $O(1)$      | $O(n)$      |
| Fenwick Tree | $O(n)$       | $O(\log n)$ | $O(\log n)$ | $O(\log n)$ |

### Prefix Sum
``` python
arr = [1,5,-2,3]
pps = [1,6,4,7]

sum(arr) = pps[-1]
sum(arr[i]) = pps[i]
sum(arr[2..3]) = arr[3] - arr[1] 
```
### Fenwick Tree
https://youtu.be/-AFi-A9j-RM?t=800
![[Fenwick Tree.webp#rounded|800]]
- `bit = binary index tree`
- `must use 1 based indexing`
##### How to calculate levels
``` python
construct(i = 6)
# find highest power of two that divides 'i = 6'
2^1 = 2
bit[i = 6] = sum(data[i - 2 : i]) # so element at 'i = 6' contains sum of two previous elements

i = 8
# find highest power of two that divides 'i = 8'
2^3 = 8
bit[i = 8] = sum(data[i - 8 : i]) # so element at 'i = 8' contains sum of 8 previous elements
```
##### How To Update
``` python
update(i = 5)
# find & update ranges from each level that cover i = 5
L[0]: 0..8
L[3]: 4..6
L[4]: 5..6
```