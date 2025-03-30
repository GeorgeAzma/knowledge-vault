---

---
also called **Backus-Naur-Form `BNF`**
- $G$ context free grammar
    - $G.T$ terminals `a,0,1`
    - $G.N$ non-terminals `expr, ident`
    - $G.S\in G.N$ start symbol `<start_of_file>`
    - $G.P\subset G.N\times(G.N\cup G.T)^*$ productions `grammar rules`
- $G.T\cap G.N=\emptyset$
- $(n,w)\in G.P$ written as $n\to_G w$ where $n$ is non-terminal $w$ is product
- $L(G)$ all words that can be derived with grammar `language`
> [!example] bit string
> $T=\set{0,1}$ `terminals`
> $B=0\mid1$
> $\braket{BS}=B\mid B\braket{BS}$
> $S=\braket{BS}$ `start symbol`
### Tree Region
Subset of derivation tree where if node is in region
all it's ancestors are also in the region
