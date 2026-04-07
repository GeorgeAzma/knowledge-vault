for approximating [[Probability Mass Function|PMF]] $P(X=k)$ using [[Probability Density Function|PDF]] $P(k-0.5<Y<k+0.5)$
> [!example]
> $Y\sim\mathcal{N}(\mu,\sigma^2)$
> $P(X=k)=\Phi(\dfrac{k+0.5-\mu}{\sigma})-\Phi(\dfrac{k-0.5-\mu}{\sigma})$
> $P(X<k)=\Phi(\dfrac{k-0.5-\mu}{\sigma})$
> $P(X\leq k)=\Phi(\dfrac{k+0.5-\mu}{\sigma})$
