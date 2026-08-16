Waveform used to generate [[Phonetic Alphabet|formants]] and [[Phonetic Alphabet|vocal]] [[Sound|sounds]]
### $\text{FOF}(t)=\dfrac{1}{2}\left(1-\cos\dfrac{\pi t}{A}\right)e^{-Bt}\sin(2\pi Ft)$
``` c
float fof_pulse(float t, float F, float B, float attack_time) {
    float env = t < attack_time ? 0.5 * (1.0 - cos(3.14159265 * t / attack_time)) : 1.0;
    return env * exp(-3.14159265 * B * t) * sin(6.2831853 * F * t);
}

float fof_vowel(float t, float f0) {
    t = mod(t, 1.0 / f0);
    // Vowel 'A' Formants
    float f1 = fof_pulse(t, 730.0, 80.0, 0.002);
    float f2 = fof_pulse(t, 1090.0, 90.0, 0.003);
    float f3 = fof_pulse(t, 2440.0, 100.0, 0.004);
    return (f1 + f2 * 0.5 + f3 * 0.25);
}
```