Attaches new behaviors to objects by placing these objects inside special wrapper objects that contain the behaviors
``` rust
trait Writer { 
    fn write(&self, msg: &str); 
}

struct Console; 
impl Writer for Console { 
    fn write(&self, msg: &str) { println!("{msg}"); } 
}

struct Decorator<W: Writer> { 
    inner: W,
}

impl<W: Writer> Writer for Decorator<W> {
    fn write(&self, msg: &str) { 
        print!("[Decorated] "); 
        self.inner.write(msg); 
    }
}

let w = Decorator { inner: Console };
w.write("Hello");
```