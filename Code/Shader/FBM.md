``` c
float fbm(vec2 p, int octaves) {
	float s = 0.0, m = 0.0, a = 1.0;
	for(int i = 0; i < octaves; i++) {
		s += a * noise(p);
		m += a;
		a *= 0.5;
		p *= mat2(1.6, 1.2, -1.2, 1.6);
	}
	return s / m;
}
// "f *= f * (3.0 - 2.0 * f)" is smoothstep(0, 1, f)
// Remove for slight performance and linear look
// Rotate fbm noise for no grid bias: 
// p *= mat2(cos(0.5), sin(0.5), -sin(0.5), cos(0.5));
// p *= mat2(.877, .479, -.479, .877);
// Make it swirly
// p += vec2(cos(s * 6.0));
// 3D rot
// mat3(0, 1.6, 1.2, -1.6, 0.72,-0.96, -1.2,-0.96, 1.28)
```
###### FBM Coefficients
``` python
noise(p * 1.0) * 1.0 + noise(p * 2.0) * 0.5 + noise(p * 4.0) * 0.25 # does not sum to 1

# how to calculate lowest coefficient so that N levels of noise sum to 1
lowest_coeff = 1 / ((1 << octaves) - 1)
nth_lowest_coeff = (1 << n) / ((1 << octaves) - 1)

N = 3:
lowest_coeff = 1 / (2^3 - 1) = 1 / 7
fbm = (n0 * 4 + n1 * 2 + n2) / 7
```
