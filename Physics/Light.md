![[Light Spectrum.webp]]
### Speed of Light $c=f\lambda=299,792,458m/s$
- $f$ Wave frequency
### Photon Energy $E=hf=hc/λ$
- $h$ [[Physics/Constants|Planck's Constant]]
- $\lambda$ Wavelength
### 2 Ways to Measure Light
1. **Raw**
	- [[Electricity|Watt]] total power emitted by source
	- **Radiant Intensity**: [[Electricity|Watt]] per [[Steradian]]
	- **Irradiance**: $W/m^2$
	- **radiant exposure**: $J/m^2$ `energy per unit area over time`
2. **Taking into account [[Luminous Efficiency]]**
	- [[Lumen]] total light emitted by a source
	- **Luminouse Intensity** [[Candela]] light intensity in a direction
	- **Illuminance** [[Lux]] light recieved by surface per unit area

| Name                          | Symbol     | Unit                      |
| ----------------------------- | ---------- | ------------------------- |
| Luminous Energy               | $Q_v$      | $lm\cdot s$               |
| Luminous Flux                 | $\Phi_v$   | $lm$                      |
| Luminous Intensity            | $I_v$      | $cd$                      |
| Luminance                     | $L_v$      | $cd/m^2$                  |
| Illuminance                   | $E_v$      | $lx$                      |
| Luminous Exitance             | $M_v$      | $lx$                      |
| Luminous Exposure             | $H_v$      | $lx\cdot s$               |
| Luminous Energy Density       | $\omega_v$ | $lm\cdot s/m^3$           |
| Luminous Efficacy `radiation` | $K$        | $lm/W$                    |
| Luminous Efficacy `source`    | $\eta$     | $lm/W$                    |
| [[Luminous Efficiency]]       | $V$        | $1$ `normalized efficacy` |
##### Visible Spectrum Approximation
``` c
// w = 400-700nm (0-1)
vec3 zucconi(float w) {
	vec3 x = vec3(3.5454, 2.8667, 2.2942) * w - vec3(2.4654, 1.4164, 0.6483);
	return clamp(vec3(0.9768, 0.8407, 0.4648) - x * x, 0.0, 1.0);
}

// w = 400-700nm (0-1)
vec3 zucconi6(float w) {
	vec3 xa = vec3(3.5458, 2.9322, 2.4159) * w - vec3(2.4657, 1.4432, 0.6689);
	vec3 xb = vec3(3.9030, 3.2118, 3.9658) * w - vec3(0.4582, 2.7862, 2.6202);
	return clamp(1.0 - xa * xa - vec3(0.0231, 0.1522, 0.5260), 0.0, 1.0) + 
	       clamp(1.0 - xb * xb - vec3(0.8489, 0.8844, 0.7394), 0.0, 1.0);
}
```
