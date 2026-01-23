defines default algorithm in super class, but lets child class change it
``` rust
trait Game {
    fn play(&self) {
        self.start();
        self.play_turn();
        self.end();
    }
    fn start(&self);
    fn play_turn(&self);
    fn end(&self);
}

struct Chess;
impl Game for Chess {
    fn start(&self) {
        println!("Start");
    }
    fn play_turn(&self) {
        println!("Turn");
    }
    fn end(&self) {
        println!("End");
    }
}

Chess.play();
```