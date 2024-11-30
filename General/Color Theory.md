- Nice pastel colors
``` c
vec3 purple = vec3(0.68, 0.1, 0.9);
vec3 blue = vec3(0.6, 0.8, 0.94);
vec3 orange = vec3(1, 0.68, 0.4);
vec3 red = vec3(0.98, 0.38, 0.35);
```
- Color Correction
```c
(col - 0.5) * contrast + 0.5 + brightness // Brightness, Contrast
mix(vec3(dot(col, vec3(0.2126, 0.7152, 0.0722))), col, 1.0 + saturation) // Saturation
(1.0 + exposure) * col // Exposure
pow((col - in_black) / (in_white - in_black), gamma) * (out_white - out_black) + out_black // Levels
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
