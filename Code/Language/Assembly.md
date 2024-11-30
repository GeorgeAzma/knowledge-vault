
|    reg    |      name      |             usage              | preserved <br>across <br>fn calls |
| :-------: | :------------: | :----------------------------: | :-------------------------------: |
|   `rax`   |  accumulator   |   arithm op, I/O, return val   |                No                 |
|   `rbx`   |      base      |        general-purpose         |              Yes<br>              |
|   `rcx`   |     count      | loop/shift counter \| 1 fn arg |                No                 |
|   `rdx`   |      data      |   I/O, arithm op \| 2 fn arg   |                No                 |
|   `rsi`   |    src idx     |     src idx \| 6th fn arg      |                No                 |
|   `rdi`   |    dst idx     |     dst idx \| 5th fn arg      |                No                 |
|   `rsp`   |   stack ptr    |        -> top of stack         |                Yes                |
|   `rbp`   | base stack ptr |        -> base of stack        |                Yes                |
|  `r8-12`  |    general     |           3-7 fn arg           |                No                 |
| `r13-15`  |    general     |          8-10 fn arg           |                Yes                |
|   `rip`   |   instr ptr    |      -> next instruction       |                Yes                |
| `xmm0-15` |  `f128` SIMD   |              SSE               |                No                 |
| `ymm0-15` |  `f256` SIMD   |              AVX               |                No                 |
| `zmm0-31` |  `f512` SIMD   |            AVX-512             |                No                 |
| `rflags`  |     flags      |          saves flags           |                No                 |
##### Accessing lower bits of regs
- `32 bit = eax, ebx, r8d, r14d...`
- `16 bit = ax,bx,r8w...`
- `8 bit = al,bl,r8b...`
- `8 bit (high) = ah,bh...`
- **Segment Registers** `cs, ds, es, ss, fs, gs`
- **Flag/Status Registers** `rflags` contains:
    - `ZF` zero
    - `SF` sign
    - `OF` overflow
    - `CF` carry
    - `PF` parity `if even 1 bits`
    - `AF` auxilary carry
    - `DF` direction
    - `TF` trab
    - `IF` interrupt
- **Control Registers** `cr0-4` `controls memory protection, paging...`
- **Debug Registers** `dr0-DR7` `breakpoints, watchpoints...`
### Windows
```
# compile .asm into .obj, plus debuginfo and warnings 
nasm -f win64 hello.asm -g -wall -o hello.obj
# link via ld
ld hello.obj -lkernel32 -luser32 -Llib -o hello.exe

# link via gcc
gcc hello.obj -lkernel32 -nostartfiles

# via msvc
link hello.obj /subsystem:windows /entry:WinMain /nodefaultlib /libpath:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64" user32.lib kernel32.lib /largeaddressaware:no

note: 
- make sure windows sdk bin/lib is in path
- download gcc/ld via msys2 + winget and delete it later
- required libs for self contained nasm/ld compilation:
    ld.exe, nasm.exe, zlib1.dll, libzstd.dll, 
    libwinpthread-1.dll, libintl-8.dll, libiconv-2.dll
    (optionals from winapi) kernel32.lib, user32.lib
```
`hello.asm`
``` c
default rel         ; Use RIP-relative addressing like [rel msg] by default
extern ExitProcess  ; external functions in system libraries 
extern MessageBoxA
extern GetStdHandle
extern CreateFileA
extern WriteFile

%macro message_box 2 ; msg, title
    mov rcx, 0       ; hWnd = HWND_DESKTOP
    lea rdx,[%1]    ; LPCSTR lpText
    lea r8,[%2]   ; LPCSTR lpCaption
    mov r9d, 0       ; uType = MB_OK
    call MessageBoxA          
%endmacro

%macro strlen 1 ; str_ptr -> strlen: rdi
    xor al, al
    lea rdi, %1
    repne scasb
    lea rax, %1
    sub rdi, rax
%endmacro

; print with length
%macro print 2 ; (bytes, len) [rcx, rdx, rax, r8, r9]
    mov rcx, [stdout]
    lea rdx, %1 ; msg
    mov r8, %2 ; msg_len
    lea r9, written
    call WriteFile
%endmacro

; print null terminated
%macro print 1 ; msg
    strlen %1
    print %1, rdi
%endmacro

%macro write_file 3; (file, bytes, len) [rcx, edx, r8, r9, rax]
    lea rcx, %1 ; file name
    mov edx, 0x40000000 ; write access
    mov r8, 0 ; share mode
    mov r9, 0 ; security attribs
    mov dword [rsp+0x20], 2 ; always create
    mov dword [rsp+0x28], 0x80 ; flag + attribs (normal)
    mov dword [rsp+0x30], 0 ; template file
    call CreateFileA

    mov rcx, rax
    lea rdx, %2
    mov r8 , %3
    xor r9 , r9
    push 0
    call WriteFile
    pop rax
%endmacro

section .data 
    filename: db 'myfile', 0
    msg: db 'hey this me massage!', 0
    msg_len: equ $ - msg - 1
    stdout: dq 0 
    written: dq 0

section .text
_start:
    ; setup console
    mov rcx, -11
    sub rsp, 28h
    call GetStdHandle
    add rsp, 28h
    mov [stdout], rax
    
    ; write_file filename, msg, msg_len

    ; for i in 0..4
    xor r12, r12
    loop_start: 
        print msg, msg_len
        inc r12
        cmp r12, 4
        jne loop_start

    xor ecx, ecx ; exit code 0
    call ExitProcess

    hlt
```
