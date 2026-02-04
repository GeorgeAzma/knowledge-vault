### Value
``` c
float hash11(float p) {
    p = fract(p / 0.1031);
    p *= p + 33.33;
    return fract(p * p * 2.0);
}

float noise(float p) {
	float i = floor(p);
    float f = p - i;
    f *= f * (3.0 - 2.0 * f);
	return mix(hash11(i), hash11(i + 1.0), f);
}
```
### Basic
``` c
float hash11(float p) {
    p = fract(p / 0.1031);
    p *= p + 33.33;
    return fract(p * p * 2.0);
}

float noise(float x) {
    float i = floor(x);
    float f = x - i;
    float s = sign(fract(x * 0.5) - 0.5);
    float k = hash11(i * 0.1731);
    return s * f * (f - 1.0) * ((16.0 * k - 4.0) * f * (f - 1.0) - 1.0) * 0.5 + 0.5;
}
```
