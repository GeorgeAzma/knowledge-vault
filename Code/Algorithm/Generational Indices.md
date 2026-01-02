https://lucassardois.medium.com/generational-indices-guide-8e3c5f7fd594

``` rust
struct Graph {
    vertices: Vec<Option<Vertex>>, // None if vertex is removed
}

struct Vertex {
    connections: Vec<u32>, // index to `vertices`
}
```
### Problem
`Vec<Option<Vertex>>` correctly tracks existing and removed vertex connections
However if vertex was removed and replaced, then all the vertices that pointed to removed vertex 
now incorrectly point to newly replaced vertex, instead of pointing to `None`
### Solution
- track `generation` for each vertex
- when vertex is removed `generation` is incremented.
- vertices are inserted at free index (with incremented `generation` or `0` if no free index)
     `insert()` returns `Key { index, generation }`
- get vertices using `key`, `None` is returned if `vertex.is_none() || vertex.generation != key.generation`
``` rust 
struct Key {
    index: u32, // same as before
    generation: u32, // incremented when key is removed from a graph
}

struct Vertex {
    connections: Vec<Key>,
    free: Vec<u32>,
}

struct Slot<T> {
    generation: u32,
    value: Option<T>,
}

struct GenerationalArena {
    vertices: Vec<Slot<Vertex>>,
}

impl GenerationalArena {
    fn insert(&mut self, vertex: Vertex) -> Key {
        if let Some(idx) = self.free.pop() {
            let slot = &mut self.slots[idx as usize];
            slot.value = Some(vertex);
            Key { index: idx, generation: slot.generation }
        } else {
            let idx = self.slots.len() as u32;
            self.slots.push(Slot { generation: 0, value: Some(v) });
            Key { index: idx, generation: 0 }
        }
    }
    
    fn remove(&mut self, key: Key) -> Option<Vertex> {
        let Slot { generation, value: vertex } = &mut self.vertices.get(key.index)?;
        if generation != key.generation { return None; }
        *generation = generation.wrapping_add(1);
        self.free.push(key.index);
        vertex.take()
    }
    
    fn get(&self, key: Key) -> Option<&Vertex> {
        let Slot { generation, value: vertex } = &self.vertices.get(key.index)?;
        if key.generation != generation {
            return None; // vertex was replaced
        }
        vertex.as_ref()
    }
}
```
