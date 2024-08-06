Converts time domain to frequency domain
For other way around use Inverse fourier transform
### Formula $f(\omega)=\int_{-\infty}^\infty x(t)e^{-i\omega t}dt$
How much $\omega$ frequency signal has
> [!note]
> - [[Complex Number]] $e^{-i\omega t}$ acts as $(\sin(\omega t),\cos(\omega t))$ multiplication
> - $n$ length waveform is converted to $n$ length frequency domain, but 2nd half is same as 1st except mirrored
> - You need x2 as much samples than the maximum frequency you want to measure, this is called [[Nyquist Frequency]]
> - When you convert a waveform signal into a new one, the original waveform signal is called **Analysis Signal** and new one is called **Synthesis Signal**
### Properties
| Property        | Spatial Domain                 | Frequency Domain                    |     |
| --------------- | ------------------------------ | ----------------------------------- | --- |
| Linearity       | $\alpha f_1(x)+\beta f_2(x)$   | $\alpha F_1(u)+\beta F_2(u)$        |     |
| Scaling         | $f(ax)$                        | $\huge\frac{F(\frac{u}{a})}{\|a\|}$ |     |
| Shifting        | $f(x-a)$                       | $e^{-2\pi ua}F(u)$                  |     |
| Differentiation | $\large\frac{d^n}{dx^n}(f(x))$ | $(i2\pi u)^nF(u)$                   |     |
| [[Convolution]] | $a(x)*b(x)$                    | $A(x)B(x)$                          |     |
### Variants
- [[Short Time Fourier Transform (STFT)]]
