Provides a simplified interface to a library/framework or complex set of classes
``` rust
struct SubsystemA; impl SubsystemA { 
    fn op(&self) { println!("A"); } 
}
struct SubsystemB; impl SubsystemB { 
    fn op(&self) { println!("B"); } 
}

struct Facade { 
    a: SubsystemA, 
    b: SubsystemB,
}

impl Facade { 
    fn op(&self) { 
        self.a.op(); 
        self.b.op(); 
    } 
}

let f = Facade { 
    a: SubsystemA, 
    b: SubsystemB,
};
f.op();
```