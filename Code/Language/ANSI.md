---
aliases:
  - Console Color
  - Console Clear Line
  - Console Background Color
---
### Clearing
- `\x1b[K` clear cursor to EoL
- `\x1b[1K` clear SoL to cursor
- `\x1b[2K` clear line
### Color
- foreground `\x1b[38;2;255;0;0m<My Text>\x1b[0m` sets `<My Text>` to `rgb(255,0,0)` 
- background `\x1b[48;2;255;0;0m<My Text>\x1b[0m`
``` powershell 
Rust console colors
\x1b[38;2;241;76;76merror\x1b[0m
\x1b[38;2;245;245;67mwarn\x1b[0m
\x1b[38;2;35;209;139msuccess\x1b[0m
\x1b[38;2;41;184;219minfo\x1b[0m
\x1b[38;2;204;204;204mtext\x1b[0m
```
### Cursor
- `\r` move cursor to SoL
- `\n` move cursor to next line
- `\r\x1b[K` move to SoL and clear
