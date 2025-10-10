calculate air pressure for [[Atmosphere|Troposphere]] `0-18km`
### $P=P_0(1-\frac{Lh}{T_0})^\frac{gM}{R^*L}$
- $P_0=101325\text\ {Pa}=1\ \text{atm}$ `sea level pressure`
- $L=0.0065\text{ K/m}$ `temperature lapse rate`
  `negative temperature change based on altitude, not constant`
- $h$ height `from sea level`
- $T_0$ temperature `sea level (kelvin)`
- $g=9.80665\text{ m/s}$
- $M=0.0289644\text{ kg/mol}$ `air molar mass`
- $R^*=8.31446\text{ J/mol/K}$ `universal gas constant`
### Precalculated For Air $P=101325(1-\frac{0.0065h}{T_0})^{5.25578}$
> [!example] density of `15C` air at `1400m` elevation
> $P=101325(1-\frac{0.0065\cdot 1400}{288.15})^{5.2557813}\approx85600\text{ Pa}$
> $R=\large\frac{R^*}{M}=\frac{8.31446}{0.0289644}\approx287$ [[Specific Gas Constant]]
> $\rho=\frac{P}{RT}=\frac{85600}{287\cdot288.15}\approx1.035\text{ kg/m}^3$ [[Ideal Gas Law]]