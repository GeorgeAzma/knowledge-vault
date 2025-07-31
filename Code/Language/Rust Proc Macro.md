#### Derive-Like Macro
example `[derive(MyMacro)]`
``` bash
cargo new my_proc_macro --lib
```
`Cargo.toml (my_proc_macro)`
``` toml
[dependencies]
syn = "2.0" 
quote = "1.0" 
proc-macro2 = "1.0"

[lib]
proc-macro = true
```
`lib.rs`
``` rust
extern crate proc_macro;
use proc_macro::TokenStream;
use syn::{parse_macro_input, DeriveInput};
use quote::quote;

#[proc_macro_derive(MyMacro)]
pub fn my_macro(input: TokenStream) -> TokenStream {
    let input = parse_macro_input!(input as DeriveInput);
    let name = &input.ident;
    let expanded = quote! {
        impl #name {
            pub fn hello() {
                println!("Hello from {}", stringify!(#name));
            }
        }
    };
    TokenStream::from(expanded)
}
```
`Cargo.toml (main)`
``` toml
workspace = { members = ["my_proc_macro"] }  

[dependencies] 
my_proc_macro = { path = "./my_proc_macro" }
```
`main.rs`
``` rust
use my_proc_macro::MyMacro;

#[derive(MyMacro)]
struct MyStruct;

fn main() {
    MyStruct::hello(); // Hello from MyStruct
}
```
### Attribute-Like Macro
`lib.rs`
``` rust
#[proc_attribute]
pub fn add_hello(_attr: TokenStream, input: TokenStream) -> TokenStream {
    let input = parse_macro_input!(input as ItemStruct);
    let struct_name = &input.ident;
    let expanded = quote! {
        #input

        impl #struct_name {
            pub fn hello() {
                println!("Hello from {}!", stringify!(#struct_name));
            }
        }
    };
    TokenStream::from(expanded)
}
```
`main.rs`
``` rust
#[add_hello] struct MyStruct;
```
### Function-Like Macro
`lib.rs`
``` rust
#[proc_macro]
pub fn my_macro(input: TokenStream) -> TokenStream {
    // Process the input token stream and return transformed tokens
    TokenStream::new() // Modified code
}
```
`main.rs`
``` rust
my_macro!{ ... }
```
