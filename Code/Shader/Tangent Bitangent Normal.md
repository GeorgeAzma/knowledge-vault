``` c
// Build orthonormal basis (T, B, N) from a single normal
void build_onb(vec3 N, out vec3 T, out vec3 B) {  
    if (N.y < -0.9999999) {  
        T = vec3(0.0, 0.0, -1.0);  
        B = vec3(-1.0, 0.0, 0.0);  
        return;  
    }  
    float a = 1.0 / (1.0 + N.y);  
    float b = -N.x * N.z * a;  
    T = vec3(1.0 - N.x * N.x * a, -N.x, b);  
    B = vec3(b, -N.z, 1.0 - N.z * N.z * a);  
}
```