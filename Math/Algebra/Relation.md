---
aliases:
  - Equivalence Relations
  - Equivalence Class
  - Symmetric Relation
  - Anti Symmetric Relation
  - Reflexive Relation
  - Transitive Relation
  - Divisibility Relation
---
### $R\subseteq A\times B$
relation is subset of $A$ [[Set#Operators|Cartesian Product]] with $B$
> [!example] $xRy$, here $R$ is relation operator, might also be $x\sim y$
### Equivalence Relations
- **Reflexive** $\forall a\in A, aRa$ `1 = 1`
- **Symmetric** $\forall a,b\in A,aRb\implies bRa$ 
  `alice.is_sibling(bob) = bob.is_sibling(alice)`
- **Transitive** $\forall a,b,c\in A,aRb\land bRc\implies aRc$
  `if a > b and b > c, then a > c`
### Other Relations
- $x\mid y$ `y is divisible by x, a.k.a x divides y`
### Equivalence Class $[a]=\set{a\in M\land x\in M\mid aRx}$
month born in has 12 equivalence classes
$[May]$ may includes 1999 May or 2013 May
$x\mod n$ has $n$ equivalence classes
if $n=3$ then $[0]=\set{-3,0,3,6},\ [1]=\set{-4,-1,1,4}$
