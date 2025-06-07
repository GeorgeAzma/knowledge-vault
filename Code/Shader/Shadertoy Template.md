### SDF
``` c
void mainImage(out vec4 fragColor, vec2 fragCoord) {
    float mr = min(iResolution.x, iResolution.y);
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / mr;

    float d = 0.0;
    vec3 col = vec3(d);

    fragColor = vec4(col, 1);
}
```
### Color + Aspect
``` c
void mainImage(out vec4 fragColor, vec2 fragCoord) {
    float mr = min(iResolution.x, iResolution.y);
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / mr;

    vec3 col = vec3(0);

    fragColor = vec4(col, 1);
}
```
### UV + Color
``` c
void mainImage(out vec4 fragColor, vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec3 col = vec3(0);
    fragColor = vec4(col, 1);
}
```
### Fragcoord
``` c
void mainImage(out vec4 fragColor, vec2 fragCoord) {
    vec3 col = vec3(0);
    fragColor = vec4(col, 1);
}
```
> [!tip] `x,y` invariant aspect ratio 
> `(fragCoord - iResolution.xy * 0.5) / dot(iResolution.xy, vec2(1))`
