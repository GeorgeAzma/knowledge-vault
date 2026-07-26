### [[Probability Density Function|PDF]] $4\pi\dfrac{m}{2\pi k_BT}^{3/2}v^2e^{-\dfrac{mv^2}{2k_BT}}$
- $v$ velocity
- $m$ mass
- $k_B$ [[boltzmann constant]]
- $T$ [[temperature]] `shifts right & spreads distribution`
##### Velocities
- $v_p=\sqrt{\dfrac{2k_BT}{m}}$ `most probable velocity (for a particle)`
- $\braket{v}=\sqrt{\dfrac{8k_BT}{\pi m}}$ `average velocity` or $\bar{v}$
- $v_{rms}=\sqrt{\dfrac{3k_BT}{m}}$ `root mean square velocity`
##### What It Is
- have particles `circles/spheres` with initial velocities
      and with perfectly [[elastic collision]], so [[kinetic energy]] and [[momentum]] are conserved
- let initial velocities distribute to other particles over time `thermal equilibrium`
- at the end particle velocities will follow Maxwell-Boltzmann distribution
> [!tip] particles in [[ideal gas law|gases]] follow this distribution
### Pure Form $f(v)=\sqrt{\dfrac{2}{\pi}}\dfrac{v^2}{\sigma^3}\exp\left(-\dfrac{v^2}{2\sigma^2}\right),\quad v\geq0$
Maxwell distribution is distribution of $V=\sqrt{X_1^2+X_2^2+X_3^2}$ where $X_1,X_2,X_3$ are [[normal distribution|standard gaussians]] with $\mu=0,~~\sigma^2$
- $\sigma^2=\dfrac{k_BT}{m}$
##### Velocities
- $v_p=\sqrt{2}~\sigma$ `most probable velocity (for a particle)`
- $\braket{v}=\sqrt{\dfrac{8}{\pi}}~\sigma$ `average velocity` or $\bar{v}$
- $v_{rms}=\sqrt{3}~\sigma$ `root mean square velocity`
$v_p<\braket{v}<v_{rms}$
##### What It Is $V\sim\sigma\cdot\chi_3$
[[Chi-Square Distribution]] with  3 [[Math/Probability/Degrees of Freedom|Degrees of Freedom]] scaled by $\sigma$
meaning it's sum of 3 [[Normal Distribution|standard gaussian distributed]] random variables scaled by standard deviation
### Properties
- [[Support]] $[0,\infty)$
- **Parameters** $\sigma>0$ `or` $m,T$
- [[Skewness]] $\gamma_1=\dfrac{2\sqrt{2}(16-5\pi)}{(3\pi-8)^{3/2}}\approx0.48569$
- [[Kurtosis]] $\gamma_1=\dfrac{2\sqrt{2}(16-5\pi)}{(3\pi-8)^{3/2}}\approx0.48569$
- [[Entropy]] $\ln(\sigma\sqrt{2\pi})+\gamma-\dfrac{1}{2}$
##### [[Moment]] $\braket{v^n}=\sigma^n~2^{n/2}~\dfrac{\Gamma\left(1+\dfrac{n}{2}\right)}{\Gamma\left(\dfrac{3}{2}\right)}$
- [[Mean]] $\braket{v}=\sqrt{\dfrac{8}{\pi}}~\sigma$
- [[Variance]] $\text{Var}(v)=\sigma^2(3-\frac{8}{\pi})$
- [[Mode]] $\sqrt{2}~\sigma$
### [[Cumulative Distribution Function|CDF]] $\text{erf}\left(\dfrac{v}{\sqrt{2}\sigma}\right)-\sqrt{\dfrac{2}{\pi}}\dfrac{v}{\sigma}\exp\left(-\dfrac{x^2}{2\sigma^2}\right)$
### Derivation
1. assume velocity components $v_x,v_y,v_z$ are independent and [[normal distribution|gaussian]] `from central limit theorem applied to collisions`
2. assume distribution is isotropic `no preferred direction`
3. then speed $v=|\vec{v}|$ is magnitude of 3D gaussian vector
4. transform cartesian to spherical coordinates and integrate out the angles to get maxwell distribution