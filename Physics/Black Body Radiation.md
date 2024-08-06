### Formula $B(\lambda,T)=\large\frac{2\pi c^2h}{\lambda^5(e^{\frac{hc}{\lambda kT}}-1)}$
- $B$ spectral radiance
- $\lambda$ [[Light|Wavelength]]
- $T$ temperature
- $h$ [[Physics/Constants#Planck's Constant $h=6.62607015 times10 {-34}Js$|Planck's Constant]]
- $c$ [[Physics/Constants|Speed of Light]]
- $k$ [[Physics/Constants#Boltzmann Constant $k_B= frac{PV}{TN}=1.380649 times10 {-23}m 2kgs {-2}K {-1}$|Boltzmann Constant]]
``` c
// 400-700nm (0-1) Approximation
float blackbody(float w) {
    return 1.0 / (pow(w * 0.221 + 0.2954, 5.0) * (exp(8.3 / (w + 1.33)) - 1.0));
}
```
