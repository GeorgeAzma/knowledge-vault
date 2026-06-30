### Basic
``` c
// translation
uv += off;
// scale
uv *= vec2(2, 4);
// rotation
uv = uv * cos(theta) + vec2(-uv.y, uv.x) * sin(theta);
uv = mat2(vec2(c, -s), vec2(s, c)) * uv;
// shear
uv.x += uv.y * 2.0; // horizontal
uv.y += uv.x * 3.0; // vertical
uv = mat2(vec2(1, 2), vec2(3, 1))

// rotate / scale around center
uv = rot * (uv - center) + center;
uv = 2.0 * (uv - center) + center;

// 2D matrix combines scale/rotate | 3D matrix also combines shear/translate
uv = (mat3(...) * uv).xy;
```
### Mirror
``` c
// mirror / reflect
uv.x = -uv.x; // horizontal
uv.y = -uv.y; // vertical

// swap axis
uv = uv.yx;
```
### Fold
``` c
// mirror fold
uv.x = abs(uv.x);
// box fold
uv.x = clamp(uv.x, -1.0, 1.0) * 2.0 - uv.x;
// triangle fold
uv.x = abs(fract(uv.x) - 0.5)

// kaleidoscope fold
float a = atan(uv.y, uv.x);
a = abs(mod(a, sector) - sector * 0.5);
uv = length(uv) * vec2(cos(a), sin(a));
```
### Repeat
``` c
// tile grid
vec2 i = floor(uv);
vec2 f = fract(uv);

// repeat
uv = fract(uv);
// mirror repeat
uv = abs(fract(uv * 0.5) * 2.0 - 1.0); // or: 1.0 - abs(mod(uv, 2.0) - 1.0)

// rotate tiles
f = cos(i) * f + sin(i) * vec2(-f.y, f.x);
uv = i + f;
```
### Polar
``` c
// polar coordinates
ra = vec2(length(p), atan(uv.y, uv.x)); // assumes uv [-x; x]

// radial shift
ra.x += 1.0;
// radial scale
ra.x *= 2.0;

// spiral
uv = uv * cos(length(uv)) + vec2(-uv.y, uv.x) * sin(length(uv));

// barrel distortion
uv *= 1.0 + dot(uv, uv); 
// pincushion distortion
uv *= 1.0 - dot(uv, uv);
// hyperbolic
uv /= 1.0 - dot(uv, uv);
// hyperbolic inverse  
uv /= (1.0 + sqrt(1.0 + dot(p, p)));

// ripple
uv += normalize(uv) * sin(length(uv) * freq - phase) * amp;

// fisheye
uv *= atan(length(uv)) / max(length(uv), 1e-4);  

// spherical map
float z = sqrt(max(0.0, 1.0 - dot(uv, uv)));
uv /= z + 1.0;

// radial power warp
uv += pow(length(uv), exp - 1.0);
// bulge
uv *= smoothstep(radius, 0.0, ra.x);
// pinch  
uv /= max(1e-4, smoothstep(radius, 0.0, ra.x));
```
### Other
``` c
// clamp
uv = clamp(uv, vec2(0, 0), vec2(1, 1));

// remap
uv = (uv - min) / (max - min);

// pixelize
uv = floor(uv * res) / res;

// fractional zoom
uv = fract(uv * zoom);

// checkerboard flip
ivec2 cell = ivec2(floor(uv));
if ((cell.x + cell.y) & 1)
    uv.x = 1.0 - fract(uv.x);

// refraction
uv += normal.xy;
```
### [[Hexagonal Coordinates]]