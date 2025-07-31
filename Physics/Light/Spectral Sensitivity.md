How sensitive SML cones in human eye are to different [[Light|Wavelengths]]
![[Spectral Sensitivity.webp]]
`SML cone response`
> [!note] 
> - SML cones roughly correspond to RGB
> - SML plots are usually normalized like above
### Approximation
``` c
#define PI 3.14159265358
#define gauss(x, u, o, A) A/o*exp(-0.5*pow((x - u)/o, 2.0))
    
// Fitted to CIE 2006 2° cone fundamentals by Stockman & Sharp 2000
vec3 wave2lms(float wave, vec3 amount) {
	return vec3(
		// L cone response curve
		gauss(wave, 449.682, 21.6622, 2.366120) +
		gauss(wave, 477.589, 11.0682, 1.398830) +
		gauss(wave, 532.488, 25.7494, 34.04780) +
		gauss(wave, 570.200, 5.91487, 0.243387) +
		gauss(wave, 585.858, 34.9800, 77.86690),

		// M cone response curve
		gauss(wave, 450.237, 19.5222, 3.335370) +
		gauss(wave, 479.559, 13.3211, 3.688130) +
		gauss(wave, 519.924, 17.1502, 9.684840) +
		gauss(wave, 542.800, 3.27696, 0.105766) +
		gauss(wave, 552.158, 33.3895, 77.92980),

		// S cone response curve
		gauss(wave, 467.661, 8.84562,  5.3207300) +
		gauss(wave, 422.211, 10.2028,  8.5849800) +
		gauss(wave, 443.084, 11.9848,  19.634700) +
		gauss(wave, 444.863, 1.30608, -0.0330768) +
		gauss(wave, 460.886, 25.7907,  24.912800)
	) / sqrt(2.0 * PI);
}
```
