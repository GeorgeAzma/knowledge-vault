Traverses elements of a collection without exposing its underlying representation (list, stack, tree, etc.).
``` rust
let v = vec![1,2,3];
for val in v.iter() { 
    println!("{val}"); 
}
```