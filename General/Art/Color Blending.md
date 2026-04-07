``` python
# a: painted | b: painter
        'alpha' mix(dst, vec4(src.rgb, 1), src.a)
       'darken' min(a, b)
      'lighten' max(a, b)
     'multiply' ab # = lerp(0, a, b)
   'color_burn' 1 - min((0.5 - a) / b, 1)
  'linear_burn' max(a + b - 1, 0)
       'screen' 1 - (1 - a)(1 - b) # = lerp(a, 1, b) = a + b - ab
  'color_dodge' min(1, a / (1 - b))
 'linear_dodge' min(a + b, 1) # add
      'reflect' saturate(a^2 / (1 - b))
         'glow' saturate(b^2 / (1 - a))
      'overlay' lerp(2ab, 1 - 2(1 - a)(1 - b), step(0.5, a)) # multiply/screen based on base color brightness = 2 * lerp(ab, a + b - ab - 0.5, step(0.5, a))
   'hard_light' lerp(2ab, 1 - 2(1 - b)(1 - a), step(0.5, b)) # multiply/screen based on blend color brightness
   'soft_light' if all(b < 0.5) a - (1 - 2b) * a * (1 - a) else a + (2b - 1)(sqrt(a) - a) # like overlay, but uses color_burn/color_dodge = { b < 0.5: lerp((2b - 1)a, 1, a), sqrt(a) * lerp(2b - 1, 1, sqrt(a)) }
  'vivid_light' lerp(a / (1 - 2b), 1 - (1 - a) / (2b - 1), step(0.5, b))
 'linear_light' if all(b < 0.5) linear_burn(a, 2b) else linear_dodge(a, 2b - 1) # like overlay, but additive
    'pin_light' if all(b < 0.5) min(a, 2b) else max(a, 2(b - 0.5)) # darken/lighten based on blend color brightness
     'hard_mix' vl = vivid_light(a, b); all(vl >= 0.5)
   'difference' abs(a - b)
    'exclusion' a + b - 2ab
     'subtract' max(a - b, 0)
       'divide' saturate(a / (b + 0.01))
  'grain_merge' saturate(b + 2(a - 0.5))
'grain_extract' saturate(a - 2(b + 0.5))
```