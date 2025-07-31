If there is a random chance for a particle to decay each second
Bunch of those particle will decrease in count exponentially
### Formula $e^{-\lambda t}$
- $\lambda$ decay factor, `0.03 / dt, 3% chance of decay each second`
``` python
update():
	if random < 0.03:
		particle = false
```

Useful for calculating half-life, which is how long it takes
for half of the particles to decay, all elements eventually
decay so they all have a half-life based on decay speed
### Temperature Decay $A-(A-B)(\frac{C}{A-B})^{\frac{60}{m}}$
- $A$ initial temperature `85`
- $B$ ambient temperature `22`
- $C$ cooled temperature in one hour `20C`
- $m$ cooling minutes `60`
