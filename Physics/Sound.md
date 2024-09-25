## Formulas
- **Frequency** $f=\frac{1}{t}$
- **Period** $t=\frac{1}{f}$
- **Total Vibrations** $v=ft$
- **Cycle Length** $\lambda$
- **Wave Speed** $s=f\lambda$ [[#Speed of Sound]]
- **Power/Amplitude** $P=(\Delta p)^2$  
	- $\Delta p=\text{Pressure Variation}$ 
	- Measured in [[Decibel]][[s]]
- **Intensity** $I=\large\frac{P^2}{2\rho s}$
	- According to [[Kinetic Energy|Kinetic Energy Formula]] $\frac{1}{2} mv^2$
	- $\rho$ Air [[Density]]
### [[Music]]
- Each octave is double the frequency of previous
- Octave has 12 notes (called semitones)
- To shift frequency by $n$ semitones do $2^{n/12}$

> [!tip]
> In sound synthesis: $\cos(2\pi*440*t*(1-t/3))$
> Common mistake is to expect this to be 0hz after 3 seconds
> But pitch is not determined by what comes after $2\pi$
> Instead it is determined by the derivative of equation inside $\cos$
> So correct equation is: $\cos(2\pi*440*t*(1-t/6))$
> Full calculation: 
> - $f'(x)=1-t/3$ `Want this derivative for sound to go to 0hz in 3sec`
> - $f(x)=t-t^2/6$ `Deriv(t^2)=2t, so inverse is to mul by t and div by 2`
> - $f(x)=t(1-t/6)$
> - Finally $\cos(2\pi*440*t(1-t/6))$

> [!tip] #cool-sound-effects
> Cool sound effects: splice.com/sounds/packs/disciple-samples/virtual-riot-heavy-bass-design-vol-2/samples?page=7

### Sound Wave Types
- **Triangle** $$\frac{8}{\pi^{2}}\sum_{n=0}^\infty\frac{1}{(2n+1)^{2}}\cos(2\pi x\left(2n+1\right))$$
	- **Real** $4|frac(x)-0.5|-1$ `(x / tau - 0.25) for sin`
- **Sawtooth** $$\frac{2}{\pi}\sum_{n=1}^\infty(\frac{(-1)^{n}}{n}\sin(2\pi nx))$$
	- **Real** $2(x-floor(x+0.5))$
- **Square** $$\frac{4}{\pi}\sum_{n=0}^{100}(\frac{1}{2n+1}\sin(2\pi x(2n+1)))$$
	- **Real** $sign(\cos(2\pi x))$
	- **Smoothed**: $\frac{1}{\arctan(\frac{1}{d})}\arctan(\frac{\sin(2\pi x)}{d})$

### Speed of Sound
Speed of Sound in dry air at $20\ C\degree$: $343m/s$
#### Formula $c=\sqrt{\frac{K_s}{\rho}}$
- $K_s$ Coefficient of stiffness
- $\rho$ [[Density]]
