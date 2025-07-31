[[z-test|z-score]] generalization for [[Matrix]]
### Formula $D_m(x)=\sqrt{(x-\mu)^T\Sigma^{-1}(x-\mu)}$
- $\Sigma$ [[Covariance Matrix]]

**Intuition** similar to [[z-test|z-score]] $z=\large\frac{x-\mu}{\sigma}$ 
- $(x-\mu)^T\Sigma^{-1}$ is like $\large\frac{x-\mu}{\sigma^2}$
- multiplying by $(x-\mu)$ gives $\large\frac{(x-\mu)^2}{\sigma^2}$
- and $\text{sqrt}$ gives $D_m(x)=\large\frac{x-\mu}{\sigma}$