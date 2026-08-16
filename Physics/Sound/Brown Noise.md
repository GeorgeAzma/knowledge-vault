[[White noise]] with [[power spectral density]] scaled by $1/f^2$, made by integrating [[white noise]] `brown += white(x)`
- `a.k.a. Red Noise`
### Why It Works
in [[fourier transform|frequency domain]] integration scales amplitude of each frequency component by $\dfrac{1}{i2\pi f}$
total power for signal $x(t)=A\cos(2\pi ft)$ is $P=\lim_\limits{T\to\infty}\dfrac{1}{T}\int^T (A\cos(2\pi ft))^2 dt=\dfrac{A^2}{2}$
so $P\propto A^2$ meaning scaling frequency amplitudes by $1/f$ scales their power by $1/f^2$