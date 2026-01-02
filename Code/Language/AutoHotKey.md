### Good Startup Script
``` c
#Requires AutoHotkey v2.0
#NoTrayIcon
#SingleInstance

; Win+Space → Toggle Always on Top
#Space:: {
    static isOnTop := false
    MouseGetPos ,, &win
    isOnTop := !isOnTop
    WinSetAlwaysOnTop isOnTop, win
}

; Win+G → Launch Chrome
#g:: Run "C:\Program Files\Google\Chrome\Application\chrome.exe"

; Win+O → Launch Obsidian
#o:: Run "C:\Users\User\AppData\Local\Programs\Obsidian\Obsidian.exe"

; Win+C → Launch VSCode
#c:: Run "C:\Users\User\AppData\Local\Programs\Microsoft VS Code\Code.exe"

; Win+T → Launch Terminal
#t:: Run "wt.exe -d ~/"

; Win+X → Close Active Window
#x:: {
    MouseGetPos ,, &win
    WinClose win
}

; Win+F → Fullscreen/Restore
#f:: {
    MouseGetPos ,, &win
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

; Vim like motions via RShift
Move(wordKey, charKey) {
    prefix := GetKeyState("LShift", "P") ? "+" : ""
    Send(GetKeyState("Ctrl", "P") ? prefix wordKey : prefix charKey)
}

RShift::Return

RShift & i::Move("{Up}", "{Up}")
RShift & k::Move("{Down}", "{Down}")

RShift & j::Move("^{Left}", "{Left}")
RShift & l::Move("^{Right}", "{Right}")

RShift & u::Move("{Home}", "{Home}")
RShift & o::Move("{End}", "{End}")

RShift & `;::Move("^{Backspace}", "{Backspace}")
RShift & p::Move("^{Delete}", "{Delete}")
```
