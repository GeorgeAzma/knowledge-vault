Ensures that a class has only one instance, while providing a global access point to this instance
``` rust
use std::sync::OnceLock;

struct Config { 
    value: u32 
}

static INSTANCE: OnceLock<Config> = OnceLock::new();

fn get_config() -> &'static Config {
    INSTANCE.get_or_init(|| Config { value: 42 })
}

println!("{}", get_config().value);
```