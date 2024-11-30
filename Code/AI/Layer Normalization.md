Normalizes [[Mean]] and [[Variance]] for neurons in a layer
Also applies learnable scale and shift parameters
``` python
mean = np.mean(neurons, axis=-1, keepdims=True) # neuron values are last dim
variance = np.var(neurons, axis=-1, keepdims=True) # keepdims for passing to next layer
eps = 1e-8
neurons = (neurons - mean) / sqrt(variance + eps)
neurons = gamma * neurons + beta # modify via learnable params
# for transformers neurons are word embeddings

# Example: transformer input token embeddings
toks = [ # seq_len = 3, d_model = 4
[1.0, 2.0, 3.0, 4.0], # token 1
[2.0, 3.0, 4.0, 5.0], # token 2
[1.5, 2.5, 3.5, 4.5]  # token 3
]
tok_means[0] = (1 + 2 + 3 + 4) / 4 = 2.5
tok_vars[0] = ((1-2.5)^2 + (2-2.5)^2 + (3-2.5)^2 + (4-2.5)^2) / 4 = 1.25
toks[0] = (toks[0] - tok_means[0]) / tok_vars[0]
toks[0] = gamma[0] * toks[0] + beta[0]
# do for all tokens in sequence
```
![[Layer Normalization.webp]]
