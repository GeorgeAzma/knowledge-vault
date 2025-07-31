> [!tip] $\cos(2\pi*440*t*(1-t/3))$
> common mistake is to expect this to be `0 hz` after 3 seconds
> but pitch is not determined by what comes after $2\pi$
> instead it is determined by the derivative of equation inside $\cos$
> so correct equation is: $\cos(2\pi*440*t*(1-t/6))$
> full calculation 
> - $f'(x)=1-t/3$ `Want this derivative for sound to go to 0hz in 3sec`
> - $f(x)=t-t^2/6$ `Deriv(t^2)=2t, so inverse is to mul by t and div by 2`
> - $f(x)=t(1-t/6)$
> - finally $\cos(2\pi*440*t(1-t/6))$
