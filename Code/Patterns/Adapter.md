Allows objects with incompatible interfaces to collaborate
``` rust
struct OldApi;

impl OldApi { 
    fn old_method(&self) { println!("Old"); } 
}

trait NewApi { 
    fn request(&self); 
}

struct Adapter(OldApi);

impl NewApi for Adapter { 
    fn request(&self) { 
        self.0.old_method(); 
    } 
}

let a = Adapter(OldApi);
a.request();
```
