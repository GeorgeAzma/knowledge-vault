Constructs complex objects step by step
``` rust
struct Pizza { 
    cheese: bool, 
    pepperoni: bool 
}

struct PizzaBuilder { 
    cheese: bool, 
    pepperoni: bool 
}

impl PizzaBuilder {
    fn new() -> Self { 
        Self { 
            cheese: false, 
            pepperoni: false,
        } 
    }
    
    fn cheese(mut self, val: bool) -> Self { 
        self.cheese = val; 
        self 
    }
    
    fn pepperoni(mut self, val: bool) -> Self { 
        self.pepperoni = val; 
        self 
    }
    
    fn build(self) -> Pizza { 
        Pizza { 
            cheese: self.cheese, 
            pepperoni: self.pepperoni,
        } 
    }
}

let pizza = PizzaBuilder::new()
    .cheese(true)
    .pepperoni(true)
    .build();
 ```
