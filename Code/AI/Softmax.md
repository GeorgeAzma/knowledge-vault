Converts vector of output floats such that all values add up to $1$
And so that there is more dramatic difference between values
It is often used for classifier [[Neural Network]] outputs

``` rust
fn softmax(x: &[f32]) -> Vec<f32> {
    let max = x.iter().cloned().fold(f32::NEG_INFINITY, f32::max);
    let overflow_safe_exp_vals: Vec<f32> = x.into_iter().map(|v| (v - max).exp()).collect();
    let sum: f32 = overflow_safe_exp_vals.iter().sum();
    overflow_safe_exp_vals
        .into_iter()
        .map(|v| v / sum)
        .collect()
}
```

> [!note]
> - Softmax is soft version of Argmax
> - Argmax is basically the same as [[One Hot Encoding]] for the largest value in the vector
