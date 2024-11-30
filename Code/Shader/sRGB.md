``` c
vec2 lrgb2srgb(vec3 lrgb) { 
    return mix(12.92 * lrgb, 1.055 * pow(lrgb, vec3(1.0 / 2.4)) - 0.055, step(0.0031308, lrgb)); 
}
vec3 srgb2lrgb(vec3 srgb) { 
    return mix(srgb / 12.92, pow((srgb + 0.055) / 1.055, vec3(2.4)), step(0.04045, srgb));
}
```