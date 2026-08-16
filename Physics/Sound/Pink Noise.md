[[White Noise]] with [[power spectral density]] scaled by $1/f$
### Generating Pink Noise
``` python
# Pink noise via Voss-McCartney (cheap, good enough, stateless)
def pink_noise(n, octaves=16):
    y = np.zeros(n)
    for i in range(octaves):
        step = 2 ** i
        y += np.repeat(np.random.randn(n // step + 1), step)[:n]
    return y / octaves

# Industry-standard for fast high quality pink noise (stateful)
# How It Works:
# - have parallel 1-pole filters b[0:6] 
#   - 1-pole meaning [new = old * 0.99 + white * 0.05]
#   - 1-pole filter rolloff by -6dB/octave, like brown noise
# Basically 6 pole IIR filter
def pink_noise_paul_kellet(white_sample, b):
    b[0] = 0.99886 * b[0] + white * 0.0555179
    b[1] = 0.99332 * b[1] + white * 0.0750759
    b[2] = 0.96900 * b[2] + white * 0.1538520
    b[3] = 0.86650 * b[3] + white * 0.3104856
    b[4] = 0.55000 * b[4] + white * 0.5329522
    b[5] = -0.7616 * b[5] - white * 0.0168980
    pink = b[0] + b[1] + b[2] + b[3] + b[4] + b[5] + b[6] + white * 0.5362
    b[6] = white * 0.115926
    return pink

# +/- 0.5dB
def pink_noise_paul_kellet_cheap(white, b):
    b[0] = 0.99765 * b[0] + white * 0.0990460;
    b[1] = 0.96300 * b[1] + white * 0.2965164;
    b[2] = 0.57000 * b[2] + white * 1.0526913;
    pink = b[0] + b[1] + b[2] + white * 0.1848;
```
- or generate via [[FBM]] with $\text{gain}=1/\sqrt{2}$ (see [[colored noise]])