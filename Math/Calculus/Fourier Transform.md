---
aliases:
  - FFT
---
Converts time domain to frequency domain
### Formula $\hat{f}(\omega)=\int_{-\infty}^\infty f(t)e^{-i\omega t}dt$
How much $\omega$ frequency is present in signal
### Inverse Formula $f(t)=\dfrac{1}{2\pi}\int_{-\infty}^\infty \hat{f}(\omega)e^{i\omega t}d\omega$
### Properties
| Property                        | Spatial Domain                     | Frequency Domain                                    |
| ------------------------------- | ---------------------------------- | --------------------------------------------------- |
| Linearity                       | $\alpha f_1(t)+\beta f_2(t)$       | $\alpha F_1(\omega)+\beta F_2(\omega)$              |
| Scaling                         | $f(at)$                            | $\dfrac{F(\dfrac{\omega}{a})}{\mid a\mid}$          |
| Shifting `time`                 | $f(t+t_0)$                         | $e^{i\omega t_0}F(\omega)$                          |
| Shifting `freq`                 | $f(t)e^{i\omega_0 t}$              | $F(\omega-\omega_0)$                                |
| [[Derivative\|Differentiation]] | $f^{(n)}(t)$                       | $(i\omega)^nF(\omega)$                              |
| [[Convolution]] `time`          | $f_1(t)*f_2(t)$                    | $F_1(\omega)\cdot F_2(\omega)$                      |
| [[Convolution]] `freq`          | $2\pi f_1(t)f_2(t)$                | $F_1(\omega)*F_2(\omega)$                           |
| Reversal                        | $f(-t)$                            | $F(-\omega)=F^*(\omega)$                            |
| [[Integral\|Integration]]       | $\int_{-\infty}^{t}f(\tau)\ d\tau$ | $\dfrac{F(\omega)}{i\omega}+\pi F(0)\delta(\omega)$ |
- [[Complex Number]] $e^{-i\omega t}$ acts as $(\sin(\omega t),\cos(\omega t))$ multiplication
- `fft(real[:N])[:N/2] = fft(real[:N])[N/2:] # mirrored`
- `len(rfft(real[:N]))= N/2+1 # +1 for DC component`
- 1D fft of projection of 2D image = 1D slice through 2D fft of that image `projection slice theorem`
      this is used to reconstruct images/slices from CT scans from different angles, more angles = better quality
### Tips

