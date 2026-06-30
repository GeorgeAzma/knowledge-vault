---
aliases:
  - Shirley-Chiu Mapping
  - Grid To Disk Mapping
  - Distribute Points Inside Circle
  - Distribute Points On Disk
  - Vogel Spiral
---
### Shirley-Chiu Mapping `point grid -> disk`
```c
uv * sqrt(1.0 - uv.yx * uv.yx * 0.5) // uv: [-1; 1]
```
![[Shirley-Chiu.webp#rounded-xl|350]]
### Vogel Spiral $r=\sqrt{n},~~\theta=n\alpha$
- $\alpha=\pi(3-\sqrt5)=\tau\left(2-\phi\right)=2.3999632297286533222$ [[Golden Ratio|Golden Angle]]
``` c
float n = floor(gl_FragCoord.y) * u_resolution.x + floor(gl_FragCoord.x);
vec2 p = sqrt(n / (u_resolution.x * u_resolution.y)) * vec2(cos(n * 2.399963229728), sin(n * 2.399963229728));

// coil spiral: (cos(sqrt(n) * 2.4), sin(sqrt(n) * 2.4))
```
![[Vogel Spiral.webp#rounded,invert|350]]
