``` python
 AE: x -> z -> x̂
VAE: x -> 𝒩(x; µ, σ) -> z ∼ 𝒩 -> x̂
```
- **AE** 
    - transform input to latents
    - reconstruct output via latents deterministically
- **VAE** 
    - transforms input to $\mu,\sigma$
    - calculate latents with those using [[Reparameterization Trick]] 
      $z=\mu+\sigma\cdot\epsilon$ where $\epsilon\sim\mathcal{N}(0,1)$
    - reconstruct output via latents probabilistically
``` python
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
    
    def loss_function(self, x_hat, x, mu, logvar):
        recon_loss = F.mse_loss(x_hat, x, reduction='sum')
        # keep distributions close to N(0,1)
        # so that sampling latents from z ~ N(0,1) gives meaningful generations
        kl_div = -0.5 * torch.sum(1 + logvar - mu.pow(2) - logvar.exp())
        return recon_loss + kl_div
```