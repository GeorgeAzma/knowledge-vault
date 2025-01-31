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

### Instruction Types
**R-type** reg2reg `op[6] | rs[5] | rt[5] | rd[5] | sa[5] | fn[6]`
**I-type** imm ops `op[6] | rs[5] | rt[5] | imm[16]`
**J-type** jmp ops `op[6] | addr[26]`
### Pipeline Stages
- **IF** instruction fetch
- **ID** instruction decode
- **EX** execute
- **MEM** mem access
- **WB** write back
`because of pipelining, `
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
### Op Cycles
- `MUL 3`