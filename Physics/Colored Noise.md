### $H(f_k)=\dfrac{1}{f_k^{\alpha/2}}$
Multiplies amplitudes of [[fourier transform]] frequency components $f_k$ by $\dfrac{1}{f_k^{\alpha/2}}$
where alpha is an integer constant based on colored noise type
##### [[Brown Noise]] $\alpha=-2$
`a.k.a. Red Noise`
- [[White Noise]] [[Power Spectral Density|PSD]] scaled by $1/f^2$ 
##### [[Pink Noise]] $\alpha=-1$
- [[White Noise]] [[Power Spectral Density|PSD]] scaled by $1/f$
##### [[White Noise]] $\alpha=0$
##### [[Physics/Sound/Blue Noise|Blue Noise]] $\alpha=1$
- [[White Noise]] [[Power Spectral Density|PSD]] scaled by $f$
##### [[Violet Noise]] $\alpha=2$
- [[White Noise]] [[Power Spectral Density|PSD]] scaled by $f^2$
##### [[Gray Noise]]
has equal human ear perceived loudness for each frequency
##### Generate Using [[FBM]]
`TODO:`
``` c
// gain: amplitude multiplier after each octave.
// -  brown noise: 0.5
// -   pink noise: 0.707 
// -  white noise: 1
// -   blue noise: 1.414
// - violet noise: 2
float colored_noise(float p, float gain) {
    float s = 0.0, m = 0.0, a = 1.0;
    for (int i = 0; i < 10; ++i) {
        s += a * p.value();
        m += a;
        a *= gain;
        p *= 2.0;
    }
    return s / m;
}

// sums sines directly (uses random phase for sines)
// alpha: used to calculate sine wave amplitude scaling based on frequency 
//        amplitude = pow(f, -alpha * 0.5)
// -  brown noise: -2
// -   pink noise: -1
// -  white noise:  0
// -   blue noise:  1
// - violet noise:  2
float harmonic_colored_noise(float t, float alpha) {
    float signal = 0.0, norm = 0.0;
    for (float f = 1.0; f <= 32.0; ++f) {
        float amp = pow(f, -alpha * 0.5);
        float phase = hash(f) * 6.283185; 
        signal += sin(f * t + phase) * amp;
        norm += amp;
    }
    return signal / norm;
}
```