``` rust
enum Ordering {
    Relaxed, // Just do it, I don't care when anyone else sees it
    Release, // All previous writes in this thread are visible to threads that do Acquire
    Acquire, // Ensures this thread sees all writes that happened-before a Release
    AcqRel,  // Read-modify-write: combines Acquire and Release guarantees
    SeqCst,  // Everyone agrees on a single global order of operations
}
```
### Example
``` rust
Thread A: counter.fetch_add(1, SeqCst)
Thread B: counter.fetch_add(1, SeqCst)
Thread C: counter.fetch_add(1, SeqCst)
```
##### Relaxed
``` rust
// Thread A sees:
* Thread B: +1
* Thread A: +1 // 1
* Thread C: +1

// Thread B sees:
* Thread C: +1
* Thread A: +1
* Thread B: +1 // 2

// Thread C sees:
* Thread A: +1
* Thread B: +1
* Thread C: +1 // 2
```
##### Release / Acquire
``` rust
// Thread A (Release):
* data = 42
* flag.store(true, Release) // all writes complete before this

// Thread B (Acquire):
* while !flag.load(Acquire) {} // sees all Release stores
* read(data) // guaranteed to see 42 after flag is true
```
##### AcqRel
``` rust
// similar to SeqCst but individual threads don't care about order of threads 
// before and after it as long as threads before write their writes 
// and threads after read their reads
```
##### SeqCst
``` rust
// Thread A,B,C sees:
* Thread B: +1 // 0 → 1
* Thread A: +1 // 1 → 2
* Thread C: +1 // 2 → 3
```
