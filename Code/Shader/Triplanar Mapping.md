Way of mapping 3 or 6 textures on a sphere using it's normals as weights
There is texture for each axis $x,y,z$
### Pseudo-code
``` python
weight = abs(normal)
weight = weight / (weight.x + weight.y + weight.z)
col = col_front * weight.z + col_top * weight.x + col_side * weight.x
```
