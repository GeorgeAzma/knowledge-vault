- **Wind** just move through 1D/2D fbm 
  - Can also offset position with ear location
  - Or multiply and clip the sound for strong wind effect
- **Rain**
``` c
float fbm(float p, int octaves) {
	float s = 0.0, m = 0.0, a = 1.0;
	for(int i = 0; i < octaves; i++) {
		s += a * noise(p);
		m += a;
		a *= 0.7;
		p *= 1.5;
	}
	return s / m;
}
sound = sin(fbm(t * 128.0, 16) * 200.0)
```
