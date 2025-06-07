- [[Rust Macro]]
- [[Rust Print Format]]
- `std::mem::forget(obj)` don't drop when out of scope
- `core::hint::unreachable_unchecked()` guarantees compiler that code is unreachable
- `core::hint::assert_unchecked(cond)` guarantees compiler that `cond` will always be true
    - `assert!/unreachable!` causes extra panic assembly code
- extract enum tag `std::mem::discriminant()`
- rust to exe `rustc main.rs -o main.exe -C opt-level=3`
- quickly search local rust docs `$ rust docs, CTRL+F "API", CTRL+ENTER, /`
### Panic Hook `nicer errors`
``` rust
static PANIC_HOOK: std::sync::LazyLock<()> = std::sync::LazyLock::new(|| {
    fn backtrace(skips: usize) -> String {
        let mut backtrace = std::backtrace::Backtrace::force_capture()
            .to_string()
            .replace("\\", "/");
        backtrace = backtrace
            .lines()
            .filter(|l| l.contains("at ./") && l.contains("/src/"))
            .collect();
        let mut callers: Vec<String> = backtrace
            .trim()
            .replace("at ./", "")
            .split_whitespace()
            .filter_map(|s| {
                if s.is_empty() {
                    None
                } else {
                    Some(s.to_string())
                }
            })
            .rev()
            .collect();
        callers.pop();
        callers.dedup();
        if callers.is_empty() {
            callers = vec![String::new()];
        }
        callers.resize(callers.len().saturating_sub(skips + 1), String::new());
        let backtrace_str = callers.join(" > ");
        backtrace_str
    }

    std::panic::set_hook(Box::new(move |panic_info| {
        let panic = |s: &str| {
            println!(
                "panicked: \x1b[38;2;241;76;76m{s}\x1b[0m\n\x1b[2m{}\x1b[0m",
                backtrace(1)
            );
        };
        if let Some(s) = panic_info.payload().downcast_ref::<&str>() {
            panic(s);
        } else if let Some(s) = panic_info.payload().downcast_ref::<String>() {
            panic(s);
        } else {
            panic("")
        }
    }));
});
// for hooking write: *PANIC_HOOK;
```