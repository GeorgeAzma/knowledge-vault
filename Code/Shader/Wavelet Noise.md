### 2D
``` c
float WaveletNoise(vec2 p, float z, float k) {
    // https://www.shadertoy.com/view/wsBfzK
    float d=0.,s=1.,m=0., a;
    for(float i=0.; i<4.; i++) {
        vec2 q = p*s, g=fract(floor(q)*vec2(123.34,233.53));
    	g += dot(g, g+23.234);
		a = fract(g.x*g.y)*1e3;// +z*(mod(g.x+g.y, 2.)-1.); // add vorticity
        q = (fract(q)-.5)*mat2(cos(a),-sin(a),sin(a),cos(a));
        d += sin(q.x*10.+z)*smoothstep(.25, .0, dot(q,q))/s;
        p = p*mat2(.54,-.84, .84, .54)+i;
        m += 1./s;
        s *= k; 
    }
    return d/m;
}
```
### 3D
``` c
vec3 rot_axis(vec3 p, vec3 ax, float a) {
    return mix(dot(p, ax) * ax, p, cos(a)) + sin(a) * cross(ax, p);
}

// https://www.shadertoy.com/view/wsBfzK
float WaveletNoise(vec3 p, float z, float k) {
    float d=0.,s=1.,m=0., a;
    for(float i=0.; i<5.; i++) {
        vec3 q = p*s, g=fract(floor(q)*vec3(123.34,233.53,314.15));
    	g += dot(g, g+23.234);
		a = fract(g.x*g.y)*1e3 +z*(mod(g.x+g.y, 2.)-1.);
        q = fract(q)-.5;
        q = rot_axis(q, normalize(tan(g+.1)), a);
        d += sin(q.x*10.+z)*smoothstep(.25, .0, dot(q,q))/s;
        p = rot_axis(p,normalize(vec3(-1,1,0)),0.955316618)+i;
        m += 1./s;
        s *= k; 
    }
    return d/m;
}
```
![[Wavelet Noise.png#rounded|500]]