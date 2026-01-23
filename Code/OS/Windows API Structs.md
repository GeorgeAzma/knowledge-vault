##### Structs
``` c++
struct WNDCLASS {
    UINT        style;          // CS_HREDRAW | CS_VREDRAW
    WNDPROC     lpfnWndProc;    // Pointer to window procedure
    int         cbClsExtra;     // Extra bytes to allocate for class
    int         cbWndExtra;     // Extra bytes to allocate for window instance
    HINSTANCE   hInstance;      // Application instance handle
    HICON       hIcon;          // Icon
    HCURSOR     hCursor;        // Cursor
    HBRUSH      hbrBackground;  // Background brush
    LPCTSTR     lpszMenuName;   // Menu resource name
    LPCTSTR     lpszClassName;  // Window class name
};

struct WNDCLASSEX : WNDCLASS {
    UINT        cbSize;           // sizeof(WNDCLASSEX)
    // ... same as WNDCLASSEX ... //
    HICON       hIconSm;          // Small icon
}

struct MSG {
    HWND   hwnd;     // Window handle
    UINT   message;  // Message ID (WM_PAINT, WM_CLOSE, etc.)
    WPARAM wParam;   // Additional message info
    LPARAM lParam;   // Additional message info
    DWORD  time;     // Timestamp
    POINT  pt;       // Mouse cursor position
};

struct POINT {
    LONG x;
    LONG y;
};

struct RECT {
    LONG left;
    LONG top;
    LONG right;
    LONG bottom;
};

struct PAINTSTRUCT {
    HDC  hdc;     // Handle to device context
    BOOL fErase;  // Whether background should be erased
    RECT rcPaint; // Rectangle to paint
    BOOL fRestore;          
    BOOL fIncUpdate;
    BYTE rgbReserved[32];
};
```
