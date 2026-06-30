on average how strongly does log-likelihood react to change in parameter
### $F(\theta)=\mathbb{E}\left[ss^T\right]$
- $s(x,\theta)=\nabla_\theta\log p(x\mid\theta)$ **score function** 
    - what % does probability change when changing parameter
    - $\log$ converts absolute probability change to percentage change compared to original value
##### Single Parameter $F(\theta)=\mathbb{E}\left[\left(\dfrac{\partial}{\partial\theta}\log p(x\mid\theta)\right)^2\right]$ 

- **Large** $F(\theta)$ tiny parameter changes produce large probability changes
- **Small** $F(\theta)$ parameter change barely affect probabilities
### Properties
- $F_\theta=F_\sigma(\dfrac{d\sigma}{d\theta})^2$
### Usecase
how to choose efficient parameter space for gradient descent based optimization
- imagine optimizing 10 gaussian splats  to minimize loss between original/reconstructed image
- loss depends on how much gaussian splats affect the pixels
- 1D gaussian splat is defined by $p(x\mid\sigma)=\dfrac{\exp(-\dfrac{x^2}{2\sigma^2})}{\sigma\sqrt{2\pi}}$
    - $\sigma$ scale `optimizable parameter`
    - $x$ pixel position $x\in[0;1]$
    - $\int p(x\mid\sigma)dx=1$ gaussian splat integrates to $1$
          meaning small splats are more opaque per pixel than big splats
- $\text{img}_\text{recon}(x)=\sum_ip(x\mid\sigma_i)$ all gaussian splats evaluated for each pixel to get reconstructed image 
- $\text{loss}=\sum_x(\text{image}(x)-\text{target}(x))^2$
- $\dfrac{d\text{loss}}{d\sigma_i}$ back-propagate loss for each parameter $\sigma_i$
    - so we need derivative of gaussian splat with respect to parameter $\sigma_i$ 
- $\sigma'=\sigma-\eta\cdot\nabla\text{loss}$ gradient descent update 
- suppose $\sigma_1=0.2,~~\sigma_2=1$ and both use $\eta=0.1$
- **Problem** changing $\sigma_1=0.2\to0.3$ is more dramatic than $\sigma_2=1\to1.1$
    - splat integrates to $1$, meaning opacity reduces as scale increases
    - $\sigma_2$ is already stretched, so opacity is lower
    - meaning increasing $\sigma_2$ by $0.1$ affects pixels/loss less than increasing $\sigma_1$ by $0.1$
- **Fisher Information** $F(\sigma)=\mathbb{E}[s^2]$
    - $s(x,\sigma)=\dfrac{\partial}{\partial\sigma}\log p(x\mid\sigma)$ **score function** % $x$ pixel changes when changing parameter $\sigma$
    - $\mathbb{E}[s^2]=\int p(x\mid\sigma)s(x,\sigma)^2dx$ average % change over all pixels
- distance between images is proportional to $(d\ell)^2\propto F(\sigma)(d\sigma)^2$
- meaning should be $\Delta\sigma\propto\dfrac{1}{\sqrt{F(\sigma)}}$ for equal sensitivity
- $\sigma'=\sigma-\eta F^{-1}\nabla\text{loss}$
- **Calculate Fisher Information For Splats** $F(\sigma)=\mathbb{E}[s^2]$
    - $s(x,\sigma)=\dfrac{\partial}{\partial\sigma}\log p(x\mid\sigma)=\dfrac{\partial}{\partial\sigma}\ln \dfrac{\exp(-\dfrac{x^2}{2\sigma^2})}{\sigma\sqrt{2\pi}}=-\dfrac{\partial}{\partial\sigma}(\dfrac{x^2}{2\sigma^2}+\ln {\sigma\sqrt{2\pi}})$
    - $s(x,\sigma)=-\dfrac{\partial}{\partial\sigma}(\dfrac{x^2}{2\sigma^2}+\ln {\sigma\sqrt{2\pi}})=-(-\dfrac{x^2}{\sigma^{3}}+\dfrac{1}{\sigma})=\dfrac{x^2-\sigma^2}{\sigma^3}$
    - $s^2=\dfrac{(x^2-\sigma^2)^2}{\sigma^6}=\dfrac{x^4-2x^2\sigma^2+\sigma^4}{\sigma^6}$
    - $F(\sigma)=\dfrac{1}{\sigma^6}\mathbb{E}[x^4-2x^2\sigma^2+\sigma^4]=\dfrac{1}{\sigma^6}(\mathbb{E}[x^4]-2\sigma^2\mathbb{E}[x^2]+\sigma^4)$
        - $\mathbb{E}[x^2]=\sigma^2$ because $x\sim\mathcal{N}(0,\sigma^2)$ and $\text{Var}(x)=\mathbb{E}[x^2]$ from [[Expectation|expactation algebra]]
        - $\mathbb{E}[x^4]=3\sigma^4$
            - $x\sim\mathcal{N}(0,\sigma^2)$ 
            - $x=\sigma z\implies x^4=\sigma^4z^4$ where $z\sim\mathcal{N}(0,1)$
            - $\mathbb{E}[x^4]=\mathbb{E}[\sigma^4z^4]=\sigma^4\mathbb{E}[z^4]$
            - $\mathbb{E}[z^4]=3$ because $\mathbb{E}[z^{2n}]=(2n-1)!!$
            - $\mathbb{E}[x^4]=3\sigma^4$
    - $F(\sigma)=\dfrac{1}{\sigma^6}(3\sigma^4-2\sigma^2\sigma^2+\sigma^4)=\dfrac{2}{\sigma^2}$
- we want changing $\sigma$ parameter to change image probability and hence the loss by a constant amount 
- find $\theta=\phi(\sigma)$ such that $F_\theta=\text{const}$ then optimize $\theta$ with gradient descent
- $F_\theta=F_\sigma\left(\dfrac{d\sigma}{d\theta}\right)^2=\text{const}$
    - $F_\theta=\dfrac{2}{\sigma^2}\left(\dfrac{d\sigma}{d\theta}\right)^2=1$
    - $\left(\dfrac{d\sigma}{d\theta}\right)^2=\dfrac{\sigma^2}{2}$
    -  $\dfrac{d\sigma}{d\theta}=\dfrac{\sigma}{\sqrt{2}}$
    - $\displaystyle\int\dfrac{d\sigma}{\sigma}=\int\dfrac{d\theta}{\sqrt{2}}$
- $\theta=\sqrt2\ln\sigma$
- $\theta=\ln\sigma$ remove $\sqrt{2}$ since gradient descent doesn't care about absolute scale of the parameters
- optimize $\theta$ and convert it to actual scale at the end $\sigma=e^\theta$
