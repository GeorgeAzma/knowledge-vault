### Volume $\frac{4}{3}\pi r^3$
### Area $4\pi r^2$
### Distance Between 2 Points Along a Sphere $r\arccos{\dfrac{a\cdot b}{r^2}}$
### Spherical Coordinates
``` python
# Y = up
(lon, lat) = (atan2(x, z), asin(y))
(x, y, z) = (cos(lat) * cos(lon), sin(lat), cos(lat) * sin(lon))

# Z = up
(lon, lat) = (atan2(z, x), acos(-y))
(x, y, z) = (sin(lat) * cos(lon), -cos(lat), sin(lat) * sin(lon))

(x, y, z) = (uv.xy, sqrt(1 - dot(uv, uv)))
```

### [[Distribute Points On Sphere]]
### Other
- Average efficiency for packing spheres in a cube $\frac{​\pi}{3\sqrt{2}}=0.74048$ or $~0.74\%$
- Best arrangment for filling space is Face Centered Cubic (FCC)
