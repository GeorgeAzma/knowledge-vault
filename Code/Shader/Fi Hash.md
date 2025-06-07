I call it Fi Hash `for float-int hash`
### 1D
``` c
float hash11(float p) {
    uint u = floatBitsToUint(p * 3141592653.0);
    return float(u * u * 3141592653u) / float(~0u);
}
```
### 2D
``` c
float hash12(vec2 p) {
    uvec2 u = floatBitsToUint(p * vec2(141421356, 2718281828));
    return float((u.x ^ u.y) * 3141592653u) / float(~0u);
}

vec2 hash22(vec2 p) {
    uvec2 u = floatBitsToUint(p * vec2(141421356, 2718281828));
    return vec2((u.x ^ u.y) * uvec2(3141592653, 1618033988)) / float(~0u);
}
```
### 3D
``` c
float hash13(vec3 p) {
    uvec3 u = floatBitsToUint(p * vec3(141421356, 2718281828, 1618033988));
    return float((u.x ^ u.y ^ u.z) * 3141592653u) / float(~0u);
}

vec2 hash23(vec3 p) {
    uvec3 u = floatBitsToUint(p * vec3(141421356, 2718281828, 1618033988));
        return vec2((u.x ^ u.y ^ u.z) * uvec2(1732050807, 2645751311)) / float(~0u);
}

vec3 hash32(vec2 p) {
    uvec2 u = floatBitsToUint(p * vec2(141421356, 2718281828));
    return vec3((u.x ^ u.y) * uvec3(1732050807, 2645751311, 3316624790)) / float(~0u);
}

vec3 hash33(vec3 p) {
    uvec3 u = floatBitsToUint(p * vec3(141421356, 2718281828, 1618033988));
    return vec3((u.x ^ u.y ^ u.z) * uvec3(1732050807, 2645751311, 3316624790)) / float(~0u);
}
```
