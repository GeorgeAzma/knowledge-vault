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
- **Injective** every $Y$ has atmost one $X$, meaning $\forall x_1,x_2\in X,f(x_1)=f(x_2)\implies x_1=x_2$
  `(student, id): (Alice, 1), (Bob, 2), (Charlie, 3)`
  `not surjective, because IDs, 4+ don't have X assigned`
- **Surjective** every $Y$ has atleast one $X$, meaning $\forall y\in Y,\exists x\in X:f(x)=y$
  `(student, grade): (Alice, A), (Bob, B), (Charlie, A)`
- **Bijective** injective + surjective
  $(\forall x_1,x_2\in X,f(x_1)=f(x_2)\implies x_1=x_2)\land(\forall y\in Y,\exists x\in X:f(x)=y)$
  `(user_id, user_name): (1, Alice), (2, Bob), (3, Charlie)`
  Bijection count of sets $|A|=|B|=n$ is $n!$
![[Injective, Surjective, Bijective.webp]]
``` python
def is_injective(func):
    return set(func.values()) == func.values()  # No duplicates found, injective

def is_surjective(func, codomain):
	# Check if all codomain elements are mapped
    return len(set(func.values())) == len(set(codomain))

def is_bijective(func, codomain):
    return is_injective(func) and is_surjective(func, codomain)

function = {1: 'a', 2: 'b'} 
codomain = ['a', 'b', 'c']
# Injective
 
function = {1: 'a', 2: 'b', 3: 'c'} 
codomain = ['a', 'b', 'c']
# Injective + Surjective = Bijective
			
function = {1: 'a', 2: 'b', 3: 'c', 4: 'c'} 
codomain = ['a', 'b', 'c']
# Surjective
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
