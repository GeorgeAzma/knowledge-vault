### Morlet Formula $\Psi_\sigma(t)=c_\sigma\pi^{-\frac14}e^{-\frac12t^2}(e^{i\sigma t}-k_\sigma)$
- $k_\sigma=\large e^{-\frac12\sigma^2}$
- $c_\sigma=\large(1+e^{-\sigma^2}-2e^{-\frac34\sigma^2})^{-\frac12}$
### Morlet [[Fourier Transform]] $\hat{\Psi}_\sigma(\omega)=c_\sigma\pi^{-\frac14}(e^{-\frac12(\sigma-\omega)^2}-k_\sigma e^{-\frac12\omega^2})$
> [!tip] 
> $\sigma=[5;6]$, for decent time/frequency resolution
> ${\large\sigma}\ \propto\ \text{Frequency resolution}$
> central frequency $\omega_\Psi=\sigma\huge\frac{1}{1-e^{-\sigma\omega\Psi}}$ `peak of wavelet in frequency space`
> 
> For $\sigma>=5$
> - $k_\sigma<10^{-5}$ so $k_\sigma$ is often set to $0$ and skipped
> - $\omega_\Psi\approx\sigma$
> So simplified formulas are
> - $\Psi_\sigma(t)={\large\pi^{-\frac{1}{4}}e^{-\frac{t^{2}}{2}}}(\cos(\sigma t)-{\large e^{-\frac{\sigma^{2}}{2}}})$
> - $\hat{\Psi}_\sigma(t)=\large\pi^{-\frac{1}{4}}e^{-\frac{(t-\sigma)^2}2}$
> [[Complex Number|complex]] wavelet is often considered Gabor wavelet `2D, used in images`
> 
> `t *= TAU` for wavelet with range `[-0.5; 0.5]`

``` rust
fn morlet_wavelet(t: f32, scale: f32, frequency: f32) -> f32 {
    let norm_factor = 1.0 / (scale * TAU.sqrt());
    let exponential = (-t * t / (2.0 * scale * scale)).exp();
    let sinusoidal = (TAU * frequency * t).cos();
    norm_factor * exponential * sinusoidal
}
```
