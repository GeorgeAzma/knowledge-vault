### Kepler Laws
1. planets move in elliptical orbits with sun at one focus
2. line connecting planet to sun sweeps out equal areas in equal times,
   meaning planet moves faster closer to the sun
3. planet's orbital period `365.25 for earth` squared is proportional to
   semi-major axis cubed `distance earth to sun`
### Orbital Manuevers
- **Gravity Assist** using planet's gravity for velocity increase or trajectory change
- **Elliptical Transfer** extend orbit ellipse until it touches target orbit
- **Hohmann Transfer** do elliptical transfer, after arriving at touching point
  extend the orbit to match target's orbit
- **Bi-impulsive Transfer** Hohmann transfer with 3 burns/thrusts
  more efficient when ratio of final and initial semi-major axis is $>11.94$
### Terms
- **Delta-V ($\Delta v)$** velocity delta required to do a manuever
- **Low Earth Orbit (LEO)** lowest earth orbit 
  with sustainable atmospheric drag `160-2000 km`
- **Geostationary Orbit (GEO)** circular orbit at equator where 
  orbital period matches earth's rotation period `35,785 km (42,164 km from center)`
- **Semi-major/minor axes** half of longest/shortest diameter of an ellipse
  semi-major is also average distance from central body
- [[Eccentricity]] orbit deviation from circle
  $0=\text{circle},\ \ 0<e<1=\text{ellipse},\ \ 1=\text{parabola},\ \  e>1=\text{hyperbola}$
- **Inclination (i)** tilt of orbit plane relative to equatorial plane
- **Apoapsis** orbit point farthest from central body $r_a$
- **Periapsis** orbit point closest to central body $r_p$
- **True Anomaly** angle between periapsis and current 
  orbiting object position, measured at central body
- **Ascending Node** orbit point crossing equatorial/ecliptic plane
  used for calculating longitude of the orbit
- **Equinox** 2 points in the year when sun is directly above the equator
  `vernal(spring)/automnal equinox`
- **Argument of Periapsis ($\omega$)** angle from ascending node to periapsis
- **Standard Gravitational Parameter ($\mu=GM$)** $\large\mu_{earth}=3.986\times10^{14}$
- **Prograde/Retrograde** same/opposite direction as orbit motion direction
  or celestial body rotation direction
- **Escape Velocity** $v\geq\sqrt{\large\frac{2\mu}{r}}$
	- $r$ orbital radius `distance to center of earth`
- **Lagrange Point** point where gravitation forces cancel out and rocket is still
### Formulas
- [[Gravity]]
- orbital period $T=\large2\pi\sqrt{\huge\frac{r^3}{GM}}$
	- $M$ earth mass
- geostationary orbital radius $r=\sqrt{\huge\frac{T^2}{4\pi^2}\normalsize GM}$
	- $T\approx\large23\frac{56}{60}$ hours for earth `86,160 seconds`
> [!note] subract earth radius to get GEO altitude
- distance from point on orbit to central body center $\large r=\huge\frac{p}{1+e\cos\theta}$
  - $p=\large\frac{h^2}{\mu}$ semi-latus rectum
  - $h$ specific [[Angular Momentum]]
  - $e$ [[Eccentricity]]
> [!note] this formula is distance from focus to conic section point
### Hohmann Transfer
- $\large\Delta v_1=\sqrt{\huge\frac{\mu}{r_1}}(\sqrt{\huge\frac{2r_2}{r_1+r_2}}-1)$ `elliptical orbit delta-v`
- $\large\Delta v_2=\sqrt{\huge\frac{\mu}{r_2}}(\sqrt{1-\huge\frac{2r_1}{r_1+r_2}})$ `target orbit delta-v`
- $\large t_H=\huge\pi\sqrt{\frac{(r_1+r_2)^3}{8\mu}}$ `transfer time`

wikipedia.org/wiki/Orbital_mechanics
