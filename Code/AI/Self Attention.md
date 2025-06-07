``` python
# input token embeddings
input = word_embed(word_idx) + pos_embed(pos_idx)
input.shape = (ctx_len, d_model)

kw.shape = (d_vocab, d_k)
qw.shape = (d_vocab, d_k)
vw.shape = (d_vocab, d_v)
# kqvw = nn.Linear(d_vocab, d_k or d_v, bias=False)

k.shape = (ctx_len, d_k)
v.shape = (ctx_len, d_k)
q.shape = (ctx_len, d_v)

for i in range(ctx_len):
    k[i] = input[i, :] @ kw # can also add bias kb
    q[i] = input[i, :] @ qw # can also add bias qb
    v[i] = input[i, :] @ vw # can also add bias vb

# for each input compute attention score towards other inputs 
score.shape = (ctx_len, ctx_len)
for i in range(ctx_len):
    for j in range(ctx_len):
        score[i, j] = q[i] @ k[i] # @ = dot() for 1D

attn_weights = torch.softmax(score / d_k ** 0.5, dim=1) # division is optional
out = attn_weights @ v # (ctx_len, ctx_len) @ (ctx_len, d_v) → (ctx_len, d_v)
```

![[Self Attention.webp]]