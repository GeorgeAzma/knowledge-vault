I call it Fi Hash `for float-int hash`
``` c
float hash11(float p) {
    uint u = floatBitsToUint(p * 3141592653.0);
    return float(u * u * 3141592653u) / float(~0u);
}

float hash12(vec2 p) {
    uvec2 u = floatBitsToUint(p * vec2(141421356, 2718281828));
    return float((u.x ^ u.y) * 3141592653u) / float(~0u);
}

vec2 hash22(vec2 p) {
    uvec2 u = floatBitsToUint(p * vec2(141421356, 2718281828));
    return vec2((u ^ u.yx) * uvec2(1618033988, 2718281828)) / float(~0u);
}
```
