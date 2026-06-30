``` c
vec2 cmul(vec2 a, vec2 b) {
    return vec2(
        a.x*b.x - a.y*b.y,
        a.x*b.y + a.y*b.x
    );
}

void main() {
    fragColor = vec4(0);
    vec2 a = -TAU * floor(gl_FragCoord.xy) / u_resolution;
    vec4 rot = vec4(cos(a), sin(a));
    if (u_recursion == 0) {
        for (float n = 0.0; n < u_resolution.x; n++)  {
            vec2 xn = vec2(texelFetch(u_pass1, ivec2(n, gl_FragCoord.y), 0).z, 0);
            vec2 phase = vec2(cos(n * a.x), sin(n * a.x));
            fragColor.zw += cmul(xn, phase);
        }
    } else if (u_recursion == 1) {
        for (float n = 0.0; n < u_resolution.y; n++)  {
            vec2 yn = texelFetch(u_pass2, ivec2(gl_FragCoord.x, n), 0).zw;
            vec2 phase = vec2(cos(n * a.y), sin(n * a.y));
            fragColor.xy += cmul(yn, phase);
        }
        fragColor.xy /= u_resolution.x * u_resolution.y;
        // fragColor.xyz = vec3(log(1.0 + 4.0 * length(fragColor.xy)));
    } else if (u_recursion == 2) { // IFFT
        for (float n = 0.0; n < u_resolution.y; n++)  {
            vec2 yn = texelFetch(u_pass2, ivec2(gl_FragCoord.x, n), 0).xy;
            vec2 phase = vec2(cos(n * -a.y), sin(n * -a.y));
            fragColor.xy += cmul(yn, phase);
        }
    } else if (u_recursion == 3) { // IFFT
        for (float n = 0.0; n < u_resolution.x; n++)  {
            vec2 xn = texelFetch(u_pass2, ivec2(n, gl_FragCoord.y), 0).xy;
            vec2 phase = vec2(cos(n * -a.x), sin(n * -a.x));
            fragColor.zw += cmul(xn, phase);
        }
        fragColor = vec4(fragColor.z);
    }
}
```