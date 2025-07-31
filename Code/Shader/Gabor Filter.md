oriented sinusoidal wave with exp envelope applied
which makes this filter locilized in space and frequency domain
useful for locilized feature detection `some eyes use gabor filter`
``` c
vec2 gabor(vec2 uv, float frequency, float sigma, float theta, float phase) {
    vec2 r = uv * cos(theta) + vec2(uv.y, -uv.x) * sin(theta);
    float gauss = exp(-dot(r, r) / (2.0 * sigma * sigma));
    float cosine = cos(TAU * frequency * r.x + phase);
    return vec2(gauss * cosine);
}
```
