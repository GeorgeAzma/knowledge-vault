Rust framework used for creating desktop/mobile web based apps
Similar to Electron.js

### Get Started:
- `cargo install create-tauri-app`
- `cargo create-tauri-app`
- Choose JS/TS or Rust
- Choose a Framework:
	- Rust: Vanilla, Yew, Leptos, Sycamore
	- JS/TS: 
		- Choose Package Manager: pnpm, yarn, npm, bun
		- Choose Framework: Vanilla, Vue, Svelte, React, Solid, Angular, Preact
		- Choose UI flavor: TypeScript, JavaScript
		- Run `npm i` or similar
- `npm run tauri dev` 

#### Add Rust Commands:
``` rust
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

#[tauri::command]
fn greet(name: &str) -> String {
    format!("Hello, {}! You've been greeted from Rust!", name)
}

fn main() {
    tauri::Builder::default()
	    // Make sure command is included in this list
        .invoke_handler(tauri::generate_handler![greet])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
```
#### Run Rust Commands From JS/TS
``` js
import { invoke } from "@tauri-apps/api/tauri";
invoke<ReturnVal>("greet", { param1, param2 }).then((returned) => {
	// Do something with returned
});
```
> [!example]
> ``` Rust
> fn minimize_window(window: tauri::Window) {
>     window.minimize().unwrap();
> }
> 
> fn drag_window(window: tauri::Window, x: i32, y: i32) {
>     let pos = window.inner_position().unwrap();
>     window
>         .set_position(tauri::PhysicalPosition::new(pos.x + x, pos.y + y))
>         .unwrap();
> }
> ```

> [!example] `Tauri.conf`
> ``` json
> {
>   "build": {
>     "beforeDevCommand": "npm run dev",
>     "beforeBuildCommand": "npm run build",
>     "devPath": "localhost:1420",
>     "distDir": "../dist",
>     "withGlobalTauri": false
>   },
>   "package": {
>     "productName": "tauri-app",
>     "version": "0.0.0"
>   },
>   "tauri": {
>     "allowlist": {
>       "all": false,
>       "shell": {
>         "all": false,
>         "open": true
>       }
>     },
>     "bundle": {
>       "active": true,
>       "targets": "all",
>       "identifier": "com.tauri-app.george-azma",
>       "icon": [ "icons/icon.ico" ]
>     },
>     "security": {
>       "csp": null
>     },
>     "windows": [
>       {
>         "fullscreen": false,
>         "resizable": true,
>         "title": "tauri-app",
>         "width": 800,
>         "height": 600
>       }
>     ]
>   }
> }
> ```
