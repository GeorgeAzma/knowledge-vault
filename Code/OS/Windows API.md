### [[Windows API Types|Types]]
### [[Windows API Structs|Structs]]
### [[Windows API Functions|Functions]]
##### Other
``` python
CALLBACK, WINAPI # __stdcall
```
### Creating Window
``` c++
#include <windows.h>

LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    switch (msg)
    {
    case WM_CLOSE:
        DestroyWindow(hwnd);
        break;
    case WM_DESTROY:
        PostQuitMessage(0);
        break;
    default:
        return DefWindowProc(hwnd, msg, wParam, lParam);
    }
    return 0;
}

//                 current exe handle   previous exe handle      cmd args char*
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
    WNDCLASSW wnd_class{
        .style = CS_HREDRAW | CS_VREDRAW,
        .lpfnWndProc = WndProc,
        .hInstance = hInstance,
        .lpszClassName = L"MyWindowClass",
    };
    RegisterClassW(&wnd_class);

    int x = 400;
    int y = 200;
    int width = 800;
    int height = 800;
    auto hwnd = CreateWindowExW(0, L"MyWindowClass", L"MyWindow", WS_OVERLAPPEDWINDOW | WS_VISIBLE, x, y, width, height, NULL, NULL, hInstance, NULL);

    MSG msg;
    while (GetMessageW(&msg, NULL, 0, 0)) {
        TranslateMessage(&msg); // generates WM_CHAR from WM_KEYDOWN
        DispatchMessageW(&msg);
    }

    return 0;
}
```
### Useful
- https://microsoft.github.io/windows-rs/features/#/0.62.0
``` rust
// repaint
unsafe { InvalidateRect(hwnd, None, false) };

// avoid DPI scaling (blurrier text, non-physical pixel sizes)
unsafe { SetProcessDPIAware() };
```