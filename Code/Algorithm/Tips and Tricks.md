[[Design Patterns]]
- **Parse don't validate**
	Instead of checking `is_valid(password)` everytime `password` is used
	create a `Password` struct that only has a valid constructor
	and if that constructor receives invalid input it returns 
	`Result<Self, AuthError>` with `AuthErr("Invalid")`
- **Type driven design**
``` rust
struct Viewer;
struct Admin;
struct User<UserRole = Viewer> {
	state: PhantomData<UserRole> // 0 bits
}
impl User<Viewer> {
	// Note takes ownership of 'self'
	// So once 'Viewer' is promoted it can't go back
	fn promote(self) -> User<Admin>;
}

// Admin only functions
impl User<Admin> {
	fn edit(&mut self);
}
```
