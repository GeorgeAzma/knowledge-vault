Composes objects into tree structures and then work with these structures as if they were *individual* objects
``` rust
trait Component { 
    fn draw(&self); 
}

struct Leaf; 

impl Component for Leaf { 
    fn draw(&self) { 
        println!("Leaf"); 
    } 
}

struct Node { 
    children: Vec<Box<dyn Component>> 
}

impl Component for Node {
    fn draw(&self) { 
        for c in &self.children { 
            c.draw(); 
        } 
    }
}

let tree = Node { children: vec![Box::new(Leaf), Box::new(Leaf)] };
tree.draw();
```