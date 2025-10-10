``` python
# F.silu() = x * sigmoid(x)

# params = dim * hidden_dim * 3
def SwiGLU(x):
    x = nn.Linear(dim, 2 * hidden_dim)(x)  # output is [x1, x2]
    x1, x2 = x.chunk(2, dim=-1)            # split into two halves
    x = SiLU(x1) * x2                      # gated activation
    x = nn.Linear(hidden_dim, dim)(x)      # reshape back

# params = dim * hidden_dim * 2
def FFN(x):
    x = nn.Linear(dim, hidden_dim)(x)
    x = nn.ReLU(x)
    x = nn.Linear(hidden_dim, dim)(x)
```
