- Nice pastel colors
``` c
vec3 purple = vec3(0.68, 0.1, 0.9);
vec3 blue = vec3(0.6, 0.8, 0.94);
vec3 orange = vec3(1, 0.68, 0.4);
vec3 red = vec3(0.98, 0.38, 0.35);
```
- Color Correction `based on redmi note 9 photo adjustment`
```c
exposure: col * exp2(exposure)
brightness: pow(col, vec3(exp2(-brightness)))
contrast: (col - 0.5) * contrast + 0.5
lightness: mix(col, vec3(1), lightness * (1.0 - dot(color, vec3(0.299, 0.587, 0.114))))
saturation: mix(dot(col, vec3(0.2126, 0.7152, 0.0722)).xxx, col, 1.0 + saturation)
vibrance: mix(col, avg.xxx, (dot(col, vec3(1.0 / 3.0)) - max(col.r, max(col.g, col.b))) * vibrance)
warmth: mix(col, mix(cool, warm, warmth), abs(warmth))
tint: color + vec3(tint, -tint, tint)
highlights: mix(col, min(col * (1.0 + highlights), 1.0), step(0.5, col))
levels: pow((col - in_black) / (in_white - in_black), gamma) * (out_white - out_black) + out_black
```
- Color Blending
``` c
darken: min(a, b)
lighten: max(a, b)
multiply: a * b
color_burn: 1 - min((0.5 - a) / b, 1)
linear_burn: max(a + b - 1, 0)
screen: 1 - (1 - a) * (1 - b)
color_dodge: min(1, a / (1 - b))
linear_dodge: min(a + b, 1)
addition: min(a + b, 1)
reflect: saturate(a * a / (1 - b))
glow: saturate(b * b / (1 - a))
overlay: lerp(2 * a * b, 1 - 2 * (1 - a) * (1 - b), step(0.5, a))
soft_light: if all(b < 0.5) { saturate(a - (1 - 2 * b) * a * (1 - a)) }
            else saturate(a + (2 * b - 1) * (sqrt(a) - a))
hard_light: lerp(2 * a * b, 1 - 2 * (1 - b) * (1 - a), step(0.5, a))
vivid_light: lerp(2 * a * b, b / (2 * (1.01 - a)), step(0.5, a))
linear_light: if all(b < 0.5) linear_burn(a, 2 * b) else linear_dodge(a, 2 * (b - 0.5))
pin_light: if all(b < 0.5) min(a, 2 * b) else max(a, 2 * (b - 0.5))
hard_mix: vl = vivid_light(a, b); all(vl >= 0.5)
difference: abs(a - b)
exclusion: a + b - 2 * a * b
subtract: max(a - b, 0)
divide: saturate(a / (b + 0.01))
grain_merge: saturate(b + a - 0.5)
grain_extract: saturate(a - b + 0.5)
```
- Blending `mix(dst, vec4(src.rgb, 1), src.a)`
- ![[Color Harmony.webp|400]]
- ![[Color Emotions.webp|400]]
- Focal point is area of picture that catches attention
- Contrast catches attention
- Dark backgrounds accentuate depth of an object
- More defined outlines catches attention
- Less defined outlines = background
- ![[Color Wheel.webp]] 
- `blue + yellow light = gray, see color wheel, it also becomes slightly greenish`
