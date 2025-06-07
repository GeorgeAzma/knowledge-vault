$z\sim\mathcal{N}(\mu, \sigma^2)$ random samples have no gradient to backprop
so instead have $z=\mu+\sigma\cdot\epsilon$ where $\epsilon\sim\mathcal{N}(0,1)$
and learn $\mu,\sigma$ which do have gradients