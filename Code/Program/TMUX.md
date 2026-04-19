``` bash
# sessions
tmux # new session
tmux new -s name # new named session
tmux ls # list sessions
tmux attach -t name
tmux detach
tmux kill-session -t name
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

# window
'c'   → new
'w'   → list
'n'   → next
'p'   → prev
','   → rename
'&'   → kill
'0-9' → switch

# pane
'%'   → split vertical
'"'   → split horizontal
'o'   → next
';'   → prev
'x'   → kill
'z'   → toggle zoom
'{ }' → swap
'q'   → show numbers

# copy
'['     → copy mode  
'Space' → start selection  
'Enter' → copy selection
']'     → paste buffer

# misc  
'?' → list shortcuts  
':' → command prompt
```


