[[Fourier Transform]] gives a complex number for each frequency $z=a+bi$,
in polar coordinates, phase equals $\theta=\text{atan}_2(b,a)$ and magnitude is $r=\sqrt{a^2+b^2}$
if you calculate this magnitude for each frequency, you get distribution called **Power Spectral Density** `PSD`
it is somewhat similar to [[probability density function]]
### $S_x(f)$
For signal $x(t)$ [[fourier transform]] is $X(f)$ and power spectral density is $S_x(f)$
total power $P=\int S_x(f) df$, for signal with $0$ mean this is also $\text{Var}(x)$
- $S_x(f)=C$ white noise, every Hz gets same power $1\text{ Hz}\to1C,~~10\text{ Hz}\to10C$
    - which means high frequency amplitudes are lower