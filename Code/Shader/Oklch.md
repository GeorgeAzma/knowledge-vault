www.oklch.com/
``` c
vec3 oklch2rgb(vec3 lch) {
    vec3 ok = vec3(lch.x, lch.y * cos(lch.z), lch.y * sin(lch.z));
    vec3 lms = ok * mat3(1,  0.3963377774,  0.2158037573,
                         1, -0.1055613458, -0.0638541728,
                         1, -0.0894841775, -1.2914855480);
    lms *= lms * lms;
    return lms * mat3( 4.0767416621, -3.3077115913,  0.2309699292, 
                      -1.2684380046,  2.6097574011, -0.3413193965, 
                      -0.0041960863, -0.7034186147,  1.7076147010);
}

vec3 rgb2oklch(vec3 rgb) {
    vec3 lms = rgb * mat3(0.4121656120, 0.5362752080, 0.0514575653,
                          0.2118591070, 0.6807189584, 0.1074065790,
                          0.0883097947, 0.2818474174, 0.6302613616);
    vec3 ok = pow(lms, vec3(1.0 / 3.0)) * mat3(0.2104542553,  0.7936177850, -0.0040720468,
                                               1.9779984951, -2.4285922050,  0.4505937099,
                                               0.0259040371,  0.7827717662, -0.8086757660);
    return vec3(ok.x, length(ok.yz), atan(ok.z, ok.y));
}

// lch = (lightness, chromaticity, hue), sRGB ranges [0-1; 0-0.72?; 0-2PI]
vec3 oklch2oklab(vec3 lch) {
  return vec3(lch.x, lch.y * cos(lch.z), lch.y * sin(lch.z));
}

vec3 oklab2oklch(vec3 ok) {
  return vec3(ok.x, length(ok.yz), atan(ok.z, ok.y));
}

// Max chroma hue wheel (without sRGB clipping)
// L = 0.7501536182034818, C = 0.12752921926811
vec3 okh2rgb(float h) {
    vec3 lms = 0.7501536182 + cos(h) * vec3(0.0505446473, -0.0134621560, -0.0114118473) +
                              sin(h) * vec3(0.0275212846, -0.0081432728, -0.1647021436);
    lms *= lms * lms;
    return lms * mat3( 4.0767416621, -3.3077115913,  0.2309699292, 
                      -1.2684380046,  2.6097574011, -0.3413193965, 
                      -0.0041960863, -0.7034186147,  1.7076147010);
}

vec3 okh2rgb_approx(float h) {
    float s = sin(h), c = cos(h);
    return vec3(
        0.4172 * c + 0.1764 * s + 0.453,
       -0.1610 * c + 0.416,
       -0.4734 * s - 0.088 * c * c + 0.5266
    );
}

vec3 okhue_shift(vec3 lrgb, float hue) {
    const mat3 cone2lms = mat3(
        0.4122214708, 0.2119034982, 0.0883024619,
        0.5363325363, 0.6806995451, 0.2817188376,
        0.0514459929, 0.1073969566, 0.6299787005);
    const mat3 lms2cone = mat3(
         4.0767416621, -1.2684380046, -0.0041960863,
        -3.3077115913,  2.6097574011, -0.7034186147,
         0.2309699292, -0.3413193965,  1.7076147010);
    const mat3 lms2ok = mat3(
        0.2104542553,  1.9779984951,  0.0259040371,
        0.7936177850, -2.4285922050,  0.7827717662,
       -0.0040720468,  0.4505937099, -0.8086757660);
    const mat3 ok2lms = mat3(
        1.0, 1.0, 1.0,
        0.3963377774, -0.1055613458, -0.0894841775,
        0.2158037573, -0.0638541728, -1.2914855480);
    vec3 ok = lms2ok * pow(cone2lms * lrgb, vec3(1.0 / 3.0));
    vec2 cs = vec2(cos(hue), sin(hue));
    ok.yz = ok.yy * cs + ok.zz * vec2(-cs.y, cs.x);
    vec3 lms = ok2lms * ok;
    return lms2cone * (lms * lms * lms);
}

// okhsv and okhsl: shadertoy.com/view/7sK3D1
```
### [[sRGB]]
``` c
vec3 rgb2srgb(vec3 lrgb) { 
	return mix(12.92 * lrgb, 1.055 * pow(lrgb, vec3(1.0 / 2.4)) - 0.055, 
	       step(0.0031308, lrgb)); 
}

vec3 srgb2rgb(vec3 srgb) { 
	return mix(srgb / 12.92, pow((srgb + 0.055) / 1.055, vec3(2.4)), 
	       step(0.04045, srgb)); 
}
```
### Experiments `sRGB`
- **hue wheel** max chroma without sRGB clipping
    - `L = 0.7501536182034814, C = 0.12752921926811`
    ![[Oklab.webp#rounded-xl|500]]
- **hue wheel saturated** `L = 0.7, C = 0.23`
- **luma** values according to oklab are `(0.253, 0.652, 0.096)`
    - `(0.253, 0.652, 0.096)` calculated by bining similar luminosity colors and lsq fitting coefficients such that `dot(col, coeffs) ~= dot(similar_L_col, coeffs)`
    - `(0.254, 0.652, 0.094)` calculated by adding max chroma hue wheel `S = R + G + B`
         and finding coefficients such that resulting `S` is a flat line `constant luminosity`
         - `(0.195,0.703,0.102)` same in sRGB
##### Colors
- **most saturated** is $\mathbf{\color{#0000ff}blue}$ `oklch(0.452014 0.313214 264.052), #0000ff`
- **most chromatic** is $\mathbf{\color{#ff00ff}magenta}$ `oklch(0.7017 0.3225 328.36), #ff00ff`
- **most lightness** is $\mathbf{\color{#ffff00}yellow}$ `oklch(0.968 0.211 109.77), #ffff00`
- **most light-chromatic** is $\mathbf{\color{#00ff00}green}$ `oklch(0.86644 0.294827 142.4953), #00ff00`
### [[Oklab Gamut Clipping]]
