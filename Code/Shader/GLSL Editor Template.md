``` c
#ifdef GL_ES
precision mediump float;
#extension GL_OES_standard_derivatives: enable
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    vec2 uv = (gl_FragCoord.xy * 2.0 - u_resolution) / min(u_resolution.x, u_resolution.y);
    gl_FragColor = vec4(uv, 0, 1);
}
```
