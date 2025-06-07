- [[RISC-V]]
- [[MIPS]]

|    reg    |      name      |              use               | preserved <br>across <br>fn calls |
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
### Instructions

|  Instruction  |            Operation            |
| :-----------: | :-----------------------------: |
|  `MOV r1 r2`  |             `r1=r2`             |
| `LEA r1 ptr`  |            `r1=ptr`             |
| `JE/JZ label` |            `if ZF=0`            |
|  `JNE label`  |           `if ZF!=0`            |
|     `JA`      |        `if ZF=0 & CF=0`         |
|  `CMP r1 r2`  |          `CF/ZF=r1-r2`          |
|     `RET`     | `rax=ret_val` <br>`pc=ret_addr` |
- `JA` used after `CMP` where `u32(r1) > u32(r2)`
- `JG` used after `CMP` where `i32(r1) > i32(r2)`
### SIMD

|  Instruction  |
| :-----------: |
|     `MOV`     |
| `ADD/SUB/MUL` |
| `AND/OR/XOR`  |
|    `SQRT`     |
|     `CMP`     |
|    `SHUF`     |
|    `BLEND`    |
|     `CVT`     |
##### Suffix
- `B 1 byte`
- `W 2 byte` word
- `D/S 4 byte` `u32/f32` or double-word/scalar
- `Q/D 8 byte` `u64/f64` or quad-word/double
- `DQ` double-quadword `u128/f128`

- `P` packed `like 4xf32`
- `S` scalar `MOVSD xmm0,` would move single double `f64` into `xmm0[0]`
- `A/U` aligned/unaligned `stored at addr that is multiple of data size`
- `H/L` high/low, for example if operating `2xf32` of `f128` 
  `L` would operate on lower half and leave upper half as is
##### Prefix
- `V 256 bit` AVX
- `P` packed
##### Examples
- `VADDPS` add `8xf32`
- `MULPD` multiply `2xf64`
- `SHUFPS xmm0, xmm1, imm8` where `xmm0 = 0123` `xmm1 = 4567`
    - `imm8 = 11_10_01_00` 
      `xmm0 = [xmm1[imm8[8:6]], xmm1[imm8[6:4]], xmm0[imm8[4:2]], xmm0[imm8[2:0]]]`
      `xmm0 = 4523 (lsb)`
- `SHUFPS xmm0, xmm0, 00_01_10_11` reverse `xmm0` 
- `PSHUFLW xmm0, xmm1, 11_00_01_01` 
  `xmm0 = [xmm1[8:4], xmm1[imm8[8:6]], xmm1[imm8[6:4]], xmm1[imm8[4:2]], xmm1[imm8[2:0]]]`
  `xmm0 = 01234766` if `xmm1 = 01234567`
- `HADDPD xmm0, xmm0` `xmm0 = xmm0[128:64] + xmm0[64:0]`
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
``` bash
# compile .asm into .obj, plus debuginfo and warnings 
nasm -f win64 hello.asm -g -wall -o hello.obj
# link via ld
ld hello.obj -lkernel32 -luser32 -Llib -o hello.exe

# link via gcc
gcc hello.obj -lkernel32 -nostartfiles

# via msvc
link hello.obj /subsystem:windows /entry:WinMain /nodefaultlib /libpath:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64" user32.lib kernel32.lib /largeaddressaware:no
```
```
note: 
- make sure windows sdk bin/lib is in path
- download gcc/ld via msys2 + winget and delete it later
- required libs for self contained nasm/ld compilation:
    ld.exe, nasm.exe, zlib1.dll, libzstd.dll, 
    libwinpthread-1.dll, libintl-8.dll, libiconv-2.dll
    (optionals from winapi) kernel32.lib, user32.lib
```
##### Using Rust
`run.bat`
```
rustc main.rs --emit=asm ^
  -C opt-level=3 ^
  -C target-cpu=native ^
  -C panic=abort ^
  -C debuginfo=0 ^
  -C strip=symbols ^
  -C codegen-units=1 ^
  -C relocation-model=static ^
  -C llvm-args="--x86-asm-syntax=intel"

REM Find the last occurrence of "my_func:" and get its line number
for /f "tokens=1,* delims=:" %%a in ('findstr /n /r "^my_func:" main.s') do (
  set lastLine=%%a
)
  
REM Extract everything from the last occurrence of "my_func:" to the end of the file
(for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" main.s') do (
  if %%a geq %lastLine% echo(%%b
)) > main_stripped.s
  
move /y main_stripped.s main.s
```
`main.rs`
``` rust
#![no_main]

#[no_mangle]
fn my_func(x: f32) -> f32 {
    x * 2.0
}
```
### Example
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
