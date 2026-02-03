``` c
#ifdef GL_ES
#extension GL_OES_standard_derivatives: enable
#endif

precision lowp float;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 uv;
vec3 out_col = vec3(0);

float px = 2.0;
vec3 col = vec3(1);

void edge(float sdf) {
    float w = length(vec2(dFdx(sdf), dFdy(sdf)));
    float edge = smoothstep(px + 0.75, px - 0.75, abs(sdf) / w);
    out_col = mix(out_col, col, edge);
}

void graph(float x) {
    vec3 c = (x > 0.0) ? vec3(0.9,0.6,0.3) : vec3(0.65,0.85,1.0);
	c *= 1.0 - exp2(-20.0*abs(x));
	c *= 0.8 + 0.2 * cos(120.0*abs(x));
    float w = length(vec2(dFdx(x), dFdy(x)));
    float line = smoothstep(px + 0.75, px - 0.75, abs(x) / w);
	out_col = mix(c, col, line);
}

void point(float x, float y) {
    float sdf = distance(vec2(x, y), uv);
    edge(sdf);
    px *= 0.7; col *= 0.6; 
    edge(sdf);
    px /= 0.7; col /= 0.6; 
}

float conic(float x, float y, float A, float  B, float C, float D, float E, float F) {
    return A*x*x + B*x*y + C*y*y + D*x + E*y + F;
}

void main()
{
    uv = (gl_FragCoord.xy * 2.0 - u_resolution.xy) / min(u_resolution.x, u_resolution.y);
    
    float A = 1.;
    float B = 0.;
    float C = 2.;
    float D = 0.;
    float E = 0.;
    float F = -0.5;
    float x = conic(uv.x, uv.y, A, B, C, D, E, F);

    graph(x);
    
    px = 6.0;
    col = vec3(1, 0, 0);
    point(0.5, 0.2);

    gl_FragColor = vec4(out_col, 1);
}
```