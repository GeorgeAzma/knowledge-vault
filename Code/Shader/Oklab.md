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

// optimized oklab mix by Inigo Quilez, MIT licensed
// shadertoy.com/view/ttcyRS
vec3 oklab_mix(vec3 lin1, vec3 lin2, float a) {
    const mat3 cone2lms = mat3(                
         0.4121656120,  0.2118591070,  0.0883097947,
         0.5362752080,  0.6807189584,  0.2818474174,
         0.0514575653,  0.1074065790,  0.6302613616);
    const mat3 lms2cone = mat3(
         4.0767245293, -1.2681437731, -0.0041119885,
        -3.3072168827,  2.6093323231, -0.7034763098,
         0.2307590544, -0.3411344290,  1.7068625689);
    vec3 lms1 = pow(cone2lms * lin1, vec3(1.0 / 3.0));
    vec3 lms2 = pow(cone2lms * lin2, vec3(1.0 / 3.0));
    vec3 lms = mix(lms1, lms2, a);
    return lms2cone * (lms * lms * lms);
}

// okhsv and okhsl (super long)
// shadertoy.com/view/7sK3D1
```
> [!tip] Distance between colors `distance(ok1, ok2)`

> [!tip] Convert oklab output to srgb for displaying
``` c
vec3 lrgb2srgb(vec3 lrgb) { 
	return mix(12.92 * lrgb, 1.055 * pow(lrgb, vec3(1.0 / 2.4)) - 0.055, 
	       step(0.0031308, lrgb)); 
}
vec3 srgb2lrgb(vec3 srgb) { 
	return mix(srgb / 12.92, pow((srgb + 0.055) / 1.055, vec3(2.4)), 
	       step(0.04045, srgb)); 
}
```
### Example
``` c
vec3 col_a = vec3(0.3, 0.9, 0.1);
vec3 col_b = vec3(0.6, 0.1, 0.5);
// colors where choosen on srgb monitor by eye
// so we need to convert it to linear rgb
col_a = srgb2lrgb(col_a);
col_b = srgb2lrgb(col_b);
// convert to oklab for perceptually uniform mixing
col_a = lrgb2oklab(col_a);
col_b = lrgb2oklab(col_b);
vec3 col = mix(col_a, col_b, uv.x);
// convert back to lrgb
col = oklab2lrgb(col);
// convert to srgb for displaying
col = lrgb2srgb(col);
```
