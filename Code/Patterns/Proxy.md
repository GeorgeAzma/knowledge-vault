Placeholder for another object, allowings performing something before/after the request gets through to the original object
``` rust
trait Service { 
    fn request(&self); 
}

struct Real; 

impl Service for Real { 
    fn request(&self)  {
        println!("Real request"); 
    } 
}

struct Proxy { 
    real: Real,
}

impl Service for Proxy { 
    fn request(&self) { 
        println!("Before"); 
        self.real.request(); 
        println!("After"); 
    } 
}

let p = Proxy { real: Real };
p.request(); // Before + Real request + After
```