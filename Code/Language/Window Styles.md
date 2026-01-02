``` python
WS_BORDER # thin border
WS_CAPTION # titlebar, includes WS_BORDER
WS_CHILD, WS_CHILDWINDOW # child window, no menu bar, no WS_POPUP
WS_CLIPCHILDREN # parent can't draw on children windows
WS_CLIPSIBLINGS # children can't draw on their sibling's windows
WS_DISABLED # don't receive user input, use EnableWindow()
WS_DLGFRAME # dialog box style border, no title bar
WS_GROUP # groups windows, useful when using WS_TABSTOP
WS_HSCROLL # horizontal scrollbar
WS_ICONIC # start minimized (same as WS_MINIMIZE)
WS_MAXIMIZE # start maximized
WS_MAXIMIZEBOX # have maximize button, WS_SYSMENU must be specified
WS_MINIMIZE # start minimized
WS_MINIMIZEBOX # have minimize button, WS_SYSMENU must be specified
WS_OVERLAPPED # has title bar and border (same as WS_TILED)
WS_OVERLAPPEDWINDOW # WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX (same as WS_TILEDWINDOW)
WS_POPUP # popup window
WS_POPUPWINDOW # WS_POPUP | WS_BORDER | WS_SYSMENU, WS_CAPTION must be specified to enable menu
WS_SIZEBOX # has sizing border (same as WS_THICKFRAME)
WS_SYSMENU # has menu on its title bar, WS_CAPTION must be specified
WS_TABSTOP # pressing tab gives control to another window with WS_TABSTOP
WS_THICKFRAME # has sizing border (same as the WS_SIZEBOX)
WS_TILED # has title bar and border (same as WS_OVERLAPPED)
WS_TILEDWINDOW # WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX (same as the WS_OVERLAPPEDWINDOW)
WS_VISIBLE # initially visible
WS_VSCROLL # vertical scrollbar
```
