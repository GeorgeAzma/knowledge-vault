- **Spinlock** loop that waits until lock is unlocked by some other thread
### Mutex
``` rust
let mx = Mutex::new(0);
*mx.lock().unwrap() += 1; // other threads can't access until lock is dropped
```
### RwLock
``` rust
let rw = RwLock::new(0);
*rw.write().unwrap() += 1; // other threads can't write until this stops writting
rw.read().unwrap() // any thread can ready anytime without locking
```
### Atomic
``` rust
let atomic = AtomicU32::new(0);
atomic.fetch_add(1, Ordering::SeqCst) // Relaxed, Acquire, Release, AcqRel
// fetch_update, fetch_and, fetch_max, min, nand, or, sub
// load, store, get_mut, into_inner, swap
enum Ordering {
    // only cares about atomicity, ops are reordered freely
    // use: incrementing, where order does not matter
    // example: just add a block to the tower without caring what others are doing to it
    Relaxed,
    // next reads/writes are not moved before acquire
    // use: ensure next reads see effects of prev writes
    // example: before adding a block, make sure you see blocks that others placed
    Acquire,
    // prev reads/writes are not moved after release
    // use: write data, ensure other writes don't get moved after this write and overwrite
    // example: place block on tower and tell others they can place theirs
    Release,
    // example: ensure you see prev block and everyone sees your block
    AcqRel,
    // example: everyone places blocks in strict sequential order
    SeqCst,
}
```
### Barrier
``` rust
let barrier = Barrier::new(4); // continue when all 4 threads are finished
// each thread does:
println!("A");
barrier.wait()
println!("B");
// output A,A,A,A, B,B,B,B
```
### Condition Variable
```rust
let cvar = Condvar::new();
let mutx = Mutex::new(false);
// ... change mutex ...
cvar.notify_one(); // wake 1 blocked thread
cvar.notify_all(); // wake all blocked threads
// other threads (wait for change in mutx):
while !*mutx.lock.unwrap() {
    // when notified checks if mutx is true and resumes if it is
    cvar.wait(mutx);
}
```
### Mpsc
multi-producer single consumer
``` rust
let (sender, receiver) = std::sync::mpsc::channel();
let sender2 = sender.clone();
// thread 1:
sender.send(42).unwrap()
// thread 2:
sender2.send(31).unwrap()
// main thread:
receiver.recv().unwrap() // recieves 42, 31 or 31, 42

// sync channel has limit on number of sending messages
let (sync_tx, sync_rx) = std::sync::mpsc::sync_channel(2); 
sync_tx.send(3);
sync_tx.send(4);
sync_tx.send(5); // waits for sent msg to be recieved until 5 can be sent
sync_rx.recv(); // after this 5 can be sent
```
### Park
``` rust
let thread = std::thread::spawn(|| {
    println!("about to park");
    thread::park();
    println!("unparked after 2s");
});
std::thread::sleep(Duration::from_secs(2));
thread.thread().unpark();
thread.join().unwrap();
```
