|  reg   |    idx     |       use       |
| :----: | :--------: | :-------------: |
| `zero` |     0      |    always  0    |
|  `at`  |     1      |    reserved     |
| `v0,1` |    2,3     | fn/expr result  |
| `a0-3` |    4-7     |     fn args     |
| `t0-9` | 8-15,24,25 |      temp       |
| `s0-7` |   16-23    |      saved      |
| `k0,1` |   26,27    | kernel reserved |
|  `gp`  |     28     | global data ptr |
|  `sp`  |     29     |    stack ptr    |
|  `fp`  |     30     |    frame ptr    |
|  `ra`  |     31     |    ret addr     |

### Opcodes
``` rust
enum Op {
    R = 0x00,     // R-type instrs have opc 0
    J = 0x02,     // pc = addr
    JAL = 0x03,   // $ra = pc + 8, pc = addr
    BEQ = 0x04,   // if ($s == $t) pc += SE(imm)
    BNE = 0x05,   // if ($s != $t) pc += SE(imm)
    ADDI = 0x08,  // $t = $s + SE(imm)
    ADDIU = 0x09, // $t = $s + SE(imm) (unsigned)
    SLTI = 0x0A,  // $t = ($s < SE(imm)) ? 1 : 0 (signed)
    SLTIU = 0x0B, // $t = ($s < SE(imm)) ? 1 : 0 (unsigned)
    ANDI = 0x0C,  // $t = $s & ZE(imm)
    ORI = 0x0D,   // $t = $s | ZE(imm)
    XORI = 0x0E,  // $t = $s ^ ZE(imm)
    LUI = 0x0F,   // $t = SE(mem[$s + SE(imm)])
    LW = 0x23,    // $t = mem[$s + SE(imm)]
    SW = 0x2B,    // mem[$s + SE(imm)] = $t
}
// R-type fn codes
enum Funct {
    SLL = 0x00,  // $t = $s << shamt
    SRL = 0x02,  // $t = $s >> shamt (logical)
    SRA = 0x03,  // $t = $s >> shamt (arithmetic)
    SLLV = 0x04, // $d = $t << $s
    SRLV = 0x06, // $d = $t >> $s (logical)
    SRAV = 0x07, // $d = $t >> $s (arithmetic)
    JR = 0x08,   // pc = $s
    JALR = 0x09, // $ra = pc + 4, pc = $s
    ADD = 0x20,  // $d = $s + $t
    ADDU = 0x21, // $d = $s + $t (unsigned)
    SUB = 0x22,  // $d = $s - $t
    AND = 0x24,  // $d = $s & $t
    OR = 0x25,   // $d = $s | $t
    XOR = 0x26,  // $d = $s ^ $t
    NOR = 0x27,  // $d = ~($s | $t)
    SLT = 0x2A,  // $d = ($s < $t) ? 1 : 0 (signed)
    SLTU = 0x2B, // $d = ($s < $t) ? 1 : 0 (unsigned)
}
// Note: there are more for different versions of MIPS
```
### Instruction Types
**R-type** reg2reg `op[6] | rs[5] | rt[5] | rd[5] | sa[5] | fn[6]`
**I-type** imm ops `op[6] | rs[5] | rt[5] | imm[16]`
**J-type** jmp ops `op[6] | addr[26]`
`note: rs / rt reversed in asm`
### Pipeline Stages
- **IF** instruction fetch
- **ID** instruction decode
- **EX** execute
- **MEM** mem access
- **WB** write back
### Op Cycles
- `MUL 3`
### Syscall

| Sysc |    Purpose    |                           Args                           |               Ret               |
| :--: | :-----------: | :------------------------------------------------------: | :-----------------------------: |
|  1   |   print int   |                        `a0: int`                         |                                 |
|  2   |  print float  |                       `a0: float`                        |                                 |
|  3   | print double  |                       `a0: double`                       |                                 |
|  4   |   print str   |                    `a0: asciiz addr`                     |                                 |
|  5   |   read int    |                                                          |            `v0: int`            |
|  6   |  read float   |                                                          |           `f0: float`           |
|  7   |  read double  |                                                          |          `f0: double`           |
|  8   |   read str    |                 `a0: buf` <br>`a1: len`                  |           `v0: asiiz`           |
|  9   | alloc `sbrk`  |                       `a0: bytes`                        |           `v0: addr`            |
|  10  |     exit      |                                                          |                                 |
|  11  |  print char   |                        `a0: char`                        |                                 |
|  12  |   read char   |                                                          |           `v0: char`            |
|  13  |   open file   |      `a0: asciiz addr`<br>`a1: flags`<br>`a2: mode`      | `v0: file desc`<br>`neg if err` |
|  14  |   read file   | `a0: file desc`<br>`a1: in buf addr`<br>`a2: max chars`  |      `v0: num chars read`       |
|  15  |  write file   | `a0: file desc`<br>`a1: out buf addr`<br>`a2: num chars` |     `v0: num chars written`     |
|  16  |  close file   |                        `a0: file`                        |                                 |
|  17  | exit via code |                     `a0: exit code`                      |                                 |
### Other Instructions
``` r
mul $s $t # stores in lo/hi registers
mflo $d # lower 32 bits
mfhi $d # higher 32 bits

div $s $t
```
### Tips
- Loading 32 bit immediate number `simulating li`
``` r
lui $t0, 0
ori $t0, $zero, 10
```
