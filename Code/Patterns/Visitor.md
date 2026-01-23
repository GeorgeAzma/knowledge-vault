Separates algorithms from objects they operate on
``` rust
trait Visitor {
    fn visit(&self, e: &Element);
}

trait Element {
    fn accept(&self, v: &dyn Visitor);
}

struct ConcreteElem(i32);
impl Element for ConcreteElem {
    fn accept(&self, v: &dyn Visitor) {
        v.visit(self)
    }
}

struct PrintVisitor;
impl Visitor for PrintVisitor {
    fn visit(&self, e: &Element) {
        println!("Visited");
    }
}

let elem = ConcreteElem(10);
elem.accept(&PrintVisitor);
```