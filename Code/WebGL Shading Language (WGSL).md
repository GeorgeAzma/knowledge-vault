### Types
- `f16, f32, f64`
- `i32, i64` 
- `u32, u64`
- `vec2<T>, vec3<T>, vec4<T>` aliases: 
	- `vec2h vec3h vec4h`
	-  `vec2f, vec3f, vec4f`
	- `vec2i, vec3i, vec4i`
	- `vec2u, vec3u, vec4u`
- ```mat2x2<T>, mat2x3<T>, mat2x4<T>
   mat3x2<T>, mat3x3<T>, mat3x4<T>
   mat4x2<T>, mat4x3<T>, mat4x4<T>``` + aliases like mat2x2f
- `atomic<i32>, atomic<u32>`
- `array<T,N>`
- `struct`
### Keywords
- `var`: Like `let mut` in rust
- `let`: Like `let` in rust
- `const`: Like `const` in rust, can be outside of functions
### Functions
- `bitcast, countLeadingZeros, countOneBits, countTrailingZeros, extractBits, firstLeadingBit, firstTrailingBit, insertBits, reverseBits`
- `all, any, select`
- `arrayLength`
- `determinant, transpose`
- `acos, acosh, sin, sinh, asin, asinh, tan, tanh, atan, atanh, atan2, ceil, clamp, cos, cosh`
- `abs, degrees, exp, exp2, faceForward, floor, fma, fract, frexp, inverseSqrt, ldexp, log, log2, max, min, modf, pow, quantizeToF16, radians, round, saturate, sign, smoothstep, sqrt, step, trunc`
- `dot, dot4U8Packed, dot4I8Packed, cross, length, normalize, reflect, refract, distance`
- `dpdx, dpdxCoarse, dpdxFine, dpdy, dpdyCoarse, fwidth, fwidthCoarse, fwidthFine`
- `textureDimensions, textureGather, textureGatherCompare, textureLoad, textureNumLayers, textureNumSamples, textureSample, textureSampleBias, textureSampleCompare, textureSampleCompareLevel, textureSampleGrad, textureSampleLevel, textureSampleBaseClampToEdge, textureStore`
- `atomicLoad, atomicStore, atomicAdd, atomicSub, atomicMax, atomicMin, atomicAnd, atomicOr, atomicXor, atomicExchange, atomicCompareExchangeWeak`
- `pack4x8snorm, pack4x8unorm, pack4xI8, pack4xU8, pack4xI8Clamp, pack4xU8Clamp, pack2x16snorm, pack2x16unorm, pack2x16float` They all have `unpack<X>`
- `storageBarrier, textureBarrier, workgroupBarrier, workgroupUniformLoad`

> [!note]
> - `frexp`: Divides float into exponent and fractional parts
> - `ldexp`: Inverse of `frexp`, creates float from exponent and fractional parts
> - `trunc`: Unsigned integer part of float
