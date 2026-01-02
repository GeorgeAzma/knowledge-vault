- **Fract Dither** `fract(dot(gl_FragCoord.xy, vec2(3.5557133, 0.30926924)))`
- **Bayer**
``` c
float bayer2(vec2 uv) {
    int m[4] = int[](0, 2, 3, 1);
    int x = int(mod(uv.x, 2.0));
    int y = int(mod(uv.y, 2.0));
    return float(m[x + y * 2]) * 0.25;
}

float bayer4(vec2 p, int lvl) {
    int x = int(mod(p.x, 4.0));
    int y = int(mod(p.y, 4.0));
    return float((x + y * 4) * lvl % 16) / 16.0;
}
```
- [[Blue Noise]]
- [[Random]] **Noise**
- **Floyd-Steinberg** `iterative`
