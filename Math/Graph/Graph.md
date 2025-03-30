---
aliases:
  - Adjacency List
  - Edge List
  - Paths
  - Directed Acyclic Graph
  - Node
---
### Terms
- **Vertex/Edge** `aka Node/Connection or Link`
- **Neighbor** vertex connected by single edge to current vertex 
- **Degree** number of neighbors
- **Path** vertex sequence connected by edges
- **Path Length** edges in path
- **Cycle** path that starts/ends on same vertex
- **Connectivity** vertices are connected if path exists between them
  `so you can arrive from any vertex to another`
- **Connected Component** graph's connected subgraphs
- **Directed Acyclic Graph (DAG)**
- **Source** vertex with no inputs `first vertex in DAG`
- **Sink** vertex with no outputs `last vertex in DAG'
- **Depth** length of longest path from source to some vertex
  `depth of DAG is max depth of it's nodes`
- **Node** vertex that is not a source `AND gate with constant input`
- **Cost** number of nodes `vertices - sources`
- **Incident** 2 edges are incident if they connect to same vertex
  also edge is indicent to vertex if it connects to it
- **Maximum Cardinality** largest size `like most verts/edges`
- **Bridge/Cut Edge** edge that increases connected components  if cut 
  `use Tarjans Algorithm to detect bridges`
- **Order** number of vertices
- **Size** number of edges
- **Isomorphic** same graph, it's same vertex/edge set are equal
  `fast inequality check by edge/vertex count`
- **Adjacent** vertices are adjacent if they are connected by edge
- **Isolated** vertex that isn't connected by any edge
- **Spanning Subgraph** has same vertices but lacks some edges
- **Walk** adjacent vertex traversal `represented as vertex list`
- **Trail** adjacent vertex traversal, but can't walk same edge
- **Geodisc** shortest path between 2 vertices
- **Diameter** length of longest shortest path `max length between 2 verts`
- **Vertex Separating Set** vertices that when removed separates 
  2 chosen vertices into separate connected components
- **Vertex Disjoint Path** are 2 paths with no common vertices
- **Bandwidth** max difference between vertex labels
  assuming best labeling is chosen which minimizes difference
  `b(path)=1, b(circuit)=2+, b(K_n)=n-1`
- **Transversal / Hitting Set** intersects/hits every edge or substructure of interest at least once
    - [[Vertex Cover]] hits every edge so it's transversal
    - `A={1,2,3}, B={3,4,2}, C={1,3,4}` here `{3}` and `{2,4}`
      are transversals since they intersect all sets
### [[Graph Types]]
### [[Graph Representations]]
### Graph Subsets
- [[Matching]]
- [[Maximal Matching]]
- [[Maximum Matching]]
- [[Optimal Matching]]
- [[Tree]]
- [[Spanning Tree]]
- [[Minimal Spanning Tree]]
- [[Spanning Forest]]
- [[Circuit]]
- [[Clique]]
### Theorem
- $\large\sum_{u\in V}d(u)=2|E|$ `sum of all vertex degrees is 2 times edges`
- even vertices of odd degree
- has atleast $\geq |V|-|E|$ components
