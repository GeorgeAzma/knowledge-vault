``` rust
// Pseudo code for simplicity (rust sucks with loops like these)
// for pow 2 elements
for (k = 2; k <= n; k *= 2)
	for (j = k / 2; j > 0; j /= 2)
		for (i = 0; i < n; i++)
            l = i ^ j;
			if i > l {
				continue;
			}
	        if i & k == 0 && arr[i] > arr[l] || 
	           i & k != 0 && arr[i] < arr[l] {
                    arr[i].swap(arr[l])
            }
```
![[Bitonic Sort.webp]]
