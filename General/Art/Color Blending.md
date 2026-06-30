---
aliases:
  - Blend Modes
---
``` python
# a: painted | b: painter
        'alpha' mix(dst, vec4(src.rgb, 1), src.a) # normal
       'darken' min(a, b)
      'lighten' max(a, b)
     'multiply' ab # = lerp(0, a, b)
   'color_burn' 1 - min((0.5 - a) / b, 1)
  'linear_burn' max(a + b - 1, 0)
       'screen' 1 - (1 - a)(1 - b) # = lerp(a, 1, b) = a + b - ab
  'color_dodge' min(1, a / (1 - b))
 'linear_dodge' min(a + b, 1) # add
      'reflect' saturate(a^2 / (1 - b)) # color dodge with a^2
         'glow' saturate(b^2 / (1 - a))
      'overlay' lerp(2ab, 1 - 2(1 - a)(1 - b), step(0.5, a)) # multiply/screen based on base color brightness = 2 * lerp(ab, a + b - ab - 0.5, step(0.5, a))
   'hard_light' lerp(2ab, 1 - 2(1 - b)(1 - a), step(0.5, b)) # multiply/screen based on blend color brightness
   'soft_light' if (b < 0.5) lerp(a, a * a, 1 - 2b) else lerp(a, sqrt(a), 2b - 1) # like overlay, but uses color_burn/color_dodge = { b < 0.5: lerp((2b - 1)a, 1, a), sqrt(a) * lerp(2b - 1, 1, sqrt(a)) }
  'vivid_light' lerp(a / (1 - 2b), 1 - (1 - a) / (2b - 1), step(0.5, b))
 'linear_light' if (b < 0.5) linear_burn(a, 2b) else linear_dodge(a, 2b - 1) # like overlay, but additive
    'pin_light' if (b < 0.5) min(a, 2b) else max(a, 2(b - 0.5)) # darken/lighten based on blend color brightness
     'hard_mix' vl = vivid_light(a, b); (vl >= 0.5)
   'difference' abs(a - b)
    'exclusion' a + b - 2ab
     'subtract' max(a - b, 0)
       'divide' saturate(a / (b + 0.01))
  'grain_merge' saturate(b + 2(a - 0.5))
'grain_extract' saturate(a - 2(b + 0.5))
```
### Useful
``` c
# most used
'alpha' mix(dst, vec4(src.rgb, 1), src.a)
'multiply' ab
'linear_dodge' min(a + b, 1)

# useful
'color_dodge' min(1, a / (1 - b))
'screen' 1 - (1 - a)(1 - b)
'overlay' lerp(2ab, 1 - 2(1 - a)(1 - b), step(0.5, a))

# maybe useful
'soft_light' if (b < 0.5) a - (1 - 2b) * a * (1 - a) else a + (2b - 1)(sqrt(a) - a)
'color_burn' 1 - min((0.5 - a) / b, 1)

# note: soft_light is approximation of: Photoshop/SVG/IFS Illusions/Pegtop-Delphi soft light versions
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