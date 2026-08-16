[[White Noise]] with [[power spectral density]] scaled by $f^2$
``` c
float violet_noise(uint sample_idx) {
    float white_current = hash(uint(sample_idx));
    float white_previous = hash(uint(sample_idx - 1u));
    // Differentiation high-pass filters the signal (+6 dB/octave)
    return (white_current - white_previous) * 0.5;
}
```