light is non-linearly encoded for more efficient storage
- [[Gamma Correction]]
``` c
vec3 rgb2srgb(vec3 rgb) { 
    return mix(12.92 * rgb, 1.055 * pow(rgb, vec3(1.0 / 2.4)) - 0.055, step(0.0031308, rgb)); 
}

vec3 srgb2rgb(vec3 srgb) { 
    return mix(srgb / 12.92, pow((srgb + 0.055) / 1.055, vec3(2.4)), step(0.04045, srgb));
}
```
> [!note] sRGB uses `2.4` gamma but people say monitors have `2.2` gamma
> since sRGB contains linear segment and non-linear segment with gamma of `2.4`
> overall better approximation of gamma is closer to `2.2` because of linear-segment

> [!note] `lrgb2srgb = srgb encode` and `srgb2lrgb = srgb decode` typically
