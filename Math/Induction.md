### $A\subseteq\mathbb{N}\land0\in A\land(n\in A\rightarrow S(n)\in A)\rightarrow A=\mathbb{N}$
If $A$ is natural `and` $0$ is in $A$ `and` $n$ is in $A$ implies that $S(n)$ is in $A$
then $A$ is all natural numbers `zero is also natural`

this rule can be used for proving `proof by induction`
because it implies that if you prove something
for base case (usually $n=0$) and prove it for subsequent cases
$n+1$, then it's true for all other subsequent cases
> [!example] Prove by induction that $\sum_{i=1}^nA_i=\frac{n(n+1)}{2}$
> **Base case** for $i=1$ `because we start from 1 here`
> $\frac{1(1+1)}{2}=1$ `holds true`
> **Inductive step** $n=k$ `to avoid confusion`
> $S_k=\frac{k(k+1)}{2}$ `S_k is short hand for sum`
> prove it for $i=k+1$ $S_{k+1}=S_k+(k+1)$
> substitute hypothesis $S_{k+1}=\frac{k(k+1)}{2}+(k+1)=\frac{k(k+1)+2(k+1)}{2}=\frac{(k+2)(k+1)}{2}$
> which is same as arithmetic formula hypothesis if you rearange
> $S_{k+1}=\frac{(k+1)((k+1)+1)}{2}$, if $n=k+1$ then $S_{k+1}=\frac{n(n+1)}{2}$
> 
