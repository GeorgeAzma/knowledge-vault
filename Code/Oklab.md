[[Opponent Colorspace]]
- Predicts lightness, chroma and hue well
  `changing one of them does not change others`
- Blends 2 colors evenly `warm + cool = neutral`
- Has **D65** white point `same as srgb`
- Does not take into account view conditions
  `eye adjusts to brightness and overall color, oklab can't`
> [!tip] Useful for grayscale conversion and increasing saturation without hue shifts etc. 
``` c
// oklab = (lightness, red_greenness, blue_yelowness)
vec3 oklab2lrgb(vec3 oklab) {
    vec3 lms = oklab * mat3(1,  0.3963377774,  0.2158037573,
                            1, -0.1055613458, -0.0638541728,
                            1, -0.0894841775, -1.2914855480);
    lms *= lms * lms;
    return lms * mat3( 4.0767416621, -3.3077115913,  0.2309699292, 
                      -1.2684380046,  2.6097574011, -0.3413193965, 
                      -0.0041960863, -0.7034186147,  1.7076147010);
}

vec3 lrgb2oklab(vec3 lrgb) {
    vec3 lms = lrgb * mat3(0.4121656120, 0.5362752080, 0.0514575653,
                           0.2118591070, 0.6807189584, 0.1074065790,
                           0.0883097947, 0.2818474174, 0.6302613616);
    return pow(lms, vec3(1.0 / 3.0)) * mat3(0.2104542553,  0.7936177850, -0.0040720468,
                                            1.9779984951, -2.4285922050,  0.4505937099,
                                            0.0259040371,  0.7827717662, -0.8086757660);
}

// lch = (lightness, chromaticity, hue)
vec3 oklch2oklab(vec3 lch) {
  return vec3(lch.x, lch.y * cos(lch.z * TAU), lch.y * sin(lch.z * TAU));
}
```
> [!tip] Distance between colors `distance(ok1, ok2)`
