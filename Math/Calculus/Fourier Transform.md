Converts time domain to frequency domain
### Formula $f(\omega)=\int_{-\infty}^\infty x(t)e^{-i\omega t}dt$
How much $\omega$ frequency is present in signal
> [!note]
> - [[Complex Number]] $e^{-i\omega t}$ acts as $(\sin(\omega t),\cos(\omega t))$ multiplication
> - $n$ length waveform is converted to $n$ length frequency domain, but 2nd half is mirrored 1st half
> - You need $2\times\text{max measured frequnecy}$ samples, this is called [[Nyquist Frequency]]
> - When you convert a waveform signal into a new one
>   the original waveform signal is **Analysis Signal** and new one is **Synthesis Signal**
### Properties
| Property                        | Spatial Domain                     | Frequency Domain                                   |
| ------------------------------- | ---------------------------------- | -------------------------------------------------- |
| Linearity                       | $\alpha f_1(t)+\beta f_2(t)$       | $\alpha F_1(\omega)+\beta F_2(\omega)$             |
| Scaling                         | $f(at)$                            | $\huge\frac{F(\frac{\omega}{a})}{\mid a\mid}$      |
| Shifting `time`                 | $f(t-t_0)$                         | $e^{-i\omega t_0}F(\omega)$                        |
| Shifting `freq`                 | $f(t)e^{i\omega_0 t}$              | $F(\omega-\omega_0)$                               |
| [[Derivative\|Differentiation]] | $f^{(n)}(t)$                       | $(i\omega)^nF(\omega)$                             |
| [[Convolution]] `time`          | $f_1(t)*f_2(t)$                    | $F_1(\omega)\cdot F_2(\omega)$                     |
| [[Convolution]] `freq`          | $2\pi f_1(t)f_2(t)$                | $F_1(\omega)*F_2(\omega)$                          |
| Reversal                        | $f(-t)$                            | $F(-\omega)=F^*(\omega)$                           |
| [[Integral\|Integration]]       | $\int_{-\infty}^{t}f(\tau)\ d\tau$ | $\frac{F(\omega)}{i\omega}+\pi F(0)\delta(\omega)$ |
|                                 |                                    |                                                    |
### Tips
- `time(narrow) = freq(wide)`
- `periodic = sharp freq`
- `time(amp_change) = wider freq`
- `time(phase change) = wider freq`
- `time(conv) = freq(mul)`
- `time(rect) = freq(sinc)`
- `time(gaussian) = freq(gaussian)`
### Variants
- [[Short Time Fourier Transform (STFT)]]
