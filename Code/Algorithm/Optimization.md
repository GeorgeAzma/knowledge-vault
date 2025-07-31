### Memory
Memory is much slower than math
so less memory = faster / less cache misses
##### Bad Example
``` rust
// align(64), size(192b/24B)
struct Monster {
    ptr:   *mut u8, // 64b (usize)
    hp:    u32,     // pad 32b
    alive: bool,    // u8 + pad 56b
}
let monsters: Vec<Monster>;
```
##### Improvements
- use `idx` instead of `ptr`
``` rust
// align(32), size(96b/12B) (2x reduction)
struct Monster {
    idx: u32, // use idx instead of ptr
    hp:  u32,
    alive: bool,
}
```
-  **Struct of Arrays** `for no padding`
``` rust
// size(104b/13B) (~2x reduction)
struct Monsters {
    ptrs:   Vec<*mut u8>, // align(64)
    hps:    Vec<u32>,     // align(32)
    states: Vec<bool>,    // align(8) or align(1) for bitset
}
```
- use `hp != 0` instead of `alive` 
``` rust
// align(64), size(128b/16B) (1.5x reduction)
struct Monster {
    ptr: *mut u8, // 64b (usize)
    hp:  u32,     // pad 32b
}
```
###### Heuristics
- replace `~50/50` bools with 2 external vecs `also avoids if alive checks` 
``` rust
// align(64), size(128b/16B) (1.5x reduction)
struct Monster {
    ptr: *mut u8,
    hp:  u32,
}
// replace alive bool with 2 external vectors
// which also avoids if alive checks
let alive_monsters: Vec<Monster>;
let dead_monsters: Vec<Monster>;
```
- if `99%` of monsters have `100hp`, store hp only for the `1%` using hash map
``` rust
// align(64), size(128b/16B) (1.5x reduction)
struct Monster {
    ptr:   *mut u8, // 64b (usize)
    alive: bool,    // u8 + pad 56b
}
// 1%
let monsters_hps: HashMap<usize, u32>; // (monster_ptr, hp)
```
- store specific monster type data in external vec and store idx in struct
- don't store rare stuff, just recalculate
##### Final Good Example
``` rust
// struct Monster {
//    ptr:   *mut u8, // not needed
//    hp:    u32,     // stored in monster_hps
//    alive: bool,    // covered by hp
//}
// let monsters: Vec<Monster>; // not needed
// but make sure monster idxs are tracked somehow
let monsters_hps: HashMap<u32, u32>; // (monster_idx, hp)
// Final size:
// - u32x2
// - hashmap per element cost (~2x)
// 1% * ~64b = 0.64b per Monster (~38x reduction)
```
##### Enums
``` rust
enum Color {
    Yellow,
    Black,
}
// Bad (2B)
enum ColoredCloth {
    Shirt(Color),
    Socks(Color),
}
// Good (1B)
enum ColoredCloth {
    YellowShirt
    BlackShirt,
    YellowSocks,
    BlackSocks,
}
```
### Patterns
- [[Parallel Prefix Sum]]
- **Two Pointers** sorted list, have 2 pointers at start/end, if `sum < target` 
  increase start pointer otherwise increase end pointer untill target is reached
- **Sliding Window** only window edges matter, others are duplicate info
- **Fast and Slow Pointers** finds cycles, if there are no cycles in the [[Graph|Graph]] 
  fast pointer will always be ahead of slow and they never meet
  if cycles exist fast and slow pointers eventually meet
- **Equality Checks** can be done fast using `u64` bits
  you can fit $10$ base $64$ string chars in `u64` and compare in single cycle
### [[Data Structures]]
- **Critbit Tree** for fastest string lexicographical/exact lookups
youtu.be/DjYZk8nrXVY
### Rust Optimization Flags
```
-C opt-level=3 
-C target-cpu=native 
-C panic=abort 
-C debuginfo=0
-C codegen-units=1
-C strip="symbols"

Cargo.toml
[profile.release]
opt-level=3
...
```
### [[Bit#Tricks|Bit Tricks]]
