### Functions
``` python
# Note: all getters have setters

# Window
CreateWindowEx
ShowWindow
UpdateWindow
DestroyWindow
MoveWindow
GetWindowText
GetWindowLong
GetWindowRect
GetClientRect
GetWindowLong
FindWindow
EnumWindows
MessageBox
GetDC # device context for drawing/screenshot
GetFocus
TrackPopupMenu # right click context menu
EnumChildWindows
GetWindowPlacement
GetWindowRgn
GetWindowsHookEx
UnhookWindowsHookEx
CallNextHookEx

# System
GetSystemMetrics
GetComputerName
GetUserName
GetVersionEx
GetNativeSystemInfo
GetLocaleInfo
GetEnvironmentVariable
GetEnvironmentStrings
FreeEnvironmentStrings
GetEnvironmentVariableW
GetSystemMenu # title bar right click menu
CloseHandle # file/thread/event HANDLE

# Clipboard
GetClipboardData
OpenClipboard
CloseClipboard
EmptyClipboard
AddClipboardFormatListener

# Cursor
GetCursorPos
ClipCursor
SetCaretPos
CreateCaret
DestroyCaret

# Keyboard
GetKeyboardState
GetAsyncKeyState
GetKeyState
MapVirtualKey
SendInput

# Message
PostMessage
SendMessage
GetMessage
PeekMessage
TranslateMessage
DispatchMessage
GetMessagePos
GetMessageTime

# File
CreateFile
ReadFile
WriteFile
DeleteFile
CopyFile
MoveFile
GetFileAttributes
FindFirstFile
FindNextFile
GetCurrentDirectory
CreateDirectory
RemoveDirectory
CreateFileMapping
MapViewOfFile
UnmapViewOfFile
FlushViewOfFile
GetVolumeInformation
SetVolumeLabel
GetLogicalDriveStrings
GetDiskFreeSpace
GetFileSize
SetFilePointer
FlushFileeBuffers
LockFile
UnlockFile
OpenFile
GetTempPath
GetSecurityInfo
GetFileInformationByHandle
GetTempFileName

# Memory
GlobalAlloc
GlobalFree
VirtualAlloc
VirtualFree

# Process
CreateProcess
ExitProcess
GetExitCodeProcess
TerminateProcess
GetCurrentProcessId
GetProcAddress
GetProcessAffinityMask
CreateProcessAsUser
OpenProcessToken
CreatePipe # interprocess communication

# Thread
Sleep
GetCurrentThreadId
GetThreadId
CreateThread
ExitThread
GetThreadContext
SuspendThread
ResumeThread
GetThreadAffinityMask
GetThreadPriority
CreateRemoteThread
PostThreadMessage
GetThreadDescription

# Sync
CreateMutex
OpenMutex
ReleaseMutex
CreateSemaphore
OpenSemaphore
ReleaseSemaphore
CreateEvent
OpenEvent
ResetEvent
WaitForSingleObject
WaitForMultipleObjects

# Time
GetSystemTime
GetLocalTime
GetTickCount
QueryPerformanceCounter
QueryPerformanceFrequency
GetTimeZoneInformation
KillTimer

# Console
ReadConsole
WriteConsole
GetConsoleMode

# DLL
GetModuleHandle
LoadLibrary
FreeLibrary
GetModuleFileNameEx

# Error
GetLastError
```