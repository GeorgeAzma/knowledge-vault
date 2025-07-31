``` rust
macro_rules! sum {
    ($($x:expr),*) => {
        {
            let mut total = 0;
            $(total += $x;)*
            total
        }
    }
}
sum!(1, 2, 3)

macro_rules! matrix {
    ($( $( $val:expr ),* );* ) => {
        vec![
            $(
                vec![$($val),*]
            ),*
        ]
    };
}
matrix!(1, 2, 3; 4, 5, 6);
```
#### Repetition
``` rust
$($x:expr)* // repeat 0+ times
$($x:expr)+ // repeat 1+ times
$($x:expr),* // repeat 0+ times (comma seperated)
$($x:expr),+ // repeat 1+ times (comma seperated)
// seperator can be [, | ; | =>]
// no separator default is space
($($x:expr),* ; $($y:expr),* ) => { 
    println!("Group 1: {:?}", vec![$($x),*]); 
    println!("Group 2: {:?}", vec![$($y),*]); 
};
groups!(1, 2, 3 ; 4, 5, 6)
```
#### Matchers
``` rust
$x:tt => // any token (most generic matcher)
$x:expr => // 1+1 | "hi" | vec![1,2] | (5>1))
$x:ident => // names of fn | struct | enum | var, like: foo_func
$x:ty => // u32 | Vec<String> | fn(i32) -> i32
$x:pat => // Some(_), None, true | false (used in: match | if let)
$x:block => // { /* inside block code */ }
$x:path => // std::io, crate::vec2
$x:meta => // attribs inside #[], like: derive | target_os
$x:literal => // 42 | true | "hi"
$x:item => // fn | struct | enum | like: fn foo() { .. }
$x:stmt => // let x = 4;
$x:vis => // pub(crate), pub
$x:macro => // my_macro!(other_macro), call with: $x!();
$x:lifetime => // 'a | 'static
```
### [[Rust Proc Macro]]
