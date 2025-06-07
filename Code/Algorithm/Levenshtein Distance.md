Number that tells you how different two strings are
### How It Works
It measures number of edits required to modify A to match B.
Add/Delete/Replace are considered edits.
### Formula
- $a,b$ strings
- $i,j$ substr sizes
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
### Code
``` rust
fn levenshtein_distance(a: &str, b: &str) -> usize {
    if a.is_empty() {
        return b.len();
    }
    if b.is_empty() {
        return a.len();
    }
    let mut prev_row: Vec<usize> = (0..=a.len()).collect();
    let mut curr_row = vec![0; a.len() + 1];
    for j in 1..=b.len() {
        curr_row[0] = j;
        for i in 1..=a.len() {
            let cost = if a[i - 1..i] == b[j - 1..j] { 0 } else { 1 };
            curr_row[i] = std::cmp::min(
                std::cmp::min(curr_row[i - 1], prev_row[i]) + 1,
                prev_row[i - 1] + cost,
            );
        }
        std::mem::swap(&mut prev_row, &mut curr_row);
    }
    prev_row[a.len()]
}
```
#### Resources
- medium.com/@ethannam/understanding-the-levenshtein-distance-equation-for-beginners-c4285a5604f0
