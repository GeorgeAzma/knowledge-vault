- defines a family of algorithms
- puts them in separate classes
- makes their objects interchangeable
``` rust
trait Strategy {
    fn execute(&self, x: i32, y: i32) -> i32;
}

struct Add;
impl Strategy for Add {
    fn execute(&self, x: i32, y: i32) -> i32 {
        x + y
    }
}

struct Mul;
impl Strategy for Mul {
    fn execute(&self, x: i32, y: i32) -> i32 {
        x * y
    }
}

fn context(s: &dyn Strategy, x: i32, y: i32) -> i32 {
    s.execute(x, y)
}

println!("{}", context(&Add, 2, 3));
```
