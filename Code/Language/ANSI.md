---
aliases:
  - Console Color
  - Console Clear Line
  - Console Background Color
---
### Color + Style
``` powershell
# colors
\x1b[38;2;r;g;bm # 24-bit colors (foreground)
\x1b[38;2;colm # 8-bit colors (foreground)
\x1b[48;2;r;g;bm # 24-bit colors (background)
\x1b[48;2;colm # 8-bit colors (background)

# log colors
\x1b[38;2;241;76;76merror\x1b[0m
\x1b[38;2;245;245;67mwarn\x1b[0m
\x1b[38;2;35;209;139msuccess\x1b[0m
\x1b[38;2;41;184;219minfo\x1b[0m
\x1b[38;2;204;204;204mtext\x1b[0m

# attribs
\x1b[0m # reset attribs
\x1b[1m # bold
\x1b[2m # dim
\x1b[3m # italic
\x1b[4m # underline
\x1b[5m # blink
\x1b[7m # inverse
\x1b[8m # hidden
\x1b[9m # strike through
\x1b[53m # overline

# disable attribs
\x1b[21m # bold off or double underline
\x1b[22m # normal color/intensity
\x1b[23m # not italic
\x1b[24m # underline off
\x1b[25m # blink off
\x1b[27m # inverse off
\x1b[28m # unhide
\x1b[29m # unstrikethrough
\x1b[55m # overline off

# special foreground colors
\x1b[30m # black
\x1b[31m # red
\x1b[32m # green
\x1b[33m # yellow
\x1b[34m # blue
\x1b[35m # magenta
\x1b[36m # cyan
\x1b[37m # white
\x1b[90m # bright black
\x1b[91m # bright red
\x1b[92m # bright green
\x1b[93m # bright yellow
\x1b[94m # bright blue
\x1b[95m # bright magenta
\x1b[96m # bright cyan
\x1b[97m # bright white

# special background colors
\x1b[40m # black
\x1b[41m # red
\x1b[42m # green
\x1b[43m # yellow
\x1b[44m # blue
\x1b[45m # magenta
\x1b[46m # cyan
\x1b[47m # white
\x1b[100m # bright black
\x1b[101m # bright red
\x1b[102m # bright green
\x1b[103m # bright yellow
\x1b[104m # bright blue
\x1b[105m # bright magenta
\x1b[106m # bright cyan
\x1b[107m # bright white
```
### Cursor
``` powershell
\r # to start of line (SoL)
\n # to next line

# cursor position
\x1b[<n>A # up n
\x1b[<n>B # down n
\x1b[<n>C # right n
\x1b[<n>D # left by n
\x1b[<n>E # SoL + down n
\x1b[<n>F # SoL + up n
\x1b[<n>G # x=n
\x1b[H # home (0, 0)
\x1b[<x>;<y>H # row/col=x/y | same as: \x1b[<x>;<y>f
\x1b[s # save pos
\x1b[u # restore pos

# cursor
\x1b[?25l # hide cursor
\x1b[?25h # show cursor
\x1b[?12h # enable cursor blinking
\x1b[?12l # disable cursor blinking

# screen clearing
\x1b[0J # clear cursor->EoS (end of screen)
\x1b[1J # clear cursor->SoS (start of screen)
\x1b[2J # clear screen
\x1b[K # clear cursor->EoL | same as: \x1b[0K
\x1b[1K # clear cursor->SoL
\x1b[2K # clear line
```
