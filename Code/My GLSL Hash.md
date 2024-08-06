I call it Fi Hash `for float-int hash`
``` c
// My Hash
// Pros:
// - 30% faster than "hash without sine" 
// - Reliable for small/huge numbers
// - Probably reliable across hardware
// Cons:
// - 20% slower "sin hash"
// - Correlation/Artifacts for tiny deltas (visible at "uv + time * 1e-4")
// - Uses ints, which is not supported by old GLSL/Hardware
// - Needs testing (multiplication is slow)

// Sin Hash
// Pros:
// - Very Fast
// - Supported by most hardware
// Cons:
// - Bad for low precision hardware (Mac, mobile)
// - Bad for small/big inputs

// Hash Without Sine
// Pros:
// - Reliable across hardware
// - Supported by most hardware
// Cons:
// - Bad for small/huge inputs
// - Slow
float hash12(vec2 p) {
    uvec2 u = floatBitsToUint(p) * uvec2(2597334677, 3812015801);
    return float((u.x ^ u.y) * 2597334677u) / float(~0u);
}

vec2 hash22(vec2 p) {
    uvec2 u = floatBitsToUint(p) * uvec2(2597334677, 3812015801);
    return vec2((u ^ u.yx) * uvec2(2597334677, 3194254219)) / float(~0u);
}

float hash11(float p) {
    uint u = floatBitsToUint(p) * 2597334677u;
    return float(u * u * 2597334677u) / float(~0u);
}
```
```
