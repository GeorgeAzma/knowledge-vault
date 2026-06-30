Weighted average over probability distribution.
expected value for random samples from probability distribution, or their long-run average.
### Formula $\mathbb{E}(X)=\sum xp(x)$
- $p(x)$ [[Probability Mass Function]] of $X$
- $\mathbb{E}(X)=\mu_X$ [[Mean]]
- $\mathbb{E}(f(X))=\int_{-\infty}^{\infty}f(x)p(x)dx$
- $\sqrt{\mathbb{E}[(X-\mu)^2]}=\sqrt{\int_{-\infty}^{\infty}(x-\mu_X)^2p(x)dx}=\sigma_X$ where $p(x)$ [[Normal Distribution]] [[Probability Density Function|PDF]]
- $\mathbb{E}[aX+b]=a\mathbb{E}[X]+b$
- $\mathbb{E}[X+Y]=\mathbb{E}[X]+\mathbb{E}[Y]$
- $\mathbb{E}[f(x)]\geq f(\mathbb{E}(x))$ `jensen's inequality for convex function`
- $\mathbb{E}[f(x)]\leq f(\mathbb{E}(x))$ `jensen's inequality for concave function`
- $\mathbb{E}[x^{2n}]=(2n-1)!!\sigma^{2n}$ where $x\sim\mathcal{N}(0,\sigma^2)$
##### [[Variance]]/[[Covariance]] Expectation Formulas
- $\text{Var}(c)=0$
- $\text{Var}(c\pm X)=\text{Var}(X)$
- $\text{Var}(X)=\mathbb{E}[X^2]-\mathbb{E}[X]^2$
- $\text{cov}(X,Y)=\mathbb{E}(XY)-\mu_X\mu_Y$ [[Covariance]]
