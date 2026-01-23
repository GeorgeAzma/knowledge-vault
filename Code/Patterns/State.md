Behavior changes with internal state
``` rust
trait State {
    fn handle(&self);
}

struct Happy;
impl State for Happy {
    fn handle(&self) {
        println!("Smile");
    }
}

struct Sad;
impl State for Sad {
    fn handle(&self) {
        println!("Cry");
    }
}

struct Person {
    state: Box<dyn State>,
}

impl Person {
    fn act(&self) {
        self.state.handle();
    }
}

let p = Person {
    state: Box::new(Happy),
};
p.act();
```