---
aliases:
  - Color Blending
---
### Useful
``` c
# S
       'alpha' mix(dst, vec4(src.rgb, 1), src.a)
    'multiply' ab
'linear_dodge' a + b

# A
     'screen' 1 - (1 - a)(1 - b)
    'overlay' lerp(2ab, 1 - 2(1 - a)(1 - b), step(0.5, a))
'soft_light' lerp(lerp(a, a * a, 1 - 2b), lerp(a, sqrt(a), 2b - 1), step(0.5, b))
'color_dodge' a / (1 - b)
 'easy_dodge' pow(b, 1.04 / (1 - a)) 

# B
     'color' set_lum(b, lum(a))

# C
'hard_light' lerp(2ab, 1 - 2(1 - b)(1 - a), step(0.5, b))
  'hard_mix' lerp(color_burn(a, b), color_dodge(a, b), step(0.5, a))
'color_burn' 1 - (0.5 - a) / b
 'easy_burn' 1 - pow(1 - b, a * 1.04)
  'incr_lum' set_lum(a, lum(a) + lum(b))
'luminosity' set_lum(a, lum(b))
      'tint' lerp(b, 1, lum(a))

# D
'gamma_dark' pow(a, 1 / b)
'saturation' set_lum(set_sat(a, sat(b)), lum(a))

# Worth trying out
'vivid_light'
'super_light'
'hue'
'allanon'
'parallel'
'gamma_illum'
'gamma_light'
'lambert 2.2'
'incr_saturation'
'geometric_mean'
'glow'
'reflect'
```
### [[Krita]]
https://github.com/KDE/krita/blob/master/libs/pigment/compositeops/KoCompositeOpFunctions.h
``` python
# a: painted (dst) | b: painter (src); make sure to clamp(result, 0, 1) for SDR
          'alpha' lerp(b, vec4(a.rgb, 1), a.a) # normal
         'darken' min(a, b)
        'lighten' max(a, b)
       'multiply' ab # = lerp(0, a, b)
     'color_burn' 1 - (1 - a) / b
    'linear_burn' a + b - 1
         'screen' 1 - (1 - a)(1 - b) # = lerp(a, 1, b) = a + b - ab
    'color_dodge' a / (1 - b)
   'linear_dodge' a + b
       'subtract' a - b
   'inv_subtract' a - b + 1
        'overlay' lerp(2ab, 1 - 2(1 - a)(1 - b), step(0.5, a)) # multiply/screen based on base color brightness; = 2 * lerp(ab, a + b - ab - 0.5, step(0.5, a))
     'hard_light' lerp(2ab, 1 - 2(1 - b)(1 - a), step(0.5, b)) # multiply/screen based on blend color brightness
     'soft_light' lerp(lerp(a, a * a, 1 - 2b), lerp(a, sqrt(a), 2b - 1), step(0.5, b)) # like overlay, but lerps towards a^2/sqrt(a)
    'vivid_light' lerp(a / (1 - 2b), 1 - (1 - a) / (2b - 1), step(0.5, b))
   'linear_light' a + 2b - 1 # additive overlay, uses linear_burn/linear_dodge
      'pin_light' if (b < 0.5) min(a, 2b) else max(a, 2(b - 0.5)) # darken/lighten based on blend color brightness
       'hard_mix' lerp(color_burn(a, b), color_dodge(a, b), step(0.5, a)) # like overlay, but uses color_burn/color_dodge
     'difference' abs(a - b)
      'exclusion' a + b - 2ab
         'divide' a / b
    'grain_merge' b + 2(a - 0.5) # or maybe: a + b - 0.5
  'grain_extract' a - 2(b + 0.5) # or maybe: a - b + 0.5
     'easy_dodge' pow(b, 1.04 / (1 - a))   
      'easy_burn' 1 - pow(1 - b, a * 1.04)
          'color' set_lum(b, lum(a))
           'tint' lerp(b, 1, lum(a))
    'lambert 2.2' 2ab > 1 ? 1 + (2ab - 1)^2 * 0.4 : 2ab
     'luminosity' set_lum(a, lum(b)) # same for lightness/value/intensity
'incr_luminosity' set_lum(a, lum(a) + lum(b))
'decr_luminosity' set_lum(a, lum(a) - lum(b))
     'saturation' set_lum(set_sat(a, sat(b)), lum(a))
'incr_saturation' set_lum(set_sat(a, mix(sat(a), 1, sat(b))), lum(a))
'decr_saturation' set_lum(set_sat(a, mix(0, sat(a), sat(b))), lum(a))
            'hue' set_lum(set_sat(b, sat(a)), lum(a))
 'tangent_normal' a.rg + b.rg - 0.5; a.b + b.b - 1
   'darker_color' lum(a) < lum(b) ? a : b
  'lighter_color' lum(a) > lum(b) ? a : b
         'arctan' 2 * atan2(b, a) / PI
        'allanon' (a + b) * 0.5 # average
       'parallel' 2 / (1 / a + 1 / b)
    'equivalence' abs(a - b) # not sure if correct, maybe: 1 - abs(a - b)
'additive_subtra' abs(sqrt(a) - sqrt(b))
     'gamma_dark' pow(a, 1 / b)
    'gamma_light' pow(a, b)
    'gamma_illum' 1 - gamma_dark(1 - b, 1 - a) # like screen, but for gamma
 'geometric_mean' sqrt(ab)
   'hard_overlay' lerp(2ab, 2a(1-b), step(0.5, b))
    'hard_mix_ps' step(1, a + b)
           'glow' b^2 / (1 - a)
        'reflect' a^2 / (1 - b) # color dodge with a^2
           'heat' 1 - (1 - b)^2 / a
         'freeze' 1 - (1 - a)^2 / b
          'helow' lerp(glow(a, b), heat(a, b), step(1, a + b))
          'frect' lerp(reflect(a, b), freeze(a, b), step(1, a + b))
          'gleat' lerp(heat(a, b), glow(a, b), step(1, a + b))
          'reeze' gleat(b, a)
          'fhyrd' allanon(frect(a, b), helow(a, b))
  'interpolation' 0.5 - 0.25 * cos(PI * b) - 0.25 * cos(PI * a)
'interpolation_b' interpolation(interpolation(a, b), interpolation(a, b))
     'penumbra_b' lerp(color_dodge(b, a) / 2, 1 - (1 - a) / b / 2, step(1, a + b))
     'penumbra_d' arctan(b, 1 - a)
     'penumbra_c' arctan(1 - a, b)
     'penumbra_a' penumbra_b(b, a)
     'flat_light' lerp(penumbra_a(a, b), penumbra_b(a, b), step(1, a + b))
       'negation' 1 - abs(1 - a - b)
        'pnorm_a' (a^2.3333 + b^2.3333)^(1 / 2.3333)
        'pnorm_b' (a^4 + b^4)^0.25
       'tint_ifs' b * (1 - a) + sqrt(a)
      'shade_ifs' 1 - (1 - a) * b - sqrt(1 - b)
'fog_lighten_ifs' lerp(1 - b(1 - b) - (1 - a)(1 - b), b - (1 - a) * (1 - b) + (1 - b)^2, step(0.5, b))
 'fog_darken_ifs' lerp(b(1 - b) + ab, ab + b - b^2, step(0.5, b))
   'addition_sai' a * a.a + b
    'super_light' lerp(1 - pow((1 - a)^2.875 + (1 - 2b)^2.875, 1/2.875), pow(a^2.875 + (2b - 1)^2.875, 1/2.875), step(0.5, b))
 'soft_light_ifs' pow(a, pow(2, 2(0.5 - b)))
 'soft_light_svg' lerp(a - a(1 - 2b)(1 - a), a + (2b - 1)(lerp(a(a(16a - 12) + 4), sqrt(a), step(0.25, a)) - a), step(0.5, b))

 if a > 0.5: D = (b > 0.25) ? sqrt(b) : ((16*b - 12)*b + 4)*b; b + (2*a - 1)*(D - b); else: b - (1 - 2*a)*b*(1 - b)

# Modulo
         'modulo' mod(a, b)
   'modulo_shift' mod(a + b, 1)
 'mod_shift_cont' int(ceil(a + b)) % 2 ? mod_shift(a, b) : 1 - mod_shift(a, b)
'divisive_modulo' mod(a / b, 1)
   'div_mod_cont' int(ceil(a / b)) % 2 ? divisive_modulo(a, b) : 1 - divisive_modulo(a, b) # divisive modulo continuous
 'mod_continuous' div_mod_cont(a, b) * b

# Bitwise [a: int(a * int::MAX), b: int(b * int::MAX)] 
         'nor' a & b
        'nand' a | b
         'xor' a ^ b
        'xnor' (1 - a) ^ b
         'and' nor(1 - a, 1 - b)
          'or' nand(1 - a, 1 - b)
    'converse' or(a, 1 - b)
'not_converse' and(1 - a, b)
     'implies' or(1 - a, b)
 'not_implies' and(a, 1 - b)
```
### [[GLSL]]
``` c
vec3 screen(vec3 a, vec3 b) {
    return 1.0 - (1.0 - a) * (1.0 - b);
}

vec3 color_dodge(vec3 a, vec3 b) {
    return min(vec3(1), a / (1.0 - b));
}

vec3 overlay(vec3 a, vec3 b) {
    return mix(2.0 * a * b, 1.0 - 2.0 * (1.0 - a) * (1.0 - b), step(0.5, a));
}

vec3 soft_light(vec3 a, vec3 b) {
    return mix(a - (1.0 - 2.0 * b) * a * (1.0 - a), a + (2.0 * b - 1.0) * (sqrt(a) - a), step(vec3(0.5), b));
}
```
### Exponential Blending
``` c
col = (exp(k * (1.0 - t)) * a + exp(k * t) * b) / (exp(k * (1.0 - t)) + exp(k * t))
col = exp(mix(log(a), log(b), t)) // geometric mean blending, same as a^(1-t)b^t
col = a * (1 - exp(-k * d)) + b * exp(-k * d) // beer's law: k: thickness; d: density

// higher weight = sharper blending for that color
vec3 col = exp(col1) * w1 + exp(col2) * w2 + exp(col3) * w3;
col = log(col / (w1 + w2 + w3));

// add glow
exp(col1 * (1.0 + w1 * g1)) * w1 + exp(col2 * (1.0 + w2 * g2)) * w2 + exp(col3 * (1.0 + w3 * g3)) * w3;
```
