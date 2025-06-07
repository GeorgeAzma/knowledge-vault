### VBS
``` vbscript
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "your-command-here", 0, False
```
### [[Powershell]]
``` powershell
Start-Process "your-program.exe" -WindowStyle Hidden
# -NoNewWindow
```
### Command Prompt
``` bash
start /B explorer C:
```
### From Explorer
``` bash
cmd /C start /B code .
```
### Rust
``` powershell
echo #![windows_subsystem = "windows"] fn main() {std::process::Command::new("explorer").arg("C:").spawn().unwrap();} > main.rs && rustc main.rs -C opt-level=3 -C link-arg=/DEBUG:NONE && del main.rs && main
```
