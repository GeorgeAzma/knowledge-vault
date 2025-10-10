``` python
# sharper antialiasing
max(abs(dpdx(sdf)), abs(dpdy(sdf)))
# AA Pixel Sampling
floor(p) + min(fract(p) / fwidth(p), 1.0) - 0.5
# accurate antialiasing (instead of fwidth)
vec2(length(dFdx(uv)), length(dFdy(uv)))
# or
vec4 dd = vec4(dFdx(uv), dFdy(uv));
float f = sqrt(max(dot(dd.xy, dd.xy), dot(dd.zw, dd.zw)));

# use derivative for constant line thickness
float l = fract(4.0 * length(uv * uv)); # local space x4 smaller
float dl = 4.0 * 2.0 * length(uv); # l derivative
float lines = smoothstep((0.1 + 0.01) * dl, (0.1 - 0.01) * dl, l); # line_width = 10% local

# antialiasing + stroke (non-straight edges only)
let maxd = max(abs(dpdx(sdf)), abs(dpdy(sdf)));
let edge = clamp(1.0 - sdf / maxd, 0.0, 1.0);
let strk = clamp(1.0 - (sdf + stroke_width) / maxd, 0.0, 1.0);
let col = mix(stroke_color, color, strk) * vec4f(1, 1, 1, edge);
```
