smooth low-discrepency dithering pattern
``` c
ign = fract(52.9829189 * fract(dot(frag_coord, vec2(0.06711056, 0.00583715))))
```
### Awesome Property
per pixel values when scrolling the pattern linearly each frame is also low-discrepency
so this pattern is **low-discrepency over space and time** `wow`
### Higher Precision [[Golden Ratio]] Noise
``` c
// golden ratio integer IGN
gri_ign = float(frag_coord.x * 3242174889u + frag_coord.y * 2447445413u) * exp2(-32.0);
```
