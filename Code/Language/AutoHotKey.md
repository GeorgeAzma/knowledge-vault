### Good Startup Script
``` c
#Requires AutoHotkey v2.0
#SingleInstance

; Win+Space → Toggle Always on Top
#Space:: {
    MouseGetPos , , &win_id
    ex_style := WinGetExStyle("ahk_id " win_id)
    is_on_top := ex_style & 0x8
    WinSetAlwaysOnTop(!is_on_top, "ahk_id " win_id)
}

; Win+G → Launch Chrome
#g:: Run FindChrome()

; Win+O → Launch Obsidian
#o:: Run EnvGet("LOCALAPPDATA") "\Programs\Obsidian\Obsidian.exe"

; Win+C → Launch VSCode
#c:: Run EnvGet("LOCALAPPDATA") "\Programs\Microsoft VS Code\Code.exe"

; Win+T → Launch Terminal
#t:: Run "wt.exe -d ~"

; Win+X → Close Active Window
#x:: {
    MouseGetPos , , &win
    WinClose win
}

; Win+F → Fullscreen/Restore
#f:: {
    MouseGetPos , , &win
    if WinGetMinMax(win) = 1
        WinRestore win
    else
        WinMaximize win
}

; Win+LButton → Drag Window
#LButton:: {
    CoordMode("Mouse", "Screen")
    MouseGetPos &prevMouseX, &prevMouseY, &winID
    WinGetPos &winX, &winY, &winW, &winH, winID
    SetWinDelay -1
    while GetKeyState("LButton", "P") {
        MouseGetPos &currMouseX, &currMouseY
        dx := currMouseX - prevMouseX
        dy := currMouseY - prevMouseY
        if (dx != 0 || dy != 0) {
            winX += dx
            winY += dy
            DllCall("MoveWindow", "Ptr", winID, "Int", winX, "Int", winY, "Int", winW, "Int", winH, "Int", True)
            prevMouseX := currMouseX
            prevMouseY := currMouseY
        }
        Sleep 0
    }
}

; Win + Right Click
#RButton:: {
    CoordMode("Mouse", "Screen")
    MouseGetPos &prevMouseX, &prevMouseY, &winID
    WinGetPos &winX, &winY, &winW, &winH, winID
    SetWinDelay -1
    while GetKeyState("RButton", "P") {
        MouseGetPos &currMouseX, &currMouseY
        dx := currMouseX - prevMouseX
        dy := currMouseY - prevMouseY
        if (dx != 0 || dy != 0) {
            winW += dx
            winH += dy
            DllCall("MoveWindow", "Ptr", winID, "Int", winX, "Int", winY, "Int", winW, "Int", winH, "Int", True)
            prevMouseX := currMouseX
            prevMouseY := currMouseY
        }
        Sleep 1
    }
}

#Escape:: {
    Shutdown 1
}

FindChrome() {
    paths := []

    try paths.Push(RegRead("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe"))
    try paths.Push(RegRead("HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe"))

    paths.Push(EnvGet("ProgramFiles") "\Google\Chrome\Application\chrome.exe")
    paths.Push(EnvGet("ProgramFiles(x86)") "\Google\Chrome\Application\chrome.exe")

    paths.Push("msedge.exe")

    for p in paths
        if FileExist(p)
            return p

    return "chrome.exe"
}
```
