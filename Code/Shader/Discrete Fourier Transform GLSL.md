``` c
// Fourier Transform 
// iChannel0 is input image, iChannel1 is old output
void mainImage(out vec4 fragColor, vec2 fragCoord) {
    fragColor = vec4(0);
    
    if (fragCoord.x > SIZE || fragCoord.y > SIZE) return;
        
    for (float n = 0.; n < SIZE; n++)  {
        vec2 xn = texture(iChannel0, vec2(n + 0.5, fragCoord.y) / iResolution.xy).xy,
             yn = texture(iChannel1, vec2(fragCoord.x, n + 0.5) / iResolution.xy).zw,
             a = -TAU * (fragCoord - 0.5 - SIZE * 0.5) * n / SIZE;
        
        fragColor.zw += cmul(xn, a.x);
        fragColor.xy += cmul(yn, a.y);
    }
}
```
``` c
// Inverse Fourier Transform 
// iChannel0 is input FFT, iChannel1 is old output
void mainImage(out vec4 fragColor, vec2 fragCoord) {
    fragColor = vec4(0);
    
    if (fragCoord.x > SIZE || fragCoord.y > SIZE) return;

    for (float n = 0.; n < SIZE; n++)  {
        float m = W(n);
        vec2 xn = texture(iChannel0, vec2(m + 0.5, fragCoord.y) / iResolution.xy).xy,
             yn = texture(iChannel1, vec2(fragCoord.x, m + 0.5) / iResolution.xy).zw,
             a = TAU * (fragCoord - 0.5) * n / SIZE;
        
        fragColor.zw += cmul(xn, a.x);
        fragColor.xy += cmul(yn, a.y);
    }
    fragColor /= SIZE;
}
```
