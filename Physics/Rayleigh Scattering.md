Describes scattering of [[Light]] by air particles
For scattering by larger particles see [[Mie Scattering]]

Responsible for blue/orange sky
### Scattering $\beta^S_R(h,\lambda)=\frac{8\pi^3(\eta^2-1)^2}{3N\lambda^4}e^{-\frac{h}{H_R}}$
- $\beta^S_R$ Here $R$ stands for Rayleigh, $S$ for scattering
- $\eta$ Index of refraction of [[Air]]
- $N$ Molecular density at sea level
- $\lambda$ Wave length
- $h$ Altitude
- $H_R$ Height scale `8km`
### Precomputed $\frac{8\pi^3(\eta^2-1)^2}{3N\lambda^4}$
- Blue $440nm$ $33.1\times10^{-6}m^{-1}$
- Green $550nm$ $13.5\times10^{-6}m^{-1}$
- Red $680nm$ $5.8\times10^{-6}m^{-1}$
### Phase $P_R(\mu)=\frac{3}{16\pi}(1+\mu^2)$
- $\mu$ Cosine angle between light and view directions
``` c
vec3 rayleigh(float h, float mu) {
    // precomputed rayleigh scattering for (R 440nm, G 550nm, B 680nm)
    const vec3 precomp = vec3(33.1, 13.5, 5.8) * 1e-6;
    float phase = 3.0 * (1.0 + mu * mu) / (16.0 * 3.1415);
    return precomp * phase * exp(-h / 8000.0);
}
```
