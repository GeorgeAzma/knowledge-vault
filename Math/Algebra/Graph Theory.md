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
- **Directed Acyclic Graph (DAG)**
- **Source** vertex with no inputs `first vertex in DAG`
- **Sink** vertex with no outputs `last vertex in DAG'
- **Depth** length of longest path from source to some vertex
  `depth of DAG is max depth of it's nodes`
- **Node** vertex that is not a source `AND gate with constant input`
- **Cost** number of nodes `vertices - sources`
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
- [[Adjacency Matrix]]
- [[Incidence Matrix]] 
- **Edge List** `[(3,4), (3, 5), (4, 5)]`
- **Paths** `[1,1,2,1,1,3]`
