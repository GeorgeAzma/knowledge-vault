### Parameters

|  Param  |        Description        |      sRGB Range      | Visible Range |
| :-----: | :-----------------------: | :------------------: | :-----------: |
| **`L`** |        luminosity         |       `0 → 1`        |    `0 → 1`    |
| **`a`** |      green ↔ magenta      | `-0.23392 → 0.27463` | `-0.5 → 0.5`  |
| **`b`** |       blue ↔ yellow       | `-0.31161 → 0.19849` | `-0.6 → 0.6`  |
|   `c`   | chromaticity `length(ab)` |     `0 → 0.3226`     |   `0 → 0.6`   |
|   `h`   |      hue `angle(ab)`      |       `0 → 1`        |    `0 → 1`    |
### Properties
- `lightness/chroma/hue` are very orthogonal `changing one of them does not change others`
- distance between colors are perceptually linear `distance(ok1, ok2)`
- takes in `linear RGB` for `oklab` conversion
- blends 2 colors evenly `warm + cool = neutral`
- has **D65** white point `same as srgb`
- does not take into account view conditions `eye adjusts to brightness/color, oklab can't`
### Experiments `sRGB`
- www.oklch.com/
- below is hue wheel with linear luminosity that is as chromatic as possible 
  `without sRGB clipping. L = 0.75, C = 0.127`
![[Oklab.webp|500]]
- most chromatic color is magenta `Lch = 0.7, 0.3226, 0.912`
- most light and chromatic color is green `Lch = 0.865, 0.2933, 0.396`
- luma values according to oklab are `0.252, 0.652, 0.096`
  `calculated by bining similar luminosity colors and lsq fitting coefficients`
  `such that dot(col, coeffs) ~= dot(similar_L_col, coeffs)`
``` c
// oklab = (lightness, red_greenness, blue_yelowness)
vec3 oklab2rgb(vec3 ok) {
    vec3 lms = ok * mat3(1,  0.3963377774,  0.2158037573,
                         1, -0.1055613458, -0.0638541728,
                         1, -0.0894841775, -1.2914855480);
    lms *= lms * lms;
    return lms * mat3( 4.0767416621, -3.3077115913,  0.2309699292, 
                      -1.2684380046,  2.6097574011, -0.3413193965, 
                      -0.0041960863, -0.7034186147,  1.7076147010);
}

// rgb = linear rgb
vec3 rgb2oklab(vec3 rgb) {
    vec3 lms = rgb * mat3(0.4121656120, 0.5362752080, 0.0514575653,
                          0.2118591070, 0.6807189584, 0.1074065790,
                          0.0883097947, 0.2818474174, 0.6302613616);
    return pow(lms, vec3(1.0 / 3.0)) * mat3(0.2104542553,  0.7936177850, -0.0040720468,
                                            1.9779984951, -2.4285922050,  0.4505937099,
                                            0.0259040371,  0.7827717662, -0.8086757660);
}

// lch = (lightness, chromaticity, hue), sRGB ranges [0-1; 0-0.72?; 0-1]
vec3 oklch2oklab(vec3 lch) {
  return vec3(lch.x, lch.y * cos(lch.z * 6.2831), lch.y * sin(lch.z * 6.2831));
}

vec3 oklab2oklch(vec3 ok) {
  return vec3(ok.x, length(ok.yz), fract(atan(ok.z, ok.y) / 6.2831));
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
[[Opponent Colorspace]]
