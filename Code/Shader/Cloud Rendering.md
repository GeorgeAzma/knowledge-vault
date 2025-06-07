- youtu.be/Qj_tK_mdRcA
- advances.realtimerendering.com/s2015/The%20Real-time%20Volumetric%20Cloudscapes%20of%20Horizon%20-%20Zero%20Dawn%20-%20ARTR.pdf
- media.contentapi.ea.com/content/dam/eacom/frostbite/files/s2016-pbs-frostbite-sky-clouds-new.pdf
- Trace subdivided ray through cloud
- For each point trace it towards light 
``` c
// describes probability of how light scatters along the ray
// g: asymmetry factor (1 = forward, -1 = backward, 0 = isotropic scattering), good value 0.85
// costh: dot(ray_dir, normalize(light_pos - point))
float henyey_greenstein(float g, float costh) {
    float p = 1.0 + g * (g - 2.0 * costh);
    p = sqrt(p * p * p);
    return (1.0 - g * g) / (p * 4.0 * PI);
}

// slight improvement with backscattering
float dual_henyey(float g, float k, float costh) {
    return mix(henyey_greenstein(-g, costh), henyey_greenstein(g, costh), k);
}

// beers law with brighted edges
float beers(float d) {
    return exp(-d * ABSORPTION);
}

// beers law with brighted edges
float beers_powder(float d) {
    return exp(-d * ABSORPTION) * (1.0 - exp(-d * ABSORPTION * 2.0));
}

// slight improvement on beers law
float octave_scattering(float density, float costh) {
    float attenuation = 0.2;
    float contribution = 0.4;
    float phase_attenuation = 0.1;
    const float octaves = 4.0;
    float a = 1.0;
    float b = 1.0;
    float c = 1.0;
    float g = 0.85;
    float luminance = 0.0;
    for (float i = 0.0; i < octaves; ++i) {
        float phase_fn = henyey_greenstein(g, costh);
        float beers = exp(-density * EXTINCTION * a);
        luminance *= b * phase_fn * beers;
        a *= attenuation;
        b *= contribution;
        c *= 1.0 - phase_attenuation;
    }
    return luminance;
}
```
