point grid made of integer multiples of [[Standard Basis Vector|basis vectors]]

$e_1=(1,0),\quad e_2=(0,1)$ creates square grid
$e_1=(1,0),\quad e_2=(\dfrac{1}{2},\dfrac{\sqrt{3}}{2})$ creates [[hexagonal coordinates|hexagonal grid]]
### Example
`Square Grid`
``` c
vec2 cell = floor(uv);
vec2 local = fract(uv);
```
`Hexagonal Grid`
``` c
// store basis vectors as columns in a matrix
M = mat2(vec2(1, 0), vec2(0.5, 0.866));

// transform to hexagonal lattice space
uv = inverse(M) * uv;

// divide into cells
vec2 cell = floor(uv);
vec2 local = fract(uv);

// transform back to square grid
uv = M * uv;
```