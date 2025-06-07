Using [[Standard Deviation]]
``` rust
fn remove_outliers(data: &[f32], strength: f32) -> Vec<f32> {
    let mean = data.iter().sum::<f32>() / data.len() as f32;
    let stdev =
        (data.iter().map(|&x| (x - mean) * (x - mean)).sum::<f32>() / data.len() as f32).sqrt();
    data.iter()
        .filter(|&x| strength * (*x - mean).abs() <= stdev)
        .copied()
        .collect()
}
```
Using sort and trimming
``` rust
fn remove_outliers(data: &[f32], trim_percent: f32) -> Vec<f32> {
    let mut sorted = data.to_vec();
    sorted.sort_unstable_by(|a, b| a.partial_cmp(b).unwrap());
    let num_to_trim = (data.len() as f32 * trim_percent) as usize;
    sorted
        .drain(num_to_trim..sorted.len() - num_to_trim)
        .collect()
}
```
