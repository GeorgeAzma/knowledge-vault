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