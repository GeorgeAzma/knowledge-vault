Saves and restores previous object state without revealing implementation details
``` rust
struct Editor { 
    content: String,
}

struct Memento { 
    content: String,
}

impl Editor {
    fn save(&self) -> Memento { 
        Memento { content: self.content.clone() } 
    }
    
    fn restore(&mut self, m: Memento) { 
        self.content = m.content; 
    }
}

let mut e = Editor { 
    content: "Hello".into() 
};
let m = e.save();
e.content = "Changed".into();
e.restore(m);
```
