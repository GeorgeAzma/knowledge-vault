### Formula $f(s)=\int_0^\infty f(t)e^{-st}dt$
- $s=\alpha+i\omega$ [[Complex Number]]
[[Fourier Transform|Fourier Transform]] which also shows exponential growth/decay of a function
### Properties
- $\mathcal{L}\{af(t)+bg(t)\}=a\,\mathcal{L}\{f(t)\}+b\,\mathcal{L}\{g(t)\}$ linear
- $sF(s)=\mathcal{L}\{f'(t)\}\iff s\mathcal{L}\{f(t)\}$
### Solutions
- $f(t)=1\xrightarrow{~~\mathcal{L}~~}\dfrac{1}{s}$ `because` $\int_0^\infty e^{-st}dt=\dfrac{1}{s}$
- $f(t)=e^{at}\xrightarrow{~~\mathcal{L}~~}\dfrac{1}{s-a}$ `because` $\int_0^\infty e^{at}e^{-st}dt=\dfrac{1}{s-a}$
- $f(t)=\cos(t)\xrightarrow{~~\mathcal{L}~~}\dfrac{s}{s^2+\omega^2}$ `because` $\cos(\omega t)=\dfrac{e^{i\omega t}+e^{-i\omega t}}{2}\implies\dfrac{1}{2}\int_0^\infty (e^{i\omega t}+e^{-i\omega t})e^{-st}dt=\dfrac{1}{2}(\int_0^\infty e^{i\omega t}e^{-st}dt+\int_0^\infty e^{-i\omega t}e^{-st}dt)=\dfrac{1}{2}(\dfrac{1}{s-i\omega}+\dfrac{1}{s+i\omega})=\dfrac{(s+i\omega)+(s-i\omega)}{2(s-i\omega)(s+i\omega)}=\dfrac{2s}{2(s(s+i\omega)-i\omega(s+i\omega))}=\dfrac{s}{s^2+si\omega-si\omega+\omega^2}=\dfrac{s}{s^2+\omega^2}$
- $f(t)=\sin(t)\xrightarrow{~~\mathcal{L}~~}\dfrac{\omega}{s^2+\omega^2}$
