![[Bitonic Sort.webp]]
Only works for power of $2$ elements
``` rust
// pseudo code
for (k = 2; k <= n; k *= 2) // log(n)
	for (j = k / 2; j > 0; j /= 2) // log(n)
		for i in 0..n // linear
            l = i ^ j;
	        if i <= l && (i & k == 0) == (arr[i] > arr[l]) {
                arr[i].swap(arr[l])
            }
// actual rust code
while k <= arr.len() {
    let mut j = k / 2;
    while j > 0 {
        for i in 0..arr.len() {
            let l = i ^ j;
            if i <= l && (i & k == 0) == (arr[i] > arr[l]) {
                arr.swap(i, l);
            }
        }
        j /= 2;
    }
    k *= 2;
}
```
