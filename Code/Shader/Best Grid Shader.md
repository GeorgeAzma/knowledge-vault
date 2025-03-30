bgolus.medium.com/the-best-darn-grid-shader-yet-727f9278b9d8#93b2
``` c
float line_width = 0.1;
vec4 uv_ddxy = vec4(dFdx(uv), dFdy(uv));
vec2 uv_deriv = vec2(length(uv_ddxy.xz), length(uv_ddxy.yw));  
float draw_width = clamp(vec2(line_width), uv_deriv, vec2(0.5));
vec2 grid_uv = abs(fract(uv) * 2.0 - 1.0);  
vec2 grid2 = smoothstep(draw_width + uv_deriv * 1.5, draw_width - uv_deriv * 1.5, grid_uv);  
grid2 *= min(line_width / draw_width, 1.0);  
grid2 = mix(grid2, vec2(line_width), clamp(uv_deriv * 2.0 - 1.0, vec2(0), vec2(1)));  
float grid = mix(grid2.x, 1.0, grid2.y);

// also gamma correct
grid = lrgb2srgb(grid);

// notes: 
// - faster: uv_deriv = vec2(fwidth(uv.x), fwidth(uv.y)) 
// - iq's: uv_deriv = vec2(length(uv_ddxy.xz), length(uv_ddxy.yw));  
// - grid2 = mix(...) are only needed if grid cells are smaller than pixel
```
### Invertable Lines
``` c
float line_width = 0.1;
vec4 uv_ddxy = vec4(dFdx(uv), dFdy(uv));
vec2 uv_deriv = vec2(length(uv_ddxy.xz), length(uv_ddxy.yw));
float invert_line = line_width > 0.5;  
float target_width = invert_line ? 1.0 - line_width : line_width;  
float draw_width = clamp(target_width, uv_deriv, vec2(0.5));  
vec2 line_aa = uv_deriv * 1.5;  
vec2 grid_uv = abs(fract(uv) * 2.0 - 1.0);  
grid_uv = invert_line ? grid_uv : 1.0 - grid_uv;  
vec2 grid2 = smoothstep(draw_width + line_aa, draw_width - line_aa, grid_uv);  
grid2 *= clamp(target_width / draw_width, 0.0, 1.0);  
grid2 = mix(grid2, target_width, clamp(uv_deriv * 2.0 - 1.0, vec2(0), vec2(1)));  
grid2 = invert_line ? 1.0 - grid2 : grid2;  
float grid = mix(grid2.x, 1.0, grid2.y);
```
