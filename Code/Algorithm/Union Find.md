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

    pub fn find(&self, i: usize) -> usize {
        if self.parent[i] == i {
            return i;
        }
        self.find(self.parent[i])
    }

    // merge set with i and set with j
    pub fn union(&mut self, i: usize, j: usize) {
        let irep = self.find(i);
        let jrep = self.find(j);
        self.parent[irep] = jrep;
    }
}
```
### Path Compression
instead of assigning current node to parent,
assign it to parent's parent and so on until root.
so that you have to traverse less during next `find()`
> [!example] `A -> B -> C + D`
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
### Union by Rank
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

    pub fn find(&mut self, i: usize) -> usize {
        if self.parent[i] != i {
            self.parent[i] = self.find(self.parent[i]);
        }
        self.parent[i]
    }

    // merge set with i and set with j
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
