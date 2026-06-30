Generate samples from a probability distribution that is difficult to directly sample from
### How It Works
- $\pi(x)$ target distribution `can be unnormalized`
- $q(x'\mid x)$ proposal distribution `proposes sample x' given x`
     `can be gaussian centered at x`
1. **Initial random sample** $x_0$ `use random gaussian or ~mode(pi(x))`
2. **New random sample** $x'\sim q(x'\mid x)$
3. **Move to new sample** if $u<\alpha$ where
- $u\sim U(0,1)$
- $\alpha(x,x')=\min(1,r)$ acceptance probability
    - $r=\dfrac{\pi(x')q(x\mid x')}{\pi(x)q(x'\mid x)}$ acceptance ratio
        - $\pi$ can be unnormalized since normalization cancels anyways
        - **Metropolis** `non-hastings` assumes symmetry $q(x\mid x')=q(x'\mid x)\implies r=\dfrac{\pi(x')}{\pi(x)}$
            - $\pi(x')\geq\pi(x)\implies r\geq1\implies\min(1,r)=1$ 
               `always accepts new sample if more probable`
4. repeat from `2` for $n\cdot d$ iterations, where $d$ is dimensionality
> [!example] Placing a tree randomly on a terrain
> You don't know terrain function to place tree directly, so instead
> - start at a random position $x$
> - move randomly to $x'$ `using gaussian kernel`
> - have a probability function $f(x)=\exp(-\text{SurfDist})$
> - move to $b$ using probability $f(b)/f(a)$
> - repeat
