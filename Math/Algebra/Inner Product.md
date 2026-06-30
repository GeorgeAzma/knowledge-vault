### Satisfies
1. **Linearity** $\braket{x+a,y}=\braket{x,y}+\braket{a,y}$
2. **Conjugate Symmetry** $\braket{x,y}=\overline{\braket{y,x}}$
3. **[[Positive Definite Matrix|Positive Definite]]** $\braket{x,x}\geq0,\quad\braket{x,x}=0\iff x=0$
- **Cauchy-Schwarz** $|\braket{u,v}|\leq||u||||v||$ `follows from 1-3`
##### Property $(Ax,x)=(x,A^*x)$ 
- $(Ax,x)$ [[Inner Product]] of $x$ vector transposed by $A$ matrix
- $A^*$ is [[Adjoint]] [[Matrix]]
### Examples
- [[Dot Product]]
- $\int_a^b f(x)g(x)dx$
- $\braket{a,b}=x^TAy$ inner product of two vectors in basis of $A$
    - $A$ [[Symmetric Matrix|Symmetric]] [[Positive Definite Matrix]]
        - symmetric to satisfy `2. conjugate symmetry` (keep $a\to b=b\to a$ distances symmetric)
        - positive definite to satisfy `3. positive definite` $\braket{Ax,Ay}\geq0$
### Coolness
If all above properties are satisfied, these will work
- $\braket{a,b}=0$ orthogonal, even works for $\int_a^b f(x)g(x)dx$
- $\arccos\dfrac{\braket{a,b}}{||a||||b||}=\theta$
