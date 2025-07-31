``` python
# input token embeddings
input = word_embed(word_idx) + pos_embed(pos_idx)
input.shape = (ctx_len, d_model)

kw.shape = (d_vocab, d_k)
qw.shape = (d_vocab, d_k)
vw.shape = (d_vocab, d_v) # often d_v == d_k
# kqv = nn.Linear(d_vocab, d_k * 2 + d_v, bias=False)

k.shape = (ctx_len, d_k)
v.shape = (ctx_len, d_k)
q.shape = (ctx_len, d_v)

for i in range(ctx_len):
    k[i] = input[i, :] @ kw # + k_bias (optional) 
    q[i] = input[i, :] @ qw # + q_bias (optional) 
    v[i] = input[i, :] @ vw # + v_bias (optional) 
    # k[i], q[i], v[i] = torch.split(kqv(input[i, :]), [d_k, d_k, d_v], dim=-1)

# for each input compute attention score towards other inputs 
score.shape = (ctx_len, ctx_len)
for i in range(ctx_len):
    for j in range(ctx_len):
        score[i, j] = q[i] @ k[i] # @ = dot() for 1D

attn_weights = torch.softmax(score / d_k ** 0.5, dim=1) # optional scaling
out = attn_weights @ v # (ctx_len, ctx_len) @ (ctx_len, d_v) → (ctx_len, d_v)
```

![[Self Attention.webp]]
