``` python
# pack
packUnorm4x8(vec4): # vec4 -> u32
    round(clamp(vec4, 0.0, 1.0) * 255.0)
    
packUnorm2x16(vec2): # vec2 -> u32
    round(clamp(vec2, 0.0, 1.0) * 65535.0)

packSnorm4x8(vec4): # vec4 -> u32
    round(clamp(f, -1.0, 1.0) * 127.0) 
    
packSnorm2x16(vec2): # vec2 -> u32
    round(clamp(f, -1.0, 1.0) * 32767.0)

packHalf2x16(vec2) # vec2 -> vec2<f16> -> u32 
packDouble2x32(u2) # uvec2 -> f64

# unpack
unpackUnorm2x16(u32) # u32 -> vec2
unpackUnorm4x8() # u32 -> vec4

unpackSnorm2x16() # u32 -> vec2
unpackSnorm4x8() # u32 -> vec4

unpackHalf2x16() # u32 -> vec2<f16> -> vec2
unpackDouble2x32() # u32 -> f64

# dot
dot4U8Packed() # uvec4 -> u32
dot4I8Packed() # ivec4 -> i32

float pack3(vec3 v) {
    v = clamp(v, vec3(0), vec3(0.998));
    return v.x + floor(v.y * 256.0) + floor(v.z * 256.0) * 256.0;
}

vec3 unpack3(float f) {
    return vec3(fract(f), fract(floor(f) / 256.0), fract(floor(f / 256.0) / 256.0));
}
```
