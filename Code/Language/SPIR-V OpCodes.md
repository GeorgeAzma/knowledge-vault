##### Types
``` rust
OpTypeVoid
OpTypeBool
OpTypeInt
OpTypeFloat
OpTypeVector
OpTypeMatrix
OpTypeArray
OpTypeRuntimeArray
OpTypeStruct
OpTypePointer
OpTypeFunction
```
##### Constants
``` rust
OpConstant
OpConstantTrue
OpConstantFalse
OpConstantComposite
OpUndef
```
##### Variables
``` rust
OpVariable
OpLoad
OpStore
OpAccessChain
```
##### Functions
``` rust
OpFunction
OpFunctionParameter
OpFunctionEnd
OpReturn
OpReturnValue
```
##### Control Flow
``` rust
OpLabel
OpBranch
OpBranchConditional
OpSelectionMerge
OpLoopMerge
```
##### Comparison
``` rust
OpIEqual
OpINotEqual
OpSLessThan
OpSGreaterThan
OpFOrdLessThan
OpLogicalAnd
OpLogicalOr
OpLogicalNot
```
##### Arithmetic
``` rust
// Int
OpIAdd
OpISub
OpIMul
OpSDiv

// Float
OpFAdd
OpFSub
OpFMul
OpFDiv
```
##### Conversions
``` rust
OpBitcast
OpSConvert
OpFConvert
OpIToF
OpFToI
```
