- [[Fractal Texturing]] for infinite zoom detail
- thebookofshaders.com/edit.php visualize slow lines
- bgolus.medium.com/sharper-mipmapping-using-shader-based-supersampling-ed7aadb47bec
- [[Infinite Zoom]]
- [[Packing]]
### [[Camera]]
### [[Lighting]]
### [[SDF]]
- [[Normal From SDF]]
### [[Antialiasing]]
### Pretty Shapes
``` c
float l = length(uv);
float w = fwidth(l);
float circ_aa = clamp((1.0 - l) / w, 0.0, 1.0);

float frosted_glass_fresnel = circ_aa * clamp(0.1 / (sqrt(1.0 - l * l)), 0.0, 1.0);
float fresnel = circ_aa * clamp(1.0 - sqrt(1.0 - l * l), 0.0, 1.0);
float outline_fresnel = circ_aa * clamp(w / (1.0 - l), 0.0, 1.0);
```