Algorithm for minimizing energy

Annealing is heating up metal so that it's more prone to deformation
allowing you to mold general shape then it gradually gets colder and harder
allowing you to fine tune the general shape
Stop when it gets cold or shape is good enough

Closer you are to your desired shape lower the energy $E$ is
So you want to minimize $E$:
- Start with high temperature $T$
- Hammer the metal (modify the data)
- If energy goes lower ($\Delta E<0$), keep the modification
- Else keep it if random number $r<\exp(-\large \frac{\Delta E}{T})$ where $r\in[0;1]$
- Decrease temperature $T=T\alpha$ where $\alpha<1$
- Stop when it gets cold $T<T_\epsilon$ or energy is low enough $E<E_\epsilon$
> [!note] Real formula is $Prob(E)\approx\exp(-\large \frac{E}{kT})$
> - It's called Boltzman Probability Distribution
>  - $k$ Boltzman Constant
>  It tells you probability of finding system in energy state $E$
>  based on the temperature

> [!tip] This is used for learning rate scheduling in machine learning
> where learning rate is high at first and it gradually lowers
> as model approaches optimal solution
