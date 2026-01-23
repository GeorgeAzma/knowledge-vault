### Useful
- `o,O` insert to next/prev line
- `vib,viB,vit` select everything inside block `()`/`{}`/`<>`
- `vab,vaB,vat` select whole block `()`/`{}`/`<>, including braces`
- `VaB` select whole function
- `"+y` copy to clipboard `gg"+yG` copies entire file
### Global
- `:h` Help
- `:sav file` Save file as
- `:clo` Close curr pane
- `:ter` Open terminal window
- `K` open documentation for word under cursor
### Cursor
- `h,l,j,k` Left/Right/Down/Up
- `-,+` Down/Up line at first non-blank char
- `^,g_` First/Last non-blank char of line
- `0,$` Start/end of line
- `w,e` Forward to start/end of word 
	- `W,E` Words can contain punctuation
- `b,ge` Backward to start/end of word
	- `B,gE` Words can contain punctuation
- `5gg,5G` Line 5
- `gg,G` First/Last line of document
- `H,M,L` Top/Middle/Bottom of screen
- `%` Matching char
- `gd,gD` Local/Global declaration
- `fx,Fx` Next/Prev char `x`
- `tx,Tx` Before/After next/prev char
- `; and ,` Repeat prev `f,t,F,T` movement forwards/backwards
- `},{` Next/Prev block/paragraph
- `zz,zt,zb` Center/Top/Bottom of screen
- `Ctrl+e,y` Down/Up line
- `Ctrl+b,f` Down/Up page
- `Ctrl+d,u` Cursor and Screen Down/Up half page
> [!tip] Prefix with number to repeat $n$ times `4j`
### Insert
- `i,a` Before/After cursor
- `I,A` Start/End of line
- `o/O` Below/Above current line
- `ea` End of word
### During Insert Mode
- `Esc,Ctrl+C` Exit insert mode
- `Ctrl+h` Delete char before cursor
- `Ctrl+w` Delete word before cursor
- `Ctrl+j` Add line break at cursor
- `Ctrl+t,d` Indent/Deindent line
- `Ctrl+n/p` Autocomplete curr/prev match before cursor
- `Ctrl+rx` Insert contents of register `x`
- `Ctrl+ox` Do 1 normal-mode command
### Editing
- `u` Undo
- `U` Undo last changed line
- `Ctrl+r` Redo
- `.` Repeat last command
- `r` Replace char
- `R` Replace chars until ESC is pressed
- `J,gJ` Join line below to curr line with space/no space
- `ciw` Replace word
- `cc` replace line
- `g~,gu,gU` Change to invert/lower/upper case
- `c$,C` Replace till the end of the line
- `cw,ce` Replace till end of word
- `s,S` Delete char/line and substitute text
- `gwip` Reflow paragraph `fit to some width`
### Copy/Paste
- `yy` Copy line
- `5yy` Copy 5 lines
- `yw` Copy word
- `yiw` Copy word at cursor
- `yaw` Copy word at cursor and space before/after it
- `y$,Y` Copy end of line
- `p,P` Paste After/Before cursor
- `gp,gP` Paste before/after cursor and goto end of new text
- `dd` Cut line
- `5dd` Cut 5 lines
- `dw` Cut word
- `diw` Cut word under cursor
- `daw` Cut word under cursor and space before/after it
- `:3,5d` Delete lines from line 3 to 5
> [!tip] Use these ranges
> - `:..$d` From line to end of file 
> - `:..1d` From line to start of file
> - `:10,$d` From 10th line to start of file
- `:g/pattern/d` Delete all lines containing pattern
- `:g!/pattern/d` Delete all lines not containing pattern
- `d$,D` Cut end of line
- `x` Cut char
### Macros
- `qq` Record macro `q` 
- `q` Stop recording
- `@q` Run macro `q`
- `@@` Rerun last macro
### Indent
- `>>,<<` Indent/Deindent line
- `>%,<%` Indent/Deindent block with `()` or `{}`
- `>ib` Indent inner block with `()`
- `>at` Indent block with `<>`
- `3==` Reindent 3 lines
- `=%` Indent block with `()` or `{}`
- `=iB` Indent inner block with `{}`
- `gg=G` Indent entire file
- `]p` Paste and adjust indent
### Visual Mode
- `v` Enter visual mode
- `V` Enter linewise visual mode
- `Ctrl+v` Enter visual block mode
- `o` Goto other end of marked area
- `O` Goto other corner of block
- `aw` Mark word
- `ab,aB,at` Mark block with `()`/`{}`/`<>`
- `ib, iB, it` Mark inner block with `{}`/`{}`/`<>`
- `Esc,Ctrl+c` Exit visual mode
### Visual Commands
- `>,<` Shift text right/left
- `y` Copy marked text
- `d` Delete marked text
- `~,u,U` Change to invert/lower/upper case
### Registers
`Pasteable saved text`
- `:reg` Show registers content
- `xy` Copy into register `x`
- `xp` Paste register `x`
- `+y` Copy register to clipboard
- `+p` Paste from clipboard to register
> [!tip] Registers are saved between sessions
### Special Registers
- `0` Last copy
- `"` Unnamed register, last delete or copy
- `%` Current file name
- `#` Alternate file name
- `*` Clipboard contents (X11 primary)
- `+` Clipboard contents (X11 clipboard)
- `/` Last search pattern
- `:` Last command-line
- `.` Last inserted text
- `-` Last small (less than a line) delete
- `=` Expression register
- `_` Black hole register
### Marks
`Position in code`
- `:marks` List marks
- `ma` Set curr position as mark `a`
- \``a` Goto mark `a`
- `y`\``a` Copy text to mark `a`
- \``0` Goto where previously exited vim
- \``"` Goto where last edited this file
- \``.` Goto last change of this file
- \`\` Goto position before last jump
- `:ju` List of jumps
- `Ctrl+i` Goto newer position in jump list
- `Ctrl+o` Goto older position in jump list
- `:changes` Changes list
- `g,` Goto newer position in change list
- `g;` Goto older position in change list
- `Ctrl+]` Jump to tag under cursor
> [!tip] You can use ' instead of \` to Goto start of mark's line
### Exiting
- `:w` Save, don't exit
- `:wq,:x,ZZ` Save and exit
- `:q` Exit if saved
- `:q!,ZQ` Exit without saving
- `:wqa` Save and quit all tabs
### Search and Replace
- `/pattern,?pattern` Search next/prev pattern
- `\vpattern` Search regex pattern
- `n,N` Repeat search in same/opposite direction
- `:%s/old/new/g` Replace `old` with `new` in file
- `:%s/old/new/gc` Replace `old` with `new` in file with confirmation
- `:noh` Remov highlighting of search matches
- `:vim /pattern/ my_file` Search pattern in multiple files
- `:cn,:cp` Goto next/prev match
- `:cope` Open window containing list of matches
- `:ccl` Close quickfix window
### Tabs
- `:tabnew` Open file in new tab
- `Ctrl+wT` move curr split window into its own tab
- `gt,tabn` Next tab
- `gT,tabp` Prev tab
- `5gt` 5th tab `indexed from 0`
- `:tabm 5` Move curr tab to 5th position `indexed from 0`
- `tabc` Close tab
- `tabo` Close all tabs except current
- `:tabdo command` Run command on all tabs
### Multiple Files
- `:e` Edit a file
- `bn,bp` Goto next/prev file
- `bd` Close file
- `:b5` Goto 5th file `indexed from 0` 
- `:b file` Goto file by name
- `:ls` List all open files
- `:sp file` Open file and split window
- `:vs file` Open file and vertically split window
- `:vert ba` Edit all files as vertical windows
- `:tab ba` Edit all files as tabs
- `Ctrl+ws` Split window
- `Ctrl+wv` Split window vertically
- `Ctrl+ww` Switch windows
- `Ctrl+wq` Quit window
- `Ctrl+wx` Exchange curr window with next
- `Ctrl+w=` Make all windows equal height and width
- `Ctrl+wh,wl,wj,wk` Move cursor to left/right/bottom/top window
- `Ctrl+wH,wL` Move curr window full height at far left/right
- `Ctrl+wJ,wK` Move curr window full width at far bottop/top
### Diff
- `zf` Manually define a fold up to motion
- `zd` Delete fold under the cursor
- `za` Toggle fold under the cursor
- `zo/zc` Open/Close fold under cursor
- `zr/zm` Open/Close all folds by one level
- `zi` Toggle folding functionality
- `]c,[c` Goto start of next/prev change
- `do,:diffg` Get difference from other file
- `dp,:diffpu` Difference to other file
- `:diffthis` Make curr window part of diff
- `:dif` Update differences
- `:diffo` Switch off diff mode for curr window
