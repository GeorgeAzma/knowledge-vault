---
aliases:
  - Function Inverse
  - Pre-Image
  - Function Co-Domain
  - Function Domain
  - Injective
  - Bijective
  - Surjective
---
maps input to output
### $f:X\rightarrow Y$
- $X$ domain `parameter`
- $Y$ co-domain `return type`
> [!example] `round()` is $f:\mathbb{R}\rightarrow\mathbb{Z}$
### Function Properties
##### Injective $\forall x_1,x_2\in X,f(x_1)=f(x_2)\implies x_1=x_2$ `different outputs => different input`
$f(x)=x^2$ `not injective, since f(-1) = f(1) but 1 != -1`
$f(x)=x+1$`injective`
##### Surjective $\forall y\in Y,\exists x\in X:f(x)=y$ `all possible outputs are used`
$f(x)=x^2$ `not surjective for integers, since possible outputs don't contain all integers {1, 2, 4, 9}`
$f(x)=x+1$ `surjective, all integers are mapped`
##### Bijective  $(\forall x_1,x_2\in X,f(x_1)=f(x_2)\implies x_1=x_2)\land(\forall y\in Y,\exists x\in X:f(x)=y)$ `injective + surjective`
Bijection count of sets $|A|=|B|=n$ is $n!$
![[Injective, Surjective, Bijective.svg|500]]
``` python
def is_injective(func):
    return set(func.values()) == func.values()  # No duplicates found, injective

def is_surjective(func, codomain):
	# Check if all codomain elements are mapped
    return len(set(func.values())) == len(set(codomain))

def is_bijective(func, codomain):
    return is_injective(func) and is_surjective(func, codomain)
```
### Inverse $f^{−1}(y)=\set{x\in X\mid f(x)\in y}$
Inverse functions are bijective $f^{-1}:\begin{cases}Y\rightarrow X\\ f(x)\mapsto x\end{cases}$

since function just maps input to output it can be written using a [[Set]]
$\text{square}(x)=\set{(x,x^2)|x\in \mathbb{R}}$
$\forall y\in Y\set{x\in X\mid f(x)=y}$
### Preimage
$f:X\rightarrow Y\land y\in Y$ then preimage of $y$ are elements $x\in X$ such that $f(x)=y$
> [!example] $f(x)=x^2$, then preimage of $4$ is $\pm2$ because $(\pm2)^2=4$
### Composition $(f\circ g)(x)=f(g(x))$
