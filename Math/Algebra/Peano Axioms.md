### Axioms
Accepted truths with no proofs, used for proving other hypothesis
1. $0$ is natural number $\mathbb{N}$
2. If $x\in\mathbb{N}$ then $x=x$ `equality is reflexive`
3. If $x=y$ then $y=x$ `equality is symmetric`
4. If $x=y$ and $y=z$ then $x=z$ `equality is transitive`
5. If $y\in\mathbb{N}$ and $x=y$ then $x\in\mathbb{N}$ also `closed under equality`
6. If $x\in\mathbb{N}$ then $S(x)\in\mathbb{N}$ `closed under S`
	`S is successor function, or counter S(n)=n+1`
7. If $x\in\mathbb{N}$ and $y\in\mathbb{N}$  and $S(x)=S(y)$ then $x=y$ `S is injection`
8. If $x\in\mathbb{N}$ then $S(x)\neq0$
9. $0\in K$ and $n\in K\rightarrow S(n)\in K$ then $K=\mathbb{N}$
### Addition
maps 2 natural numbers to another one
defined recursively like this
1. $x+0=x$
2. $x+S(y)=S(x+y)$
> [!example] $x+3$
> $x+0=x$ `using 1.`
> $x+1=x+S(0)=S(x+0)=S(x)$ `using 2.`
> $x+2=x+S(1)=S(x+1)=S(S(x))$ `using 2. and x+1=S(x)`
> $x+3=x+S(2)=S(x+2)=S(S(S(x)))$ `using 2. and x+2=S(S(x))`
### Multiplication
1. $x\cdot 0=0$
2. $x\cdot S(y)=x\cdot y+x$
> [!example]
> $x\cdot S(0)=x\cdot0+x=0+x=x$  `S(0) is right identity`
> `using 2. and also 1. from addition`
> Prove by [[Induction]] that $S(0)x=x$ `S(0) is left identity`
> show that if $S(0)x=x$ then $S(0)S(x)=S(x)$
> - **Base case** $S(0)x=S(0)0=0$ `using 1.`
> - **Inductive step** $S(0)S(0)=S(0)$
> $S(0)S(0)=S(0)0+S(0)$ `using 2.`
> $S(0)0+S(0)=0+S(0)=S(0+0)=S(0)$ `using 1.`
> so base case is true and $S(0)S(0)=S(0)$ is true
> which by [[Induction]] axiom shows that $S(0)$ is left identity 
### Exponentiation
1. $x^0=1$
2. $x^{S(y)}=x^y\cdot x$
