### Types
- `f16, f32, f64`, `i32, i64`, `u32, u64`
- `vec2<T>, vec3<T>, vec4<T>` aliases 
	- `vec2h vec3h vec4h`
	-  `vec2f, vec3f, vec4f`
	- `vec2i, vec3i, vec4i`
	- `vec2u, vec3u, vec4u`
- ```mat2x2<T>, mat2x3<T>, mat2x4<T>
   mat3x2<T>, mat3x3<T>, mat3x4<T>
   mat4x2<T>, mat4x3<T>, mat4x4<T>``` + aliases like `mat2x2f`
- `atomic<i32>, atomic<u32>`
- `array<T,N>`
- `struct`
##### Texture Types
- `texture_1/2/3d<T>, texture_2d_array<T>` 
- `texture_cube<T>, texture_cube_array<T>`
- `texture_storage_1/2/3d<Format, Access> 
  `texture_storage_2d_array<Format, Access>`
- `texture_multisampled_2d<T>, texture_depth_multisampled_2d`
- `texture_external<T>`
- `texture_depth_2d, texture_depth_2d_array
  `texture_depth_cube, texture_depth_2d_array`
- `sampler, sampler_comparison`
### Keywords
- `var/let/const/ptr`
- `@group/@binding` descriptor set and it's binding
- `@location` vertex attrib location
- `@builtin` variable
- `@workgroup_size`
- `@vertex/@fragment/@compute`
- `@align/@size/@offset`
- `@interpolate`
- `@id` pipeline const id
- `override` pipeline overridable consts
### Var Types
- `var<uniform>`
- `var<storage>, var<storage, read_write>`
- `var<workgroup>` shared in workgroup
- `var<private>` shared in same invocation
- `var<function>` shared in same invocation
- `var<handle>`
### Interpolation
``` python
@interpolate(perspective)
@interpolate(linear)
@interpolate(flat) # frag color from vert's col
@interpolate(center) # pixel center interpolation
@interpolate(centroid) #
@interpolate(sample)
@interpolate(first) # frag col from 1st vert col
@interpolate(either) # frag col from 1st or last vert col
```
### Builtin
``` python
# Vertex
@builtin(vertex_index) vert_in: u32
@builtin(instance_index) vert_in: u32
@builtin(clip_distances) vert_out: array<f32, N <= 8>
# Fragment
@builtin(position): vert_out_frag_in: vec4f
@builtin(front_facing): frag_in: bool
@builtin(frag_depth): frag_out: f32
@builtin(sample_index): frag_in: u32
@builtin(sample_mask): frag_inout: u32
# Compute
@builtin(local_invocation_id): comp_in: vec3u
@builtin(local_invocation_index): comp_in: u32
@builtin(global_invocation_id): comp_in: vec3u
@builtin(workgroup_id): comp_in: vec3u
@builtin(num_workgroups): comp_in: vec3u
# global_invocation_id = workgroup_id * @workgroup_size + local_invocation_id
```
### Functions
``` c
# Bit
bitcast, countLeadingZeros, countOneBits, countTrailingZeros, extractBits, firstLeadingBit, firstTrailingBit, insertBits, reverseBits
# Bool  
all, any, select
# Arr
arrayLength
# Mat
determinant, transpose
# Trig
acos, acosh, sin, sinh, asin, asinh, tan, tanh, atan, atanh, atan2, cos, cosh
# Float 
floor, round, ceil, sign, fma, fract, frexp, modf, quantizeToF16, trunc
# Math
abs, degrees, exp, exp2, faceForward, inverseSqrt, ldexp, log, log2, max, min, pow, radians, smoothstep, sqrt, step, clamp, saturate
# Vec
dot, dot4U8Packed, dot4I8Packed, cross, length, normalize, reflect, refract, distance
# Deriv
dpdx, dpdxCoarse, dpdxFine, dpdy, dpdyCoarse, fwidth, fwidthCoarse, fwidthFine
# Tex
textureDimensions, textureNumLayers, textureNumSamples
textureSample, textureSampleBias, textureSampleCompare, textureSampleCompareLevel, textureSampleGrad, textureSampleLevel, textureSampleBaseClampToEdge
textureGather, textureGatherCompare
textureLoad, textureStore
# Atomic
atomicLoad, atomicStore, atomicAdd, atomicSub, atomicMax, atomicMin, atomicAnd, atomicOr, atomicXor, atomicExchange, atomicCompareExchangeWeak
# Pack
pack4x8snorm, pack4x8unorm, pack4xI8, pack4xU8, pack4xI8Clamp, pack4xU8Clamp, pack2x16snorm, pack2x16unorm, pack2x16float
# Sync
storageBarrier, textureBarrier, workgroupBarrier, workgroupUniformLoad
```
> [!note]
> - `frexp` divides float into exponent and fractional parts
> - `ldexp` inverse of `frexp`, creates float from exp and frac parts
> - `trunc` uint part of float
> - `workgroupBarrier` wait for all local mem ops to complete
> - `storageBarrier` ensure storage buf writes are visible
### Alignment
``` rust
struct Valid {
  a: f32,
  @align(16) b: f32 // a/b offset is 16 bytes
}

struct wrapped_f32 {
  @size(16) elem: f32
}
struct big_stride {
  a: array<wrapped_f32, 8> // stride 16
}

struct A {                                     //             align(8)  size(24)
    u: f32,                                    // offset(0)   align(4)  size(4)
    v: f32,                                    // offset(4)   align(4)  size(4)
    w: vec2<f32>,                              // offset(8)   align(8)  size(8)
    x: f32                                     // offset(16)  align(4)  size(4)
    // -- implicit struct size padding --      // offset(20)            size(4)
}

struct B {                                     //             align(16) size(160)
    a: vec2<f32>,                              // offset(0)   align(8)  size(8)
    // -- implicit member alignment padding -- // offset(8)             size(8)
    b: vec3<f32>,                              // offset(16)  align(16) size(12)
    c: f32,                                    // offset(28)  align(4)  size(4)
    d: f32,                                    // offset(32)  align(4)  size(4)
    // -- implicit member alignment padding -- // offset(36)            size(4)
    e: A,                                      // offset(40)  align(8)  size(24)
    f: vec3<f32>,                              // offset(64)  align(16) size(12)
    // -- implicit member alignment padding -- // offset(76)            size(4)
    g: array<A, 3>,    // element stride 24       offset(80)  align(8)  size(72)
    h: i32                                     // offset(152) align(4)  size(4)
    // -- implicit struct size padding --      // offset(156)           size(4)
}
```
### Weird Stuff
``` rust
alias Arr = array<i32, 5>;
@must_use // must use return value
fn my_fn() -> i32 { return 0; }
```
