Request goes through chain of handlers, where each handler can stop request from propagating `similar to app events`
``` rust
trait Handler { 
    fn handle(&self, val: i32) -> bool; 
}

struct Even; 

impl Handler for Even { 
    fn handle(&self, val: i32) -> bool { 
        if val % 2 == 0 { 
            println!("Even"); 
            true 
        } else { 
            false 
        } 
    } 
}

struct Odd;

impl Handler for Odd { 
    fn handle(&self, val: i32) -> bool { 
        if val % 2 != 0 { 
            println!("Odd");
            true 
        } else { 
            false 
        } 
    } 
}

let chain: Vec<Box<dyn Handler>> = vec![
    Box::new(Even), 
    Box::new(Odd)
];

let val = 3;
for h in &chain { 
    if h.handle(val) { 
        break; 
    } 
}
```