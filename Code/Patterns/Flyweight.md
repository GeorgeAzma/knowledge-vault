Shares common state between multiple objects instead of keeping all of the data in each object
``` rust
use std::collections::HashMap;

/// Flyweight (shared state)
struct TreeType {
    name: String,
    color: String,
}

struct TreeFactory { 
    types: HashMap<String, Rc<TreeType>> 
}

impl TreeFactory {
    fn get_type(&mut self, key: &str) -> &Flyweight {
        self.types.entry(key.into())
            .or_insert_with(|| Rc::new(TreeType {
                name: name.into(),
                color: color.into(),
            }))
    }
}

struct Tree {
    // dynamic state
    x: i32,
    y: i32,
    // shared state
    tree_type: Rc<TreeType>,
}

fn main() {
    let mut factory = TreeFactory::new();

    let tree1 = Tree { x: 1, y: 2, tree_type: factory.get_type("Oak", "Green") };
    let tree2 = Tree { x: 3, y: 4, tree_type: factory.get_type("Oak", "Green") };
    let tree3 = Tree { x: 5, y: 6, tree_type: factory.get_type("Pine", "DarkGreen") };

    // tree1/tree2 use same TreeType
    assert_eq!(Rc::as_ptr(&tree1.tree_type), Rc::as_ptr(&tree2.tree_type))
}
```