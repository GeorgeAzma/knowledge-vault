---
aliases:
  - Adjacency List
  - Edge List
  - Paths
  - Directed Acyclic Graph
  - Node
---
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
- **Adjacency List** make hashmap/list of `(vertex, neighbors)` for each vertex
- [[Adjacency Matrix]]
- [[Incidence Matrix]] 
- **Edge List** `[(3,4), (3,5), (4,5)]`
- **Paths** `[1,1,2,1,1,3]`
##### Edge Operations

|    Representation    |    Get    | Add |  Delete   |   Find    | Memory |
| :------------------: | :-------: | :-: | :-------: | :-------: | :----: |
|    Adjacency List    | $\deg(v)$ | $1$ | $\deg(v)$ | $\deg(v)$ | $V+E$  |
| [[Adjacency Matrix]] |    $1$    | $1$ |    $1$    |    $1$    | $V^2$  |
|      Edge List       |    $E$    | $1$ |    $E$    |    $E$    |  $2E$  |
|        Paths         |    $E$    | $1$ |    $E$    |    $E$    |  $E$   |
##### Vertex Operations

|    Representation    | Get |    Add    | Delete | Find |
| :------------------: | :-: | :-------: | :----: | :--: |
|    Adjacency List    | $1$ |    $1$    |  $V$   | $V$  |
| [[Adjacency Matrix]] | $1$ |   $V^2$   | $V^2$  | $1$  |
|      Edge List       | $E$ | $\deg(v)$ |  $E$   | $E$  |
|        Paths         | $E$ |    $1$    |  $E$   | $E$  |
- `if adjacency list is sparse then get is O(V)`
- `add/del rebuilds adjacency matrix so it's O(V^2)`