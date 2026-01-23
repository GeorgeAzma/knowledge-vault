##### Primitives
``` python
BYTE # u8 (unsigned char)
WORD # u16 (unsinged short)
DWORD # u32 (unsinged long)
UINT # u32 (unsigned int)
ULONG # u32 (unsigned long)
ULONGLONG # u64 (unsigned long long)

CHAR # char
WCHAR # u16 (wchar_t)
SHORT # i16 (short)
INT # i32 (int)
LONG # i32 (long)
LONG LONG # i64 (long long)


UINT_PTR # usize (uint)
LONG_PTR # isize (long)

BOOL # i32 (int), FALSE=0, TRUE=!0

LPARAM # isize (message parameter)
WPARAM # usize (message parameter)

HRESULT # i32 (long), status code
LRESULT # isize (LONG_PTR), status code
ATOM # u16 ID
```
##### Handles
``` python
HWND # window handle
HINSTANCE # exe/dll handle, also called module/instance
HMODULE # dll handle
HDC # device context (drawing surface)
HBRUSH # for painting
HPEN # for drawing lines
HFONT
HMENU
HICON
HBITMAP
# generic handle (for files, events, threads)
# typedef void* HANDLE; typedef HANDLE HWND; ...
HANDLE
```
##### Pointers
``` python
# LP = long pointer
LPSTR # char*
LPCSTR # const char* ("str")
LPWSTR # wchar_t*
LPCWSTR # const wchar_t* (L"str")
LPVOID # void*
LPCVOID # const void*
```
