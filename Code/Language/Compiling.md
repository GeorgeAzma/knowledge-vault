### MSVC
Installed through visual studio `add to env path`
#### cl
`cl main.cpp` outputs `file.obj`
`cl main.c`
- `/O2` speed+size optimization `balanced speed/size/safety`
- `/Od` debug, no optimization
- `/Ox` max speed+size optimization `no safety features`
- `/O1` size+speed optimization
- `/Ot` max speed optimization `low regard for size`
- `/Os` size optimization `low regard for speed`
- `/Fe` output name
- `/EHsc` enable c++ exceptions
- `/Zi` add debug  info `used with /O<any>`
#### link
`link main.obj kernel32.lib assimp.dll` produces `main.exe`
- `/libpath:<path>` where to find above libs
- `/out:<out.exe>` output name
- `/subsystem:<console/windows>` windows uses `WinMain` entry point `without console`
#### lib
`lib main.obj /out:library.lib`
### GNU
#### gcc
`gcc main.c` outputs `a.out` (default executable)
- `-o <output>`
- `-O0` debug, no optimization
- `-O2` speed optimization
- `-O3` aggressive speed optimization `increases exe size`
- `-Og` release with debug
- `-g` add debug info
- `-Wall` all warnings
#### g++
`g++ main.cpp`
- `-std=c++17`
#### ld
`ld main.o -lkernel32` outputs `a.out`
- `-L<libpath>`
- `-l<libname>` `note: without file extension`
