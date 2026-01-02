``` rust
struct InteriorMutability {
    cell: Cell<u32>, // can change inner value via copy, requires T: Copy
    ref_cell: RefCell<u32>, // allows &mut access with runtime borrow checker rules
    once_cell: OnceCell<u32>, // allows writing only once, after which it becomes &T forever
    unsafe_cell: UnsafeCell<u32>, // allows &mut conversion for &
}

let x: InteriorMutability;

x.cell.set(3);
x.cell.get(); // 3
x.cell.replace(4); // 3, cell =4
x.cell.take(); // 4, cell = 0 (Default)
x.cell.into_inner(); // u32, destroy cell

x.ref_cell.borrow() // Ref<u32>
x.ref_cell.borrow_mut() // ERROR: immutable + mutable borrow
x.ref_cell.try_borrow() // Result<Ref<u32>>
x.ref_cell.replace(4); // 3, ref_cell = 4
x.ref_cell.take(); // 4, ref_cell = 0 (Default)
x.ref_cell.into_inner(); // u32, destroy ref_cell

x.once_cell.set(5) // Result<()>
x.once_cell.get() // Some(&5)
x.once_cell.get_or_init(|| { 3 }) // &5
x.once_cell.get_or_try_init(|| -> Result<u32> { 3 }) // Ok(&5)
x.once_cell.take() // Some(5), once_cell returns to uninitialized state
x.once_cell.into_inner() // 5, destroy once_cell

x.unsafe_cell.get() // &mut 5
x.unsafe_cell.into_inner() // 5, destroy unsafe_cell
```
