Denoising Diffusion Implicit Models
[[DDPM Scheduler]] trained on 1000 steps needs to diffuse 1000 steps 
[[DDIM Scheduler]] can do it in 50 steps
### Forward Noise
### Reverse Noise $p(x^{t-1}\mid x_t)=\sqrt{\bar\alpha_t-1}\cdot x_0+\sqrt{1-\bar\alpha_{t-1}-\sigma_t^2}\cdot\epsilon_\theta+\sigma_t\cdot z$
- $p(x^{t-1}\mid x_t)$ calculates one step denoised image given noisy image
- $\beta_t$ how much noise to add at timestep $t$
- $\alpha_t=1-\beta_t$ preserved image amount at timestep $t$
- $\bar\alpha_t$ original image amount after $t$ timesteps
- $\epsilon_\theta$ predicted noise, using model parameters $\theta$
- $\sigma_t=\eta^2\cdot{\huge\frac{1-\bar\alpha_{t-1}}{1-\alpha_t}}\cdot(1-{\huge\frac{\bar\alpha_t}{\bar\alpha_{t-1}}})$ random noise amount
- $\eta$ noise amount `often 0 or 1, where 1 is like DDPM`
- $z\sim N(0,I)$ [[Normal Distribution]]