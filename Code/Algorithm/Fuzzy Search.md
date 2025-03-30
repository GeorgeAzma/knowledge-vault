similar to obsidian search function
``` rust
fn fuzzy_score(match_str: &str, search_str: &str) -> usize {
    let mut score = 0;
    if match_str.is_empty() || search_str.is_empty() {
        return score;
    }
    let search_str = search_str.to_lowercase();
    let match_str = match_str.to_lowercase();
    let mut match_iter = match_str.chars();
    let mut last_match_pos = 0;
    while let Some(mut match_char) = match_iter.next() {
        for (i, search_char) in search_str.chars().skip(last_match_pos).enumerate() {
            if match_char == search_char {
                score += 1;
                last_match_pos = i;
                if let Some(c) = match_iter.next() {
                    match_char = c;
                } else {
                    break;
                }
            }
        }
    }
    score
}
```
``` rust
// Example
let match_str = "cumu Dis f";
for s in [
    "cum dis far", // 9
    "CUMULATIVE DISTRIBUTION FUNCTION", // 10
    "camera distro fun", // 8
    "came together for what", // 5
    "literally no match", // 1
    "dis", // 3
    "when", // 0
    "c u m d i s f a r", // 9
    "", // 0
] {
    println!(
        "{s}: {:.3}",
        fuzzy_score(match_str, s) as f32 / (s.len() as f32).sqrt().sqrt()
    );
}
```

> [!tip] account for word percent match
