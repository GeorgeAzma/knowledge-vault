Evidence Lower Bound
used in [[Variational Auto-Encoder]] for making latents normally distributed 
$P(z\mid x)\sim\mathcal{N}(0,1)$ using [[Kullback-Leibler Divergence|KL Divergence]] between $P(z\mid x)$ and $\mathcal{N}(0,1)$, where $x$ is VAE input
- $D_{KL}(P||Q)=\sum_{x}P(x)\log(\dfrac{P(x)}{q(x)})=\sum_{x}P(x)(\log{P(x)}-\log{q(x)})$

**Derivation** youtu.be/jJZadDULoH4
