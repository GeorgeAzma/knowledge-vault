``` toml
[package]
name = "my-package"
version = "0.1.0"
edition = "2024"
default-run = "project_name" # default binary to run

[[bin]]
name = "my_bin"
path = "bin/my_file.rs"
```
- [[Cargo Watch]]
### Optimized
``` toml
[profile.release]
opt-level = 3
lto = "fat"
codegen-units = 1
panic = "abort"
strip = "symbols"
overflow-checks = false
debug = false
```
