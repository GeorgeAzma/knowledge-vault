### Find Rank
- do [[Matrix Decomposition]]
- **rank = non-zero row count**
### Formulas
- $\text{rank}(A_{n\times n})=n\iff \det(A)\neq0$ 
- $\text{rank}\begin{pmatrix}A&0\\0&B\end{pmatrix}=\text{rank}(A)+\text{rank}(B)$
- $\text{rank}(A_{n\times m})\leq\min(n,m)$ 
- if $r$ ranked [[Minor]] is non-zero then $\text{rank}(A)\geq r$ 
    - if $r+1$ ranked [[Minor]][[s]] containing non-zero $r$ ranked minor are all $0$ then $\text{rank}(A)=r$ otherwise $\text{rank}(A)\geq r+1$
- $\operatorname{rank}(\bar{A})=\operatorname{rank}(A)$ `Rouché–Capelli theorem` [[Augmented Matrix]] rank is same as original if the system is solvable