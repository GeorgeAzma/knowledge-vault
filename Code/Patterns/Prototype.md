Copies existing objects without making your code dependent on their classes
``` rust
#[derive(Clone)]
struct Sheep { 
    name: String 
}

let original = Sheep { 
    name: "Dolly".into() 
};

let clone = original.clone();
```

``` rust
trait Animal {
    fn speak(&self);
    fn clone_box(&self) -> Box<dyn Animal>;
}

#[derive(Clone)]
struct Sheep { name: String }

impl Animal for Sheep {
    fn speak(&self) { println!("{} says baa!", self.name); }
    fn clone_box(&self) -> Box<dyn Animal> { Box::new(self.clone()) }
}

fn main() {
    let original: Box<dyn Animal> = Box::new(Sheep { name: "Dolly".into() });
    let copy = original.clone_box(); // cloned without knowing exact type
    original.speak();
    copy.speak();
}
```