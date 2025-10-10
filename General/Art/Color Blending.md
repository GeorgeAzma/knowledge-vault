``` python
        'alpha' mix(dst, vec4(src.rgb, 1), src.a)
       'darken' min(a, b)
      'lighten' max(a, b)
     'multiply' a * b
   'color_burn' 1 - min((0.5 - a) / b, 1)
  'linear_burn' max(a + b - 1, 0)
       'screen' 1 - (1 - a) * (1 - b)
  'color_dodge' min(1, a / (1 - b))
 'linear_dodge' min(a + b, 1) # add
      'reflect' saturate(a * a / (1 - b))
         'glow' saturate(b * b / (1 - a))
      'overlay' lerp(2 * a * b, 1 - 2 * (1 - a) * (1 - b), step(0.5, a))
   'hard_light' lerp(2 * a * b, 1 - 2 * (1 - b) * (1 - a), step(0.5, b))
   'soft_light' if all(b < 0.5) { saturate(a - (1 - 2 * b) * a * (1 - a)) }
                else saturate(a + (2 * b - 1) * (sqrt(a) - a))
  'vivid_light' lerp(a / (1 - 2 * b), 1 - (1 - a) / (2 * b - 1), step(0.5, b))
 'linear_light' if all(b < 0.5) linear_burn(a, 2 * b) else linear_dodge(a, 2 * (b - 0.5))
    'pin_light' if all(b < 0.5) min(a, 2 * b) else max(a, 2 * (b - 0.5))
     'hard_mix' vl = vivid_light(a, b); all(vl >= 0.5)
   'difference' abs(a - b)
    'exclusion' a + b - 2 * a * b
     'subtract' max(a - b, 0)
       'divide' saturate(a / (b + 0.01))
  'grain_merge' saturate(b + 2 * (a - 0.5))
'grain_extract' saturate(a - 2 * (b + 0.5))
```
### Darken Modes
- `darken, multiply, color burn, linear burn`
### Lighten Modes
- **Screen** similar to projecting 2 projectors in the same place, it always gets lighter
- `lighten, color dodge, linear dodge (add)`
### Contrast Modes
- **Overlay** `multiply/screen` based on base color brightness 
- **Hard Light** `multiply/screen` based on blend color brightness
- **Pin Light** `darken/lighten` based on blend color brightness
- `soft light, vivid light, linear light, hard mix`
### Inversion Modes
- `difference, exclusion, subtract, divide`
### Usage
- **Shadows** `multiply, color burn`
- **Highlights** `screen, add, color dodge`
- **Contrast** `overlay, soft light, hard light`
