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

; Initialize GDI+ once at startup
gdipToken := 0
gdipInput := Buffer(16, 0)
NumPut("uint", 1, gdipInput, 0)
DllCall("LoadLibrary", "str", "gdiplus")
DllCall("gdiplus\GdiplusStartup", "ptr*", &gdipToken, "ptr", gdipInput, "ptr", 0)

#HotIf WinActive("ahk_class CabinetWClass")
^v:: {
    ; Check if clipboard has an image
    if !DllCall("IsClipboardFormatAvailable", "uint", 2)
    && !DllCall("IsClipboardFormatAvailable", "uint", 8) {
        Send "^v"
        return
    }

    ; Get current Explorer path
    hwnd := WinExist("A")
    active_window := ""
    for window in ComObject("Shell.Application").Windows() {
        try {
            if window.hwnd == hwnd {
                active_window := window
                break
            }
        }
    }
    if !active_window {
        Send "^v"
        return
    }
    explorer_path := active_window.Document.Folder.Self.Path

    timestamp := FormatTime(, "yyyy-MM-dd_HH-mm-ss")
    savePath := explorer_path . "\Screenshot_" . timestamp . ".webp"

    ; Save clipboard image via GDI+ (no PowerShell)
    DllCall("OpenClipboard", "ptr", 0)
    hBitmap := DllCall("GetClipboardData", "uint", 2, "ptr")
    DllCall("CloseClipboard")

    pBitmap := 0
    DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "ptr", hBitmap, "ptr", 0, "ptr*", &pBitmap)

    CLSID := Buffer(16)
    DllCall("ole32\CLSIDFromString", "str", "{557CF406-1A04-11D3-9A73-0000F81EF32E}", "ptr", CLSID)
    DllCall("gdiplus\GdipSaveImageToFile", "ptr", pBitmap, "wstr", savePath, "ptr", CLSID, "ptr", 0)

    DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)

    active_window.Refresh()
}
#HotIf

^!Up::ChangeScreenOrientation(0)      ; Landscape (Default)
^!Down::ChangeScreenOrientation(180)  ; Landscape Flipped
^!Left::ChangeScreenOrientation(90)   ; Portrait
^!Right::ChangeScreenOrientation(270) ; Portrait Flipped

ChangeScreenOrientation(Orientation := 0) {
    static DEVMODE, width, height
    
    if !IsSet(DEVMODE) {
        DEVMODE := Buffer(220, 0)
        NumPut("short", 220, DEVMODE, 68) ; Set dmSize
        
        DllCall("EnumDisplaySettingsW", "ptr", 0, "int", -1, "ptr", DEVMODE)
        
        n1 := NumGet(DEVMODE, 172, "uint")
        n2 := NumGet(DEVMODE, 176, "uint")
        
        if n1 > n2 {
            width := n1, height := n2
        } else {
            width := n2, height := n1
        }
    }
    
    switch Orientation, 0 {
        case "Landscape", 0:             
            i := 1, mode := 0
        case "Portrait", 90:             
            i := 2, mode := 1
        case "Landscape (flipped)", 180: 
            i := 1, mode := 2
        case "Portrait (flipped)", 270:  
            i := 2, mode := 3
        default:                         
            i := 1, mode := 0
    }
    
    NumPut("uint", i = 1 ? width : height, DEVMODE, 172) ; dmPelsWidth
    NumPut("uint", i = 2 ? width : height, DEVMODE, 176) ; dmPelsHeight
    NumPut("uint", mode, DEVMODE, 84)                    ; dmDisplayOrientation

    DllCall("ChangeDisplaySettingsW", "ptr", DEVMODE, "uint", 0)
}
```
