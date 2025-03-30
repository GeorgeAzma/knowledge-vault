[[Spanning Tree]] with minimal edge weight sum
### Finding MST
##### Kruskal's Algorithm $O(E\log V)$
- sort edges
- initialize [[Spanning Forest]] from each node `single node forest`
- iterate over sorted edges, for each edge:
    - add edge to MST if no cycles arise
- uses [[Union Find]] algorithm implementation
``` rust
fn kruskal(edges: &[(i32, usize, usize)]) -> i32 {
    let mut sorted_edges = edges.to_vec();
    sorted_edges.sort_by_key(|(w, _, _)| *w);
    // note: this is not neccessary if vert count is passed to fn  
    let vert_len = *edges.iter().map(|(_, u, v)| u.max(v)).max().unwrap() + 1;
    let mut uf = UnionFind::new(vert_len);
    let mut mst_weight = 0;
    let mut edges_in_mst = 0;
    for (weight, u, v) in sorted_edges {
        if uf.find(u) != uf.find(v) {
            mst_weight += weight;
            edges_in_mst += 1;
            uf.union(u, v);
        }
        if edges_in_mst == vert_len - 1 {
            break;
        }
    }
    mst_weight
}
```
``` mermaid
graph LR
1((1)) <==13==> 2((2))
2 <==7==> 3((3))
2 <==39==> 5((5))
3 <==41==> 4((4))
4 <==22==> 2
4 <==9==> 5((5))
```
- create forest 
``` mermaid
graph TD
1((1)) ; 2((2)) ; 3((3)) ; 4((4)) ; 5((5))
```
- sort edges 
``` mermaid
graph TD
A((2)) <==7==> B((3))
C((4)) <==9==> D((5))
E((1)) <==13==> F((2))
G((2)) ==22==> H((4))
I((2)) ==39==> J((5))
K((3)) ==41==> L((4))
```
- connect sorted edges that don't cause cycle `tree internal connections`
``` mermaid
graph TD
A((1)) ; B((2)) ; C((3)) ; D((4)) ; E((5))
B ==> F((23))
C ==> F((23))
D ==> G((45))
E ==> G((45))
A ==> H((123))
F ==> H((123))
H ==> I((12345))
G ==> I((12345))
```
- next is `2-5` but they are in same tree, joining them causes cycle, so skip
- same for `3-4`, skip it
- extract all the connections you've created to get final tree edges
- sum edge weights for minimum weight value
##### Prim's Algorithm $O(E\log E)$ `good for dense nets`
$O(V^2)$ if not using [[Graph Representations|Adjacency List Representation]]
- start at arbitrary vertex
- build tree
    - extract all tree vertex neighbors
    - choose neighbor with smallest weight connection to the tree
    - if adding neighbor does not connect tree to itself `cause cycle`
    - add neighbor to the tree and repeat until all nodes are added
``` rust
pub fn prim(edges: &[(i32, usize, usize)]) -> i32 {
    let vert_len = edges.iter().map(|(_, u, v)| *u.max(v)).max().unwrap_or(0) + 1;
    let mut adj = (0..vert_len).map(|_| vec![]).collect::<Vec<_>>();
    for &(w, u, v) in edges {
        adj[u].push((v, w));
        adj[v].push((u, w));
    }
    let mut visited = vec![false; vert_len];
    let mut mst_w = 0;
    let mut bh = BinaryHeap::new();
    bh.push((Reverse(0), 0));
    while let Some((w, u)) = bh.pop() {
        if visited[u] {
            continue;
        }
        mst_w += w.0;
        visited[u] = true;
        for &(v, w) in adj[u].iter() {
            if !visited[v] {
                bh.push((Reverse(w), v));
            }
        }
    }
    mst_w
}
```
