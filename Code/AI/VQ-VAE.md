[[Variational Auto-Encoder]] with latents quantized using closest vector in codebook
``` python
# quantize latents
latents = encode(x)
closest = torch.argmin((latents - codebook)**2, dim=-1)
codes = codebook[closest]

# moves codes towards latents
codebook_loss = torch.mean((codes - latents.detach()) ** 2)
# moves latents towards codes
commitment_loss = torch.mean((codes.detach() - latents) ** 2)

# codes is unchanged, but codes.grad == latents.grad
# this skips codebook loss, since it's non-differenciable because of argmin
# instead we differenciate separatly as seen above
codes = z + (codes - z).detach()

recon = decode(codes)

return codes, recon, codebook_loss, commitment_loss

recon_loss = F.mse_loss(recon, target) # / data_variance
loss = recon_loss + codebook_loss + 0.25 * commitment_loss
```
- VQ-VAE has no [[KL Divergence|KL Divergence]] loss, since it simplifies to a constant

youtu.be/1mi2MSvigcc

**Residual VQ-VAE** uses multiple codebooks