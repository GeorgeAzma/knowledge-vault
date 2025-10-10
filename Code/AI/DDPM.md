Denoising Diffusion Probabilistic Models
``` python
class DDPM:
    def __init__(self, steps=1000, beta_start=0.0001, beta_end=0.02):
        self.steps = steps
        self.beta_start = beta_start
        self.beta_end = beta_end
        self.betas = self.linear_beta_schedule() # amount of noise to add this step
        self.alphas = 1 - self.betas # what remains from previous step this step
        self.alpha_bar = torch.cumprod(self.alphas, dim=-1) # what remains of original image

    def linear_beta_schedule(self):
        return torch.linspace(self.beta_start, self.beta_end, self.steps)
    
    def add_noise(self, image, timesteps):
        device = image.device
        noise = torch.randn_like(image)
        alpha_bar_t = self.alpha_bar[timesteps, None, None, None].to(device)
        noised = image * alpha_bar_t.sqrt() + (1 - alpha_bar_t).sqrt() * noise
        return noised
    
    def remove_noise(self, image, timesteps, pred_noise):
        device = image.device
        alpha_t = self.alphas[timesteps, None, None, None].to(device)
        beta_t = self.betas[timesteps, None, None, None].to(device)
        alpha_bar_t = self.alpha_bar[timesteps, None, None, None].to(device)
        alpha_bar_t_prev = self.alpha_bar[timesteps - 1, None, None, None].to(device)
        alpha_bar_t_prev[timesteps == 0] = 1

        recip_sqrt_alpha_t = 1 / alpha_t.sqrt()
        noise_coef = beta_t / (1 - alpha_bar_t).sqrt()
        z = torch.randn_like(image)
        sigma_t = (beta_t * (1 - alpha_bar_t_prev) / (1 - alpha_bar_t)).sqrt()
        mean = recip_sqrt_alpha_t * (image - noise_coef * pred_noise)
        denoised = mean + sigma_t * z
        return denoised
```
### Forward Noise $q(x_t\mid x_0)=\sqrt{\bar\alpha_t}\cdot x_0+\sqrt{1-\bar\alpha_t}\cdot\epsilon$
- $x_0\sim\mathcal{N}(\mu,1)$ original image `assume gaussian`
- $x_t$ noisy image
- $\beta_t$ how much noise to add at timestep $t$
- $q(x_t\mid x_0)$ calculates noisy image given original image
- $\bar\alpha_t$ preserved image after $t$ timesteps
- $\epsilon$ noise
### Reverse Noise $p(x_{t-1}\mid x_t)=\frac{1}{\sqrt{\alpha_t}}(x_t-\frac{1-\alpha_t}{\sqrt{1-\bar\alpha_t}}\epsilon_\theta(x_t,t))+\sigma_tz$
- $p(x_{t-1}\mid x_t)$ calculates one step denoised image given noisy image
- $\alpha_t=1-\beta_t$ preserved image amount at timestep $t$
- $\bar\alpha_t$ original image amount after $t$ timesteps
- $\epsilon_\theta$ predicted noise, using model parameters $\theta$
- $\sigma_t^2=\beta_t$ random noise amount
- $z\sim N(0,I)$ [[Normal Distribution]]
### Derivation
youtu.be/dSC9XOPJXK8?t=797
##### 1. Adding Noise Step
**key ideas** 
1. add noise while keeping $\text{var}=1$
2. noise variance is given by variance scheduler
- $\gamma(t)=\beta_t$ variance scheduler `determines added noise variance`
- $\epsilon\sim\mathcal{N}(0,1)$ `added noise`
- $\text{var}(x_{t-1}a+\epsilon b)=1$ `variance should stay 1, to avoid explosion`
- $\text{var}(x_{t-1}a)+\text{var}(\epsilon b)=1$
- $\text{var}(\epsilon b)=\beta_t$, to satisfy variance scheduler
- so $b^2\text{var}(\epsilon)=\beta_t\implies b^2\cdot1=\beta_t\implies b=\sqrt{\beta_t}$
- $\text{var}(x_{t-1}a)+\text{var}(\epsilon \sqrt{\beta_t})=1$
- $a^2\text{var}(x_{t-1})+\beta_t\text{var}(\epsilon)=1$
- $a^2\cdot1+\beta_t\cdot1=1$
- $a^2=1-\beta_t\implies a=\sqrt{1-\beta_t}$
- **Finally**  $q(x_t\mid x_{t-1})=x_{t-1}\sqrt{1-\beta_t}+\epsilon\sqrt{\beta_t}$ `total variance stays 1`
- $q(x_t\mid x_{t-1})=\mathcal{N}(x_{t-1}\sqrt{1-\beta_t},\beta_t)$
##### 2. Add Multiple Steps of Noise at Once
- $\alpha_t=1-\beta_t$ `amount of original image to keep this step`
- $\bar{\alpha}_t=\prod^t\alpha_t$ `amount of original image left this step` 
- given  $q(x_t\mid x_{t-1})=x_{t-1}\sqrt{1-\beta_t}+\epsilon\sqrt{\beta_t}$ from step $1.$
- we want to remove $x_{t-1}$ using recursive substition
- $q(x_t\mid x_{t-2})=\sqrt{1-\beta_t}(x_{t-2}\sqrt{1-\beta_{t-1}}+\epsilon\sqrt{\beta_{t-1}})+\sqrt{\beta_t}\epsilon$
- rewrite using $a_t$, so $q(x_t\mid x_{t-2})=\sqrt{\alpha_t}(x_{t-2}\sqrt{\alpha_{t-1}}+\epsilon\sqrt{1-\alpha_{t-1}})+\sqrt{1-\alpha_t}\epsilon$
- $q(x_t\mid x_{t-2})=\sqrt{\alpha_t}\sqrt{\alpha_{t-1}}x_{t-2}+\sqrt{\alpha_t}\sqrt{1-\alpha_{t-1}}\epsilon+\sqrt{1-\alpha_t}\epsilon$ `simplified`
- $\text{var}(\sqrt{\alpha_t}\sqrt{1-\alpha_{t-1}}\epsilon+\sqrt{1-\alpha_t}\epsilon)=\alpha_t(1-\alpha_{t-1})+1-\alpha_t$
- $=\alpha_t-\alpha_t\alpha_{t-1}+1-\alpha_t=1-\alpha_t\alpha_{t-1}$
- $q(x_t\mid x_{t-2})=\sqrt{a_t}\sqrt{a_{t-1}}x_{t-2}+\sqrt{1-\alpha_t\alpha_{t-1}}\epsilon$ `used variance for epsilon`
- recursively extend pattern $q(x_t\mid x_{0})=\sqrt{a_t}\sqrt{a_{t-1}}\sqrt{a_{t-2}}\dots x_{0}+\sqrt{1-\alpha_t\alpha_{t-1}\alpha_{t-2}}\epsilon$
- **Finally** $q(x_t\mid x_{0})=\sqrt{\bar{\alpha}_t}x_{0}+\sqrt{1-\bar{\alpha}_t}\epsilon$, rewrote using $\bar{\alpha}$
- $q(x_t\mid x_0)=\mathcal{N}(x_0\sqrt{\bar{\alpha}_t},(1-\bar{\alpha}_t)I)$ `I is identity (for matrices)`
##### 3. Reverse Noise
- $q(x_{t-1}\mid x_t)=\int_{x_0} q(x_{t-1},x_0\mid x_t)dx_0$ [[Joint, Marginal, Conditional Distribution|Marginalized]]
- solving above integral is impossible
- $q(x_{t-1}\mid x_t,x_0)=q(x_t\mid x_{t-1},x_0)\large\frac{q(x_{t-1}\mid x_0)}{q(x_t\mid x_0)}$ rewrite using [[Bayes' Theorem|Base Rule]]
- $q(x_t\mid x_0)=\mathcal{N}(x_0\sqrt{\bar{\alpha}_t},(1-\bar{\alpha}_t)I)$ using formula from $2.$
- $q(x_{t-1}\mid x_0)=\mathcal{N}(x_0\sqrt{\bar{\alpha}_{t-1}},(1-\bar{\alpha}_{t-1})I)$ same here
- $q(x_t\mid x_{t-1})=\mathcal{N}(x_{t-1}\sqrt{\alpha_t},\beta_t)$ using formula from $1.$
- $q(x_t\mid x_{t-1})\large\frac{q(x_{t-1}\mid x_0)}{q(x_{t}\mid x_0)}={\normalsize\mathcal{N}(x_{t-1}\sqrt{\alpha_t},\beta_t)}\frac{\mathcal{N}(x_0\sqrt{\bar{\alpha}_{t-1}},(1-\bar{\alpha}_{t-1})I)}{\mathcal{N}(x_0\sqrt{\bar{\alpha}_{t}},(1-\bar{\alpha}_{t})I)}$
- convert to [[Normal Distribution]] and simplify shit-ton
- $q(x_{t-1}\mid x_t,x_0)=\mathcal{N}(\mu_t,\tilde{\beta}_t)=\mathcal{N}({\large\frac{1}{\sqrt{\alpha_t}}}[x_t-{\large\frac{1-\alpha_t}{\sqrt{1-\bar{\alpha}_t}}}\epsilon],\ {\large\frac{1-\bar{\alpha}_{t-1}}{1-\bar{\alpha}_t}}\beta_t)$
- $\epsilon=\epsilon_\theta(x_t,t)$ where $\epsilon_\theta$ is noise predictor model with parameters $\theta$
- $x_{t-1}=\frac{1}{\sqrt{a_t}}(x_t-\frac{1-\alpha_t}{\sqrt{1-\bar{\alpha}_t}}\epsilon_\theta(x_t,t))+\sigma_tz$ where $\sigma_t=\sqrt{\frac{1-\bar{\alpha}_{t-1}}{1-\bar{\alpha}_t}\beta_t}$ and $z\sim\mathcal{N}(0,1)$
