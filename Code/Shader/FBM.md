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
