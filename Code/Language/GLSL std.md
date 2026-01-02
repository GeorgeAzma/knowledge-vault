``` rust
// max member aligned [16B]
// padding after each member
// array elements round up to vec4
struct std140 {
    a: f32 // 4B
    // pad 12B
    b: vec3 // 12B
    // pad 4B
    c: [f32; 3] // 16B each => 48B
    d: MyStruct // 36B
    // pad 12B
} // 128B

// max member aligned [16B]
// padding after each member
struct std430 {
    a: f32 // 4B
    // pad 12B
    b: vec3 // 12B
    // pad 4B
    c: [f32; 3] // 4B each => 12B
    // pad 4B
    d: MyStruct // 36B   
    // pad 12B
} // 96B
```

``` c
#extension GL_ARB_enhanced_layouts : enable
layout(scalar, binding=0) uniform UB {
    float a;   // 4B
    vec3 b;    // 12B
    float c;   // 4B
}; // 20B
```