### Terminology
- **Vertex/Edge**
- **Neighbor** vertex connected by single edge to current vertex 
- **Degree** number of neighbors
- **Path** vertex sequence connected by edges
- **Path Length** edges in path
- **Cycle** path that starts/ends on same vertex
- **Connectivity** vertices are connected if path exists between them
  `so you can arrive from any vertex to another`
- **Connected Component** graph vertices subset that are connected
### Types
- **Connected** all vertices are connected
- **Undirected** $(u,v)\implies(v,u)$
- **Directed** $(u,v)\not\implies(v,u)$
- **Cyclic** has cycle
- **Acyclic** has no cycle
- **Weighted** edges `could represent road length`
- **Trees** connected + acyclic, removing any edge disconnects graph
  adding any edge creates cycle
### Representation
- **Adjacency List** make hashmap of `(vertex, neighbors)` for each vertex
- **Matrix** where vertices are rows/cols and if they are connected
  it's 1 otherwise 0, can also represent connection weight
- **Set** `edges = {(3,4), (3, 5), (4, 5)}`