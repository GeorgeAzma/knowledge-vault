Defines a subscription mechanism to notify multiple objects about any events that happen to the object they're observing.
``` rust
struct Subject {
    observers: Vec<Box<dyn Fn()>>,
}

impl Subject {
    fn new() -> Self {
        Self { observers: vec![] }
    }
    
    fn attach(&mut self, f: Box<dyn Fn()>) {
        self.observers.push(f);
    }
    
    fn notify(&self) {
        for f in &self.observers {
            f();
        }
    }
}

let mut s = Subject::new();
s.attach(Box::new(|| println!("Notified")));
s.notify();
```
