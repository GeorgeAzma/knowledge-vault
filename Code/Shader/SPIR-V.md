- In SPIR-V variables can only be modified through pointers
### [[SPIR-V Examples]]

### [[SPIR-V OpCodes]]
### Instructions
``` rust
%1 = OpTypeInt 32 1 // defines 32 bit signed(1) int type
struct Instruction {
    class: &spirv::grammar::OP_TYPE_INT
    result_type: None,  // types don't have result type
    result_id: Some(1), // %1
    operands: vec![
        Operand::LiteralInt32(32), // bit width
        Operand::LiteralInt32(1),  // signed
    ]
}

%2 = OpConstant %1 42 // const %2: %1 = 42;
struct Instruction {
    class: &grammar::OP_CONSTANT,
    result_type: Some(1),        // %1 (int type)
    result_id: Some(2),          // %2
    operands: vec![
        Operand::LiteralInt32(42),
    ],
}
```