| Time                               | Frequency       |
| ---------------------------------- | --------------- |
| narrow                             | wide            |
| periodic                           | narrow          |
| amp increase                       | amp increase    |
| convolve                           | multiply        |
| $\text{box}$                       | $\text{sinc}$   |
| $\text{box}*\text{box}=\text{tri}$ | $\text{sinc}^2$ |
| $\text{box}^{*3}=\text{b-spline}$  | $\text{sinc}^3$ |
| $\text{box}^{*n}\approx e^{-nx^2}$ | $\text{sinc}^n$ |
##### Solving [[Differential Equations]] Faster via FFT
**Heat Equation** $\dfrac{\partial u}{\partial t}=\alpha\dfrac{\partial^2u}{\partial x^2}\implies\dfrac{\partial\hat{u}}{\partial t}=-\alpha k^2\hat{u}$
- $\alpha$ diffusivity constant
- $u(x,t)$ temperature in time domain
- $\hat{u}(k)$ temperature in discrete frequency domain
**Derivation**
$u(x)=\dfrac{1}{2\pi}\sum_k\hat{u}(k)e^{ikx}dk$ `from inverse DFT formula`
$\dfrac{\partial u(x,t)}{\partial t}=\alpha\dfrac{\partial^2u(x,t)}{\partial x^2}=\alpha u_t^{(2)}(x)\implies\dfrac{\partial\hat{u}(k,t)}{\partial t}=\alpha(ik)^2\hat{u}_t(k)=-\alpha k^2\hat{u}_t(k)$
now find $\hat{u}(k,t)$ from $\dfrac{\partial\hat{u}(k,t)}{\partial t}=-\alpha k^2\hat{u}_t(k)$
- $\dfrac{1}{\hat{u}(k)}\dfrac{\partial\hat{u}(k,t)}{\partial t}=-\alpha k^2$ `multiply both sides by 1/u`
- $\dfrac{1}{\hat{u}(k)}\partial\hat{u}(k,t)=-\alpha k^2\partial t$ `multiply both sides by dt`
- $\int\dfrac{1}{\hat{u}(k)}\partial\hat{u}(k,t)=\int-\alpha k^2\partial t$ `integrate both sides`
- $\ln\hat{u}(k,t)=-\alpha k^2t+C$ `simplify`
- $\hat{u}(k,t)=e^{-\alpha k^2t+C}$ `exp both sides`
- $\hat{u}(k,t)=e^{-\alpha k^2t}e^{C}$ `exp both sides`
- $\hat{u}(k,t)=e^{-\alpha k^2t}D$ `simplify constant D=exp(C) <-> C=ln(D)`
$\hat{u}(k,0)=e^{-\alpha k^2\cdot0}D=e^{0}\cdot D=D$
Meaning $D=\hat{u}(k,0)$
**Finally** $\hat{u}(k,t)=\hat{u}(k,0)e^{-ak^2t}$ 
so closed formula in $k$ frequency space, convert back to time domain to get the solution over $x$
##### Why [[Derivative|Differentiation]] is Simpler in Frequency Domain $f^{(n)}(t)\implies(i\omega)^nF(\omega)$
- $x(t)=\dfrac{1}{2\pi}\int_{-\infty}^\infty f(\omega)e^{i\omega t}d\omega$ `ifft formula`
- $\dfrac{\partial}{\partial t}(x(t))=\dfrac{\partial}{\partial t}(\dfrac{1}{2\pi}\int_{-\infty}^\infty f(\omega)e^{i\omega t}d\omega)$ `differentiate`
- $\dfrac{\partial}{\partial t}(x(t))=\dfrac{1}{2\pi}\int_{-\infty}^\infty f(\omega)\dfrac{\partial}{\partial t}(e^{i\omega t})d\omega$
- $\dfrac{\partial}{\partial t}(x(t))=\dfrac{1}{2\pi}\int_{-\infty}^\infty f(\omega)(iw\cdot e^{i\omega t})d\omega$
- $\dfrac{\partial}{\partial t}(x(t))=\dfrac{1}{2\pi}\int_{-\infty}^\infty (iw\cdot f(\omega))e^{i\omega t}d\omega$ 
- meaning 
##### Discrete 2D [[Laplacian]] in Frequency Domain $\nabla^2 f(x,y)$
$\dfrac{f(x+h,y)+f(x-h,y)+f(x,y+h)+f(x,y-h)-4f(x,y)}{h^2}$
- $f(x\pm h,y)=e^{\pm ik_xh}\hat{f}(k_x,k_y)$ `shifting`
- $\dfrac{e^{ik_xh}\hat{f}(k_x,k_y)+e^{-ik_xh}\hat{f}(k_x,k_y)+e^{ik_yh}\hat{f}(k_x,k_y)+e^{-ik_yh}\hat{f}(k_x,k_y)-4\hat{f}(k_x,k_y)}{h^2}$
- $\hat{f}(k_x,k_y)\dfrac{e^{ik_xh}+e^{-ik_xh}+e^{ik_yh}+e^{-ik_yh}-4}{h^2}$
- $\hat{f}(k_x,k_y)\dfrac{\cos(k_xh)+i\sin(k_xh)+\cos(-k_xh)+i\sin(-k_xh)+\cos(k_yh)+i\sin(k_yh)+\cos(-k_yh)+i\sin(-k_yh)-4}{h^2}$
- $\hat{f}(k_x,k_y)\dfrac{\cos(k_xh)+i\sin(k_xh)+\cos(k_xh)-i\sin(k_xh)+\cos(k_yh)+i\sin(k_yh)+\cos(k_yh)-i\sin(k_yh)-4}{h^2}$
- $2\hat{f}(k_x,k_y)\dfrac{\cos(k_xh)+\cos(k_yh)-2}{h^2}$
##### Discrete 2D [[Divergence]] in Frequency Domain $\nabla\cdot\mathbf{F}(x,y)$
$\dfrac{F_x(x+h,y)-F_x(x-h,y)+F_y(x,y+h)-F_y(x,y-h)}{2h}$
- $\mathbf{F}(x\pm h,y)=e^{\pm ik_xh}\hat{\mathbf{F}}(k_x,k_y)$ `shifting`
- $\dfrac{e^{ik_xh}\hat{F}_x(k_x,k_y)-e^{-ik_xh}\hat{F}_x(k_x,k_y)+e^{ik_yh}\hat{F}_y(k_x,k_y)-e^{-ik_yh}\hat{F}_y(k_x,k_y)}{2h}$
- $\dfrac{\hat{F_x}(k_x,k_y)(\cos(k_xh)+i\sin(k_xh)-\cos(-k_xh)-i\sin(-k_xh))+\hat{F_y}(k_x,k_y)(\cos(k_yh)+i\sin(k_yh)-\cos(-k_yh)-i\sin(-k_yh))}{2h}$
- $\dfrac{\hat{F_x}(k_x,k_y)(\cos(k_xh)+i\sin(k_xh)-\cos(k_xh)+i\sin(k_xh))+\hat{F_y}(k_x,k_y)(\cos(k_yh)+i\sin(k_yh)-\cos(k_yh)+i\sin(k_yh))}{2h}$
- $i\dfrac{\hat{F_x}(k_x,k_y)\sin(k_xh)+\hat{F_y}(k_x,k_y)\sin(k_yh)}{h}$

### Variants
- [[Short Time Fourier Transform (STFT)]]