Denoising Diffusion Probabilistic Models
``` python
def DDPM(self, timesteps=1000, beta_start=0.0001, beta_end=0.02)
    self.betas = torch.linspace(beta_start, beta_end, timesteps)
    self.alphas = 1 - self.betas
    self.alpha_bars = torch.cumprod(self.alphas, dim=0)

# x_0: original image | t: timestep
def forward(self, x_0, t):
    a_bar_t = self.alpha_bars[t]
    eps = torch.randn_like(x_0)
    x_t = a_bar_t.sqrt() * x_0 + (1 - a_bar_t).sqrt() * eps

# x_t: noisy image | t: timestep
# eps_theta: denosing model with forward(x_t, t)
def reverse(self, x_t, t, eps_theta):
    a_t = self.alphas[t]
    a_bar_t = self.alpha_bars[t]
    beta_t = self.betas[t]

    eps = eps_theta(x_t, t) # predicted noise
    sigma_t = beta_t.sqrt()
    z = torch.randn_like(x_t)
    (x_t - (1 - a_t) / (1 - a_bar_t).sqrt() * eps) / a_t.sqrt() + sigma_t * z
```
### Forward Noise $q(x_t\mid x_0)=\sqrt{\bar\alpha_t}\cdot x_0+\sqrt{1-\bar\alpha_t}\cdot\epsilon$
- $x_0$ original image
- $x_t$ noisy image
- $\beta_t$ how much noise to add at timestep $t$
- $q(x_t\mid x_0)$ calculates noisy image given original image
- $\bar\alpha_t$ preserved image after $t$ timesteps
- $\epsilon$ noise
### Reverse Noise $p(x_{t-1}\mid x_t)=\frac{1}{\sqrt{\alpha_t}}(x_t-\frac{1-\alpha_t}{\sqrt{1-\bar\alpha_t}}\cdot\epsilon_\theta(x_t,t))+\sigma_tz$
- $p(x_{t-1}\mid x_t)$ calculates one step denoised image given noisy image
- $\alpha_t=1-\beta_t$ preserved image amount at timestep $t$
- $\bar\alpha_t$ original image amount after $t$ timesteps
- $\epsilon_\theta$ predicted noise, using model parameters $\theta$
- $\sigma_t^2=\beta_t$ random noise amount
- $z\sim N(0,I)$ [[Normal Distribution]]
