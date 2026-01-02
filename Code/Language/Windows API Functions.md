``` cpp
GetModuleHandle(NULL): HINSTANCE; // exe handle
LoadLibrary(L"MyLibrary.dll"): HMODULE; // dll handle

LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam) {
    switch (msg) {
        case WM_CLOSE: // Window close button clicked
            PostQuitMessage(0); // Tell Windows to quit
            break;
        case WM_DESTROY:
            break;
        default:
            return DefWindowProc(hwnd, msg, wParam, lParam);
    }
    return 0;
}

```
### Window
##### Create
``` cpp
RegisterClass(lpWndClass) // register window class
RegisterClassEx(lpWndClassEx) // includes icon, small icon, extra memory

CreateWindow(LPCWSTR lpClassName, LPCWSTR lpWindowName, DWORD dwStyle, 
    int x, int y, int nWidth, int nHeight, HWND hWndParent, HMENU hMenu, 
    HINSTANCE hInstance, LPVOID lpParam)    
CreateWindowEx(..., DWORD dwExStyle)

DestroyWindow(HWND) // close/destroy window
```
##### Update
``` cpp
ShowWindow(HWND, int nCmdShow)
UpdateWindow(HWND) // forces WM_PAINT to redraw window immediately
GetWindowText(HWND, LPCWSTR) // get title
SetWindowText(HWND, LPCWSTR) // change title
MoveWindow(HWND, int X, int Y, int nWidth, int nHeight, BOOL bRepaint) // move/resize
SetWindowPos(HWND, HWND hWndInsertAfter, int X, int Y, int cx, int cy, UINT uFlags)
```
### Message
``` cpp
// get next message from the queue, blocks until a message is available
GetMessage(LPMSG, HWND, UINT wMsgFilterMin, UINT wMsgFilterMax)
// check next message without blocking
PeekMessage(LPMSG, HWND, UINT wMsgFilterMin, UINT wMsgFilterMax, UINT wRemoveMsg)
TranslateMessage(const MSG* lpMsg) // convert keyboard messages to WM_CHAR
DispatchMessage(const MSG* lpMsg) // send message to window procedure "WndProc"
PostMessage(HWND, UINT Msg, WPARAM, LPARAM) // Posts message to window async
PostMessage(HWND, UINT Msg, WPARAM, LPARAM): LRESULT // Posts message to window sync
```