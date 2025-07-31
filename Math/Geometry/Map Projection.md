---
aliases:
  - Equirectangular
  - Mercator
  - Sphere
  - Earth
  - Latitude
  - Longitude
  - Projection
---

![[Latitude and Longitude.webp]]
Latitude is $y$ and Longitude is $x$

## Mercator Projection
Rectangular map is wrapped around a sphere like a cylinder and points near the poles are squeezed to fit
### Sphere point to longitude/latitude
``` python
# (x, y, z) is point on a unit sphere
longitude = atan(z, x) # -PI to PI
latitude = acos(-y) # -PI to PI

# GLSL
vec2(atan(z, x), acos(-y))
```
### Longitude/Latitude to sphere point
``` python
# (x, y, z) is point on a unit sphere
x = cos(latitude) * cos(longitude)
y = sin(latitude)
z = cos(latitude) * sin(longitude)

# GLSL
vec3(cos(latitude) * cos(longitude), sin(latitude), cos(latitude) * sin(longitude))
```

> [!example]
> ``` c
> float mr = min(iResolution.x, iResolution.y);
> vec2 uv = (fragCoord * 2.0 - iResolution.xy) / mr;
>   
> if (length(uv) > 1.0) 
>   return;
> 
> float z = -sqrt(1.0 - dot(uv, uv));
> vec2 coord = vec2(atan(z, uv.x), acos(-uv.y));
> ```

> [!note]
> Calculating $(x,y,z)$ from uv:
> 1. Define unit sphere: $x^2+y^2+z^2=1$
> 2. $x=uv.x$ and $y=uv.y$, because length of uv is less than 1 already
> 3. $-z^2=x^2+y^2-1$ so $z^2=1-x^2-y^2$
> 6. $z=\sqrt{1-dot(uv, uv)}$
> 7. and take $-z$ because $-z$ is facing us
> 8. Final equation: $z=-\sqrt{1-dot(uv, uv)}$

### Cubemap Equirectangular Mapping
``` c
// Cubemap to Equirectangular map uv[-1; 1]
float longitude = uv.x * PI;
float latitude = uv.y * PI * 0.5;
vec3 col = texture(cubemap, vec3(cos(latitude) * cos(longitude), sin(latitude), cos(latitude) * sin(longitude))).rgb;

// Using Equirectangular as Cubemap, p is sampling direction
vec2 uv = vec2(atan(p.z, p.x) * 0.5, asin(p.y)) / PI + 0.5;
vec3 col = texture(equirect, uv);
```
> [!tip] Most optimal equirectangular map aspect ratio is $2:1$ 
