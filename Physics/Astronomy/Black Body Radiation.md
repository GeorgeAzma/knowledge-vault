### Formula $B(\lambda,T)=\large\frac{2\pi c^2h}{\lambda^5(e^{\frac{hc}{\lambda kT}}-1)}$
- $B$ spectral radiance
- $\lambda$ [[Light|Wavelength]]
- $T$ temperature
- $h$ [[Planck's Constant]]
- $c$ [[Planck's Constant|Speed of Light]]
- $k=k_B=\frac{PV}{TN}=1.380649\times10^{-23}m^2kgs^{-2}K^{-1}$ Boltzmann Constant
``` c
// 400-700nm (0-1) Approximation
float blackbody(float w) {
    return 1.0 / (pow(w * 0.221 + 0.2954, 5.0) * (exp(8.3 / (w + 1.33)) - 1.0));
}
```
##### Boltzmann Constant $k_B=\frac{PV}{TN}=1.380649\times10^{-23}m^2kgs^{-2}K^{-1}$
- $P$ pressure
- $V$ volume
- $T$ temperature
- $N$ molecules
### Inverse $T(\lambda)=\dfrac{hc}{\lambda k_B \ln(\dfrac{2hc}{\lambda^5L(\lambda)}+1)}$
- $L(\lambda)$ radiance at $\lambda$ wavelength
### Wien's Displacement Law $\lambda_{max}\approx\dfrac{0.002897}{T}$
- $\lambda_{max}$ peak emissive wavelength
- $\text{Sun}(~5778K)\approx501\text{nm}$ [[Wavelength To Color]] `negligible variation over time/surface`
