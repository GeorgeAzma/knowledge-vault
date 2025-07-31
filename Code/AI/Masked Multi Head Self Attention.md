Masked Multi Head Attention is same as [[Multi Head Self Attention]]
but you mask some attention scores using **attention mask** with
- **Causal Mask** mask future tokens, to avoid cheating `only used in decoder`
- **Padding Mask** mask padding tokens
tokens are masked by adding $-\infty$ mask to scores before [[Softmax]]
which makes their scores/probabilities $0$
``` python
attention(Q, K, V) = softmax(QK^T / sqrt(d_k) + mask) * V
mask = [[0, -∞, -∞, -∞],
        [0,  0, -∞, -∞],
        [0,  0,  0, -∞],
        [0,  0,  0,  0]]
```
