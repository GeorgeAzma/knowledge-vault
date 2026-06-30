``` c
ivec2 morton_decode(int code) {  
    ivec2 p = ivec2(code, code >> 1);
    p &= 0x55555555;  
    p = (p | (p >> 1)) & 0x33333333;  
    p = (p | (p >> 2)) & 0x0f0f0f0f;  
    p = (p | (p >> 4)) & 0x00ff00ff;  
    p = (p | (p >> 8)) & 0x0000ffff;  
    return p;  
}

int morton_encode(ivec2 p) {
    p &= 0x0000ffff;
    p = (p ^ (p << 8)) & 0x00ff00ff;
    p = (p ^ (p << 4)) & 0x0f0f0f0f;
    p = (p ^ (p << 2)) & 0x33333333;
    p = (p ^ (p << 1)) & 0x55555555;
    return p.x | (p.y << 1);
}
```
- very fast
- good average locality
- has sudden jumps
### [[Hilbert Curve]]