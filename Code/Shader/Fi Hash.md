I call it Fi Hash `for float-int hash`
### 1D
``` c
float hash11(float p) {
    uint u = floatBitsToUint(p * 3141592653.0);
    return float(u * u * 2654435769u) / float(~0u);
}
```
### 2D
``` c
float hash12(vec2 p) {
    uvec2 u = floatBitsToUint(p * vec2(141421356, 2718281828));
    return float((u.x ^ u.y) * 2654435769u) / float(~0u);
}

vec2 hash22(vec2 p) {
    uvec2 u = floatBitsToUint(p * vec2(141421356, 2718281828));
    return vec2((u.x ^ u.y) * uvec2(2654435769, 1618033988)) / float(~0u);
}
```
### 3D
``` c
float hash13(vec3 p) {
    uvec3 u = floatBitsToUint(p * vec3(141421356, 2718281828, 1618033988));
    return float((u.x ^ u.y ^ u.z) * 2654435769u) / float(~0u);
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
### Better Constants To Test
based on [[golden ratio]]
``` c
const uint PMIX1 = 0xACDF48B1u;
const uint PMIX2 = 0xC13FA9A9u;
const uint PMIX3 = 0xEB9F9F09u;

const float INV_U32 = 1.0 / 4294967296.0;

const float PF1 = 1.0 + float(PMIX1) * INV_U32;
const float PF2 = 1.0 + float(PMIX2) * INV_U32;
const float PF3 = 1.0 + float(PMIX3) * INV_U32;

// 1D -> 1D
float hash11(float p) {
    uint u = floatBitsToUint(p * PF1);
    return float(u * u * PMIX1) * INV_U32;
}

// 2D -> 1D
float hash12(vec2 p) {
    uvec2 u = floatBitsToUint(p * vec2(PF1, PF2));
    return float((u.x ^ u.y) * PMIX1) * INV_U32;
}

// 2D -> 2D
vec2 hash22(vec2 p) {
    uvec2 u = floatBitsToUint(p * vec2(PF1, PF2));
    return vec2((u.x ^ u.y) * uvec2(PMIX1, PMIX2)) * INV_U32;
}

// 3D -> 1D
float hash13(vec3 p) {
    uvec3 u = floatBitsToUint(p * vec3(PF1, PF2, PF3));
    return float((u.x ^ u.y ^ u.z) * PMIX1) * INV_U32;
}

// 3D -> 2D
vec2 hash23(vec3 p) {
    uvec3 u = floatBitsToUint(p * vec3(PF1, PF2, PF3));
    return vec2((u.x ^ u.y ^ u.z) * uvec2(PMIX1, PMIX2)) * INV_U32;
}

// 2D -> 3D
vec3 hash32(vec2 p) {
    uvec2 u = floatBitsToUint(p * vec2(PF1, PF2));
    return vec3((u.x ^ u.y) * uvec3(PMIX1, PMIX2, PMIX3)) * INV_U32;
}

// 3D -> 3D
vec3 hash33(vec3 p) {
    uvec3 u = floatBitsToUint(p * vec3(PF1, PF2, PF3));
    return vec3((u.x ^ u.y ^ u.z) * uvec3(PMIX1, PMIX2, PMIX3)) * INV_U32;
}
```