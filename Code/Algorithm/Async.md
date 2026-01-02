``` rust
// 1. future async/await
async fn compute() -> u32 { 10 }
compute().await

// 2. spawning tasks
tokio::spawn(async {
    println!("running in background");
});

// 3. join/gather, wait for both of them to complete in parallel
let (a, b) = tokio::join!(foo(), bar());

// 4. semaphore, only 3 tasks are working in parallel at any time
let sem = Arc::new(Semaphore::new(3));
{
    let permit = sem.acquire().await.unwrap();
    // executed in parallel, 3 threads max
}

// 5. RwLock
let rw = Arc::new(RwLock::new(5));
let r = rw.read().await;      // many readers
let mut w = rw.write().await; // single writer

// 6. mpsc - multiple producer, single consumer, 10 max messages allowed
let (tx, mut rx) = tokio::sync::mpsc::channel(10);
tokio::spawn(async move { tx.send(123).await.unwrap(); });
println!("{}", rx.recv().await.unwrap());

// 7. select/race, do multiple things, end when fastest one finishes
tokio::select! {
    res = fast() => {
        println!("fast finished first: {res:?}");
    }
    _ = tokio::time::sleep(Duration::from_secs(5)) => {
        println!("timeout");
    }
}
```