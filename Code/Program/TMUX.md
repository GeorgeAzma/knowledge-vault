``` bash
# sessions
tmux -d # new session, -d in background
tmux new -s name # new named session
tmux ls # list sessions
tmux attach -t name
tmux detach
tmux kill-session -t name
tmux has-session -t name
tmux kill-server # kill all sessions

tmux new-window -n window-name

tmux source ~/.tmux.conf
```
### Shortcuts
``` bash
ctrl+b + 
# session
'd' → detach session  
'$' → rename
')' → next
'(' → prev
'L' → last session

# window
'c'   → new
'w'   → list
'n'   → next
'p'   → prev
','   → rename
'&'   → kill
'0-9' → switch
'f'   → find by name
'.'   → move to new index
'l'   → last window

# pane
'%'   → split vertical
'"'   → split horizontal
'o'   → next
';'   → prev
'x'   → kill
'z'   → toggle zoom
'{ }' → swap
'q'   → show numbers, press 0-9 to switch
'→'   → move to pane
'!'   → convert to window
' '   → cycle pane layout

# copy
'['      → copy mode, 'q' to quit
'Space'  → start selection  
'Enter'  → copy selection
']'      → paste buffer
'Ctrl+u' → page up
'Ctrl+d' → page down
'g'      → jump to top
'G'      → jump to bottom
'/ or ?' → search
'n'      → next match
'N'      → prev match

# misc  
'?' → list shortcuts  
':' → command prompt
```
### Config
`~/.tmux.conf`
``` bash
set -g mouse on # enable mouse support
set -g base-index 1 # 1-9 window numbering
set -g pane-base-index 1 # 1-9 pane numbering
```
