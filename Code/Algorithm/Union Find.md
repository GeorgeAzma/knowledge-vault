[[data structures|data structure]] that tracks connected components `islands`
initially all nodes are islands, but you can join nodes `union`
which makes parent of node `i` be node `j`
it can find islands by following parents until parent node's parent is itself
worst case `find()/union()` time complexity is $O(n)$ average case for random parents is $O(\log n)$
### Simple
``` rust
struct UnionFind {
    parent: Vec<usize>,
}

impl UnionFind {
    pub fn new(size: usize) -> Self {
        Self {
            parent: (0..size).collect(),
        }
    }

    // finds parent or root node of current node, useful for tracking islands
    pub fn find(&self, i: usize) -> usize {
        if self.parent[i] == i {
            return i;
        }
        self.find(self.parent[i])
    }

    // merge set with node i and set with node j to a single island
    pub fn union(&mut self, i: usize, j: usize) {
        let irep = self.find(i);
        let jrep = self.find(j);
        self.parent[irep] = jrep;
    }
}
```
### Union by Rank
this makes `find()\union()` worst case time complexity $O(\log n)$
``` rust
struct UnionFind {
    parent: Vec<usize>,
    rank: Vec<usize>,
}

impl UnionFind {
    pub fn new(size: usize) -> Self {
        Self {
            parent: (0..size).collect(),
            rank: vec![0; size],
        }
    }

    // finds parent or root node of current node, useful for tracking islands
    // uses path compression to reduce future tree traversalls
    // this makes find()/union() worst time complexity O(1) (with help of union by rank)
    pub fn find(&mut self, i: usize) -> usize {
        if self.parent[i] != i {
            self.parent[i] = self.find(self.parent[i]);
        }
        self.parent[i]
    }

    // merge set with i and set with j
    // uses union by rank algorithm,
    // which makes sure bigger trees are not attached to smaller trees, 
    // since each child of bigger tree would have to travel up the smaller tree to find its parent
    // while for smaller trees that's less troublesome
    // tree size is determined by rank, which just counts number of connections in the island
    // this makes find()/union() worst case time complexity O(log n) instead of O(n)
    pub fn union(&mut self, i: usize, j: usize) {
        let irep = self.find(i);
        let jrep = self.find(j);
        if irep == jrep {
            return;
        }
        use std::cmp::Ordering;
        match self.rank[irep].cmp(&self.rank[jrep]) {
            Ordering::Less => self.parent[irep] = jrep,
            Ordering::Greater => self.parent[jrep] = irep,
            Ordering::Equal => {
                self.parent[jrep] = irep;
                self.rank[irep] += 1;
            },
        }
    }
}
```
### Path Compression
instead of assigning current node to parent,
assign it to parent's parent and so on until root.
so that you have to traverse less during next `find()`
[[#Union By Rank]] + **Path Compression** gives worst case `find()/union()` time complexity of $O(\alpha(n))$ 
where $\alpha(n)$ is **inverse ackermann function**, which grows super slow, 
so slow that any realistic number of elements gives $\alpha(n)\leq4$, so might as well be $O(1)$
> [!example] `[A -> B -> C] + D`
> Instead of `A -> B -> C -> D` it does `A -> (B, D) -> C`
> not only that it also updates parent to `A -> (B, C, D)`
``` rust
pub fn find(&mut self, i: usize) -> usize {
    if self.parent[i] != i {
        self.parent[i] = self.find(self.parent[i]);
    }
    self.parent[i]
}
```