### Simplest
``` c
// returns (sdf, mat_id) 
vec2 scene(vec3 p) {
    return vec2(length(p - vec3(0, 0, 1)) - 0.5, 0);
}

vec2 march(vec3 ro, vec3 rd) {
    const float MAX_DIST = 32.0;
    const float SURF = 0.001;
    const float STEPS = 64.0;
    
    float d = 0.0;
    for (float i = 0.0; i < STEPS; ++i) {
        vec2 sc = scene(ro + rd * d);
        if (sc.x <= SURF)
            return vec2(d, sc.y);
        d += sc.x;
        if (d > MAX_DIST)
            break;
    }
    return vec2(MAX_DIST, -1);
}

void mainImage(out vec4 fragColor, vec2 fragCoord) {
    float mr = min(iResolution.x, iResolution.y);
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / mr;

    vec3 ro = vec3(0);
    vec3 rd = normalize(vec3(uv, 1)); // normalize(vec3(uv, tan((PI - radians(FOV = 90)) * 0.5)))
    vec2 hit = march(ro, rd);
    vec3 col =  (hit.y == 0.0 ? hit.x * vec3(0.5, 0.3, 0.9) : vec3(0));

    fragColor = vec4(col, 1);
}
```
### Lit `diffuse + specular + subsurface`
``` c
const float PI = 3.14159265358;

void add(inout vec2 d, float sdf, float id) {
    if (sdf <= d.x)
        d = vec2(sdf, id);
}

// returns (sdf, mat_id) 
vec2 scene(vec3 p) {
    vec2 d = vec2(99999, -1);
    add(d, length(p - vec3(0, 0, 1)) - 0.5, 0.0);
    return d;
}

// returns (dist, sdf, mat_id) 
vec3 march(vec3 ro, vec3 rd) {
    const float MAX_DIST = 32.0;
    const float SURF = 0.001;
    const float STEPS = 64.0;
    
    float d = 0.0;
    float min_sdf = MAX_DIST;
    for (float i = 0.0; i < STEPS; ++i) {
        vec2 sc = scene(ro + rd * d);
        if (sc.x <= SURF)
            return vec3(d, sc);
        d += sc.x;
        if (d > MAX_DIST) {
            break;
        }
        min_sdf = min(min_sdf, sc.x);
    }
    return vec3(MAX_DIST, min_sdf, -1);
}

float geometry_schlick_ggx(float c, float kr) {
    float k = (kr + 1.0) * (kr + 1.0) / 8.0;
    return c / (c * (1.0 - k) + k);
}

float geometry_smith(float ndv, float ndl, float kr) {
    return geometry_schlick_ggx(ndv, kr) * geometry_schlick_ggx(ndl, kr);
}

// n: relative index of refraction
// k: complex index of refraction (useful for edge tint)
// c: dot(view_dir, normal)
vec3 fresnel(vec3 n, vec3 k, float c) {
    vec3 n2k2 = n * n + k * k;
    float c2 = c * c;
    vec3 nc = 2.0 * n * c;
    vec3 rs = (n2k2 - nc + c2) / (n2k2 + nc + c2);
    vec3 rp = (n2k2 * c2 - nc + 1.0) / (n2k2 * c2 + nc + 1.0);
    return 0.5 * (rs + rp);
}

// l: light_dir
// n: normal
// v: view/ray direction
// kr: roughness/microfacet amount
// kn: refraction index
// ke: complex refraction index / edge tint
// kl: light color
// kd: diffuse color
// ksr: subsurface radius
vec3 lighting(vec3 l, vec3 n, vec3 rd, float kr, vec3 kn, vec3 ke, vec3 kl, vec3 kd, vec3 ksr) {
    vec3 v = -rd;
    vec3 h = normalize(l + v);
    float ndh = max(0.0, dot(n, h)); // blin phong
    float ndl = dot(n, l);
    float pndl = max(0.0, ndl); // lambert diffuse
    float ndv = max(0.0, dot(n, v));
    float hdv = max(0.0, dot(h, v));
    float g = ndh * ndh * (kr * kr - 1.0) + 1.0; 
    float D = kr * kr / (g * g * PI); // GGX/Trowbridge-Reitz distribution
    float G = geometry_smith(ndv, ndl, kr);
    vec3 F = fresnel(kn, ke, ndv);
    vec3 sss = 0.2 * exp(-3.0 * abs(ndl) / (ksr + 0.001));
    float denom = 4.0 * ndl * ndv + 1e-4; // specular energy conservation
    vec3 ks = F * D * G / denom; // specular
    return kl * (pndl * (kd + ks) + kd * ksr * sss); // diffuse + specular + subsurface
}


vec3 calc_normal(vec3 p, float d) {
    vec2 e = vec2(0.0001, 0.0);
    return normalize(d - vec3(scene(p - e.xyy).x, scene(p - e.yxy).x, scene(p - e.yyx).x));
}

vec3 rgb2srgb(vec3 rgb) { 
    return mix(12.92 * rgb, 1.055 * pow(rgb, vec3(1.0 / 2.4)) - 0.055, step(0.0031308, rgb)); 
}

vec3 srgb2rgb(vec3 srgb) { 
    return mix(srgb / 12.92, pow((srgb + 0.055) / 1.055, vec3(2.4)), step(0.04045, srgb));
}

vec3 render(vec3 ro, vec3 rd) {
    vec3 hit = march(ro, rd);
    vec3 p = ro + rd * hit.x;
    
    vec3 n = calc_normal(p, hit.y);
    
    vec3 col = vec3(0);
    if (hit.z == 0.0) {
        col = lighting(normalize(vec3(2, 2, -1)), n, rd, 
            0.01, // roughness 
            vec3(0.47,0.92,1.44), // IOR
            vec3(2.37,2.42,2.14), // edge tint
            srgb2rgb(vec3(1)), // light color
            srgb2rgb(vec3(0.957, 0.759, 0.652)), // diffuse color
            vec3(4, 2, 1) * 0.1 // subsurface radius
        );
    } else if (hit.z == 1.0) {
        col = lighting(normalize(vec3(2, 1, -0.2)), n, rd, 
            0.3, // roughness 
            vec3(1), // IOR
            vec3(1), // edge tint
            srgb2rgb(vec3(1)), // light color
            srgb2rgb(vec3(0.1, 0.5, 0.8)), // diffuse color
            vec3(0, 1, 1) * 0.5 // subsurface radius
        );
    }
    
    return col;
}

void mainImage(out vec4 fragColor, vec2 fragCoord) {
    float mr = min(iResolution.x, iResolution.y);
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / mr;

    vec3 ro = vec3(0);
    vec3 rd = normalize(vec3(uv, 1)); // normalize(vec3(uv, tan((PI - radians(FOV = 90)) * 0.5)))
    
    vec3 col = render(ro, rd);
    col = rgb2srgb(col);
    
    fragColor = vec4(col, 1);
}
```
