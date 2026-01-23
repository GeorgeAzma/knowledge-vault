Reduces chaotic dependencies between objects by restricting direct communications between them and forcing them to collaborate only via a mediator object
``` rust
struct Mediator;
impl Mediator {
    fn notify(&self, sender: &str, message: &str) {
        println!("{} says: {}", sender, message);
    }
}

struct Colleague<'a> {
    name: &'a str,
    mediator: &'a Mediator,
}

impl<'a> Colleague<'a> {
    fn send(&self, message: &str) {
        self.mediator.notify(self.name, message);
    }
}

let m = Mediator;
let c = Colleague {
    name: "A",
    mediator: &m,
};
let alice = Colleague { name: "Alice", mediator: &mediator };
let bob = Colleague { name: "Bob", mediator: &mediator };
alice.send("Hello Bob!"); // Alice says: Hello Bob!
bob.send("Hi Alice!"); // Bob says: Hello Alice!
```
