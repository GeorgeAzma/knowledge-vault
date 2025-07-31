### Formula $I-2(I \cdot n)n$
- $I$ Incident vector `light`
- $n$ Surface normal
> [!tip] When reflecting a ray, normal vector is always in the middle
> So $n=\huge \frac{\omega_i+\omega_o}{||\omega_i+\omega_o||}$ $\omega_i$ to light; $\omega_o$ reflected; $n$ normal
### Reflectance and Transmittance
Percentage of light to reflect and [[Refraction|Refract]]
- Perpendicular (s-polarized) light $R_s=\large|\frac{n_1\cos\theta_i-n_2\cos\theta_t}{n_1\cos\theta_i+n_2\cos\theta_t}|^2$
- Parallel (p-polarized) light $R_p=\large|\frac{n_2\cos\theta_i-n_1\cos\theta_t}{n_2\cos\theta_i+n_1\cos\theta_t}|^2$
- Non-polarized light $R=\frac{R_s+R_p}{2}$
- Transmittance $T=1-R$ `refraction`
> [!tip] When looking straight at the surface formula simplifies to $\huge|\frac{n_1-n_2}{n_1+n_2}|^2$
> > [!example] Air to Glass $|\frac{1-1.5}{1+1.5}|^2=|\frac{-0.5}{2.5}|^2=0.2^2=0.04=4\%$ reflection

> [!note] During reflection light phase is shifted by $180\degree$

> [!tip] Use Fresnel-Schlick approximation for efficiency
>> ``` c
>> vec3 fresnel_schlick(vec3 f0, float hdv) { 
>> 	return f0 + (1.0 - f0) * pow(clamp(1.0 - hdv, 0.0, 1.0), 5.0); 
>> }
>> ```
>> $f_0=\huge|\frac{n_1-n_2}{n_1+n_2}|^2$ reflectivity when looking straight at the surface
>> > [!warning] This formula only works for dielectrics/non-metals for metals 
>> > use values from the database like this one
>> > > [!note] $F_0$ is RGB `linear`, since reflectance varies based on wavelength
>> > - **Water** $(0.02,0.02,0.02)$
>> > - **Plastic / Glass (Low)** $(0.03,0.03,0.03)$
>> > - **Plastic High** $(0.05,0.05,0.05)$
>> > - **Glass (High) / Ruby** $(0.08,0.08,0.08)$
>> > - **Diamond** $(0.17,0.17,0.17)$
>> > - **Iron** $(0.56,0.57,0.58)$
>> > - **Copper** $(0.95,0.64,0.54)$
>> > - **Gold** $(1.0,0.71,0.29)$
>> > - **Aluminium** $(0.91,0.92,0.92)$
>> > - **Silver** $(0.95,0.93,0.88)$
### Fresnel Code
> [!tip] $f_0$ to refractive index $n_2=\huge\frac{(\sqrt{f_0}+1)^2}{1-f_0}$
``` c
vec3 fresnel(vec3 n1, vec3 n2, float hdv) {
	vec3 ior = n2 / n1;
    vec3 t = sqrt(ior * ior + hdv * hdv - 1.0);
    vec3 rs = (hdv - ior * t) / (hdv + ior * t);
    vec3 rp = (t - ior * hdv) / (t + ior * hdv);
	return mix(rs * rs, rp * rp, 0.5);
}
```
