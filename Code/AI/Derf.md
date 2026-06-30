**Dynamic [[Error Function|Erf]]** based [[Normalization]], similar to [[RMSNorm]] which tends to produce S-like curve
Derf leverages this and uses $\text{erf}$ function which has S shape curve — similar to Tanh — but Erf seems to work better, probably because it's related to [[Normal Distribution]] and can be used to generate uniform distributions from normally distributed random samples.

https://youtu.be/JHl_gwVoh-k

``` python
# init_a = 0.3 seems to be near linear, interfering less during initial training
class Derf(nn.Module):
    def __init__(self, channels, init_alpha=0.3):
        super().__init__()
        self.alpha = nn.Parameter(torch.ones(channels) * init_alpha)
        self.gamma = nn.Parameter(torch.ones(channels))
        self.beta = nn.Parameter(torch.zeros(channels))
        self.s = nn.Parameter(torch.zeros(channels))
        
    def forward(self, x):
        return self.gamma * torch.erf(self.alpha * x + self.s) + self.beta


class Derf2d(nn.Module):
    def __init__(self, channels, init_alpha=0.3):
        super().__init__()
        # per-channel learnable scalars, broadcast over H, W
        self.alpha = nn.Parameter(torch.ones(1, channels, 1, 1) * init_alpha)
        self.gamma = nn.Parameter(torch.ones(1, channels, 1, 1))
        self.beta = nn.Parameter(torch.zeros(1, channels, 1, 1))
        self.s = nn.Parameter(torch.zeros(1, channels, 1, 1))

    def forward(self, x):
        return self.gamma * torch.erf(self.alpha * x + self.s) + self.beta
```
