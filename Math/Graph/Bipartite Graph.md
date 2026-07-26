[[Graph]] that can be divided to 2 sets which don't have internal edges
``` mermaid
graph LR
  subgraph Applicant
    A(A)
    B(B)
  end
  subgraph Job
    C(C)
    D(D)
  end
  A ==> C
  A ==> D
  B ==> C
```
- **Complete Bipartite Graphs** has all possible edges between nodes
  $|V|=m+n,\ |E|=mn$
