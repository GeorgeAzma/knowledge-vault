---
aliases:
  - Combination
  - Permutation
  - Power Set
---
> [!example] {3, 5, 6}
### Operators
- $\subset \subseteq$ Subset
- $\supset \supseteq$  Superset
- $\cup$ Union, Joins sets without duplicating elements `like or`
- $\cap$ Intersection `like and`
- $A/B$ different elements of $A$ from $B$ `like implication`
- $x\in y$ $x$ is element of $y$ `x in y`
-  $x\ni y$ $y$ is element of $x$ `y in x`
- $\emptyset$ empty set
- [[Number Set]]
- $|X|$ set element count
- $\mathcal{P}(X)=\set{A\mid A\subseteq X}$ power set, set of all subsets, has $2^{|X|}$ elements
- $A\times B$ cartesian product, set of all pairs where $n=|A||B|$
- $A\circ B$ concatination 
> [!example] $A=\set{a,b},B=\set{x,y}$ then $A\circ B=\set{ax,ay,bx,by}$
- $\bigcup_{i=1}^{n}A_i$ like $\sum$ but for set unions
- [[Relation]]
- [[Ordering]]
- [[Partition]]
- **Upper/Lower Bound** $\forall x\in S,u\leq x$
  similar to max, but `[1,2,3]` here upper bound 
  maybe `5, or anything geq to 3`
- **Minimal/Maximal Element** just `min(set), max(set)` for `[1, 2, 3] -> (1, 3)`
- **Infimum/Supremum** $S=\set{x\in\mathbb{R}:1<x<5}$, then $\inf=1,\ \sup=5$
  `Note 1, 5 is not included in the set`
> [!example] For $\mathbb{N}_1$ $\inf=0,\ \sup=\infty$, but $\min=1,\ \max=\emptyset$
- $\sqsubset\sqsubseteq\sqsupseteq\sqsupset\sqcup$
### Permutation $\huge\frac{n!}{(n-r)!}$ 
How many ways to award 1st and 2nd place to 6 contestants
where r = 2 and n = 6
### Combination $\huge\frac{n!}{(n-r)!r!}$
How many pairs can be made from group of 6 people