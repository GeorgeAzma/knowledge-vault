 Turns a request into a stand-alone object that contains all information about the request. 
 This transformation lets you pass requests as a method arguments, delay or queue a request's execution, and support undoable operations.
``` rust
trait Command { 
    fn execute(&self); 
}

struct PrintCommand { 
    msg: String,
}

impl Command for PrintCommand { 
    fn execute(&self) { 
        println!("{}", self.msg); 
    } 
}

let cmd = PrintCommand { msg: "Hello".into() };
cmd.execute();
```

 