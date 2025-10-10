### How It Works
- [[Patch Embedding]]
- [[Positional Encoding]]
- [[GPT|Transformer Layers]] for [[Self Attention|attention]] and relationships between patches
- in this case [[Variational Auto-Encoder]]
``` python
from torch.nn import TransformerEncoder, TransformerEncoderLayer

# Encodes image as embeddings
class ViTEncoder(nn.Module):
    def __init__(self, img_size=64, patch_size=8, in_channels=3, embed_dim=512, depth=6, n_heads=8, latent_dim=256):
        super().__init__()
        self.patch_size = patch_size
        self.num_patches = (img_size // patch_size) ** 2
        self.embed_dim = embed_dim

        self.patch_embed = nn.Conv2d(in_channels, embed_dim, kernel_size=patch_size, stride=patch_size)
        self.pos_embed = nn.Parameter(torch.randn(1, self.num_patches, embed_dim))
        
        encoder_layer = TransformerEncoderLayer(d_model=embed_dim, nhead=n_heads, dim_feedforward=embed_dim*4, activation="gelu")
        self.transformer = TransformerEncoder(encoder_layer, num_layers=depth)

        self.fc_mu = nn.Linear(embed_dim, latent_dim)
        self.fc_logvar = nn.Linear(embed_dim, latent_dim)

    def forward(self, x):
        x = self.patch_embed(x)           # (B, embed_dim, H/P, W/P)
        x = x.flatten(2).transpose(1, 2)  # (B, N, embed_dim)
        x = x + self.pos_embed            # (B, N, embed_dim)
        x = self.transformer(x)           # (B, N, embed_dim)
        # global average pooling over tokens/patches
        # converts patch embeddings to final image embedding via sum
        x = x.mean(dim=1)
        mu = self.fc_mu(x)
        log_var = self.fc_logvar(x)
        return mu, log_var
```
