Splits a large class or a set of closely related classes into two separate hierarchies 
**abstraction** and **implementation** which can be developed independently of each other
``` rust
trait Renderer { 
    fn render(&self); 
}

struct VectorRenderer;
impl Renderer for VectorRenderer { 
    fn render(&self) { println!("Vector"); } 
}

struct Shape<'a> { 
    renderer: &'a dyn Renderer 
}

impl<'a> Shape<'a> { 
    fn draw(&self) { self.renderer.render(); } 
}

let shape = Shape { 
    renderer: &VectorRenderer 
};
shape.draw();
```
