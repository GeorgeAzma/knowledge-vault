``` python
 AE: x =>         z            => x̂
VAE: x => µ, σ => z ∼ 𝒩(µ, σ) => x̂

class VAE:
    def __init__(self, in_dim=768, latent_dim=256, hidden_dim=512):
        self.in_dim = in_dim
        self.latent_dim = latent_dim
        self.hidden_dim = hidden_dim

        self.encoder = nn.Sequential(
            nn.Linear(self.in_dim, self.hidden_dim),
            nn.ReLU(),
            nn.Linear(self.hidden_dim, self.hidden_dim),
            nn.ReLU(),
            nn.Linear(
                self.hidden_dim, self.latent_dim * 2
            ),  # µ, ln σ² (for stability)
        )

        self.decoder = nn.Sequential(
            nn.Linear(self.latent_dim, self.hidden_dim),
            nn.ReLU(),
            nn.Linear(self.hidden_dim, self.hidden_dim),
            nn.ReLU(),
            nn.Linear(self.hidden_dim, self.in_dim)
        )

    def encode(self, x):
        h = self.encoder(x)
        mu, logvar = h.chunk(2, dim=-1)
        return mu, logvar

    def reparameterize(self, mu, logvar):
        std = torch.exp(0.5 * logvar)
        eps = torch.randn_like(std)
        return mu + eps * std

    def decode(self, z):
        return self.decoder(z)

    def forward(self, x):
        mu, logvar = self.encode(x)
        z = self.reparameterize(mu, logvar)
        x_hat = self.decode(z)
        return x_hat, mu, logvar
    
    def loss(self, x_hat, x, mu, logvar, beta=0.01):
        recon_loss = F.mse_loss(x_hat, x, reduction='sum')
        # keep distributions close to N(0,1)
        # so that sampling latents from z ~ N(0,1) gives meaningful generations
        kl_div = -0.5 * torch.sum(1 + logvar - mu.pow(2) - logvar.exp())
        return recon_loss + beta * kl_div
```
### How It Works
youtu.be/laaBLUxJUMY
##### Encoder 
- outputs $\mu_\phi,\log\sigma_\phi^2$ per latent, where $\phi$ is encoder parameters.
  used to parametize [[Normal Distribution|Gaussian]] $q_\phi(z\mid x)=\mathcal{N}(\mu_\phi(x),\sigma_\phi^2(x))\approx P(z\mid x)$ 
- latent $z\sim q_\phi(z\mid x)$ is sampled using [[Reparameterization Trick]]  
  $z=\mu_\phi(x)+\sigma_\phi(x)\cdot\epsilon$ where $\epsilon\sim\mathcal{N}(0,1)$
##### Decoder
- Takes in $z$ and predicts image pixels $P_\theta(x\mid z)\sim\mathcal{N}(x;\mu_\theta(z),I)$
  by outputing image pixels $\mu_\theta(z)$, so $P_\theta(x\mid z)\propto\exp(-\large\frac{||x-\mu_\theta(z)||^2}{2})$
  so closer predicted image pixels $\mu_\theta(z)$ is to actual image pixels $x$
  higher the probability $P_\theta(x\mid z)$, if we take $-2\ln(P_\theta(x\mid z))=||x-\mu_\theta(z)||^2$
  we get MSE loss. $\theta$ is decoder parameters
- **Loss** $\mathcal{L}(\theta,\phi;x)=D_{KL}[P_\theta(x)||P(x)]+D_{KL}[q_\phi(z|x)||P(z)]$ how much image distribution and approximated image distribution differ
  calculated using [[KL Divergence]] $D_{KL}[P(x)||P_\theta(x)]=\sum_x^\text{states}P(x)\log\frac{P(x)}{P_\theta(x)}$
  where $x$ is all possible pixel states. this is not computable
    - so lets simplify  $D_{KL}[P(x)||P_\theta(x)]=\sum_x^\text{states}P(x)\log P(x)-\sum_x^\text{states}P(x)\log P_\theta(x)$
    - $\sum_x^\text{states}P(x)\log P(x)$ is [[Entropy]], it does not depend on $P_\theta$
    - since [[Entropy]] is a constant not affecting the loss, we remove it
    - $D_{KL}[P(x),P_\theta(x)]=-\sum_x^\text{states}P(x)\log P_\theta(x)$
    - intuitively when $P(x)$ is high $P_\theta(x)$ should also be high for minimum sum
    - **problem** we don't know true image distribution probability $P(x)$
    - but that's ok, because images with higher probability $P(x)$ 
      is over-represented in our dataset, which means by averaging loss 
      of all the images in dataset, we get approximation of $P(x)$, so
      $-\sum_x^\text{states}P(x)\log P_\theta(x)\approx\mathbb{E}_{x\sim P(x)}[-\log P_\theta(x)]\approx-\frac{1}{N}\sum_{x_k}^\text{dataset}\log P_\theta(x_k)$
    - so for each sample, loss is $-\log P_\theta(x_k)$
### [[ELBO Loss]]
