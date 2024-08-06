Number that tells you how different two strings are
### How it works:
It measures number of edits required to modify A to match B.
Add/Delete/Replace are considered edits.
### Formula:
- $a,b=\text{1st and 2nd string}$
- $i,j=\text{Substring size of 1st and 2nd string}$
$$
lev_{a,b}(i,j)=\left\{
        \begin{array}{l}
            \max(i,j) & \quad \min(i,j)=0 \\
            \min\left\{
	            \begin{array}{l}
	            lev_{a,b}(i-1,j)+1 \\
	            lev_{a,b}(i,j-1)+1 \\
	            lev_{a,b}(i-1,j-1)+1_{(a_i \neq b_j)}
		        \end{array}
		    \right. & \quad otherwise
        \end{array}
    \right.
$$
 ![[Levenshtein.webp]]
### Code:
```Rust
fn levenshtein_distance(a: &str, b: &str) -> usize {
    if a.is_empty() {
        return b.len();
    }
    if b.is_empty() {
        return a.len();
    }
    
    let a = a.chars().collect::<Vec<_>>();
    let b = b.chars().collect::<Vec<_>>();
    
    let mut mat = vec![vec![0; a.len() + 1]; b.len() + 1];

    for i in 1.=word1_length { mat[0][i] = i; }
    for j in 1.=word2_length { mat[j][0] = j; }

    for j in 1.=b.len() {
        for i in 1.=a.len() {
            let x: usize = if a[i-1] == b[j-1] {
                mat[j-1][i-1]
            } else {
                1 + std::cmp::min(std::cmp::min(mat[j][i-1], mat[j-1][i]), mat[j-1][i-1])
            };
            mat[j][i] = x;
        }
    }
	mat[b.len()][a.len()]
}
```
#### Resources:
- medium.com/@ethannam/understanding-the-levenshtein-distance-equation-for-beginners-c4285a5604f0
