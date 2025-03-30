Describes scattering of light by aerosols
which are tiny particles, but bigger than air particles
for scattering of air particles see [[Rayleigh Scattering]]
`responsible for white sky, fog, pollution`
### Scattering $\beta^S_M(h,\lambda)=\beta^S_M(0,\lambda)e^{-\frac{h}{H_M}}$
- $\beta^S_M$ Here $M$ stands for Mie, $S$ for scattering
- $B^S_M(0,\lambda)=21e^{-4}m^{-1}$
- $h$ Altitude
- $H_M$ Height scale `1.2km`
### Phase $P_M(\mu)=\frac{3}{8\pi}\frac{(1-g)^2(1+\mu^2)}{(2+g^2)(1+g^2-2g\mu)^\frac{3}{2}}$
- $g$ medium anisotropy, aerosols have a strong forward directivity `0.76`
- $\mu$ `dot(to_light, eye_dir)`
``` c
float mie_phase(float g, float mu) {
    float p = (8.0 * 3.142 * (2.0 + g * g) * (1.0 + g * g - 2.0 * g * mu));
    return (1.0 - g) * (1.0 - g) * (1.0 + mu * mu) * 3.0 / sqrt(p * p * p);
}

float mie_scatter(float h, float g, float mu) {
    float beta = 0.00021; // mie scattering at 0 altitude
    return beta * mie_phase(g, mu) * exp(-h / 8000.0)
}
```
