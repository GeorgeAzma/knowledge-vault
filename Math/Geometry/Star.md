### $(\cos\theta,\sin\theta)\dfrac{\sin\dfrac{\pi}{10}}{\sin\left(\left|\operatorname{mod}(\theta+\dfrac{\pi}{10},\dfrac{2\pi}{5})-\dfrac{\pi}{5}\right|+\dfrac{\pi}{10}\right)}$
``` c
# theta: [0; TAU]
sin(PI * 0.1) / sin(abs(mod(theta + PI * 0.1, PI * 0.4) - PI * 0.2) + PI * 0.1)

# x: [0; 1]
sin(PI * 0.1) / sin(PI * 0.1 * (abs(mod(20.0 * theta + 1.0, 4.0) - 2.0) + 1.0))
```
