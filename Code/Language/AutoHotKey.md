### Good Startup Script
``` c
#Requires AutoHotkey v2.0
#SingleInstance

#Space:: ; Win+Space → Always on Top
{
    static isOnTop := false
    MouseGetPos ,, &win
    SetWinDelay 0
    isOnTop := !isOnTop
    WinSetAlwaysOnTop isOnTop, win
}

#g:: ; WIN+G → Launch Chrome
{
    Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
}

#o:: ; WIN+O → Launch Obsidian
{
    Run "C:\Users\User\AppData\Local\Programs\Obsidian\Obsidian.exe"
}

#c:: ; WIN+C → Launch VSCode
{
    Run "C:\Users\User\AppData\Local\Programs\Microsoft VS Code\Code.exe"
}

#t:: ; WIN+T → Launch Terminal
{
    Run "wt.exe"
}

#x:: ; WIN+X → Close Active Window
{
    MouseGetPos ,, &win
    SetWinDelay 0
    WinActivate win
    WinClose win
}

#f:: ; WIN+F → Fullscreen Window
{
    MouseGetPos ,, &win
    SetWinDelay 0
    WinActivate win
    if WinGetMinMax(win) = 1
        WinRestore win
    else
        WinMaximize win
}
```
