---
aliases:
  - Radiant Energy
  - Radiant Flux
  - Radiant Intensity
  - Radiance
  - Iraddiance
  - Radiant Exitance
  - Radiant Exposure
  - Radiant Energy Density
  - Spectral Radiant Flux
  - Spectral Radiant Intensity
  - Spectral Irradiance
  - Spectral Radiance
  - Luminous Energy
  - Luminous Flux
  - Luminous Intensity
  - Luminance
  - Illuminance
  - Luminous Exitance
  - Luminous Exposure
  - Luminous Energy Density
  - Luminous Efficacy
---
### Energetic
uses $I_e$ suffix `energetic`

| Energetic Unit             | Symbol             | Unit                          | Formula                                          |
| -------------------------- | ------------------ | ----------------------------- | ------------------------------------------------ |
| Radiant Energy             | $Q_e$              | $\text{J}$                    | $Q_e=\int\Phi_e(t)~dt$                           |
| Radiant Flux               | $\Phi_e$           | $\text{W}$                    | $\Phi_e=\dfrac{dQ_e}{dt}$                        |
| Radiant Intensity          | $I_e$              | $\text{W/sr}$                 | $I_{e,\Omega}=\dfrac{d\Phi_e}{d\Omega}$          |
| Radiance                   | $L_e$              | $\text{W/(m}^2\text{sr)}$     | $L_e=\dfrac{d^2\Phi_e}{dA,d\Omega\cos\theta}$    |
| Irradiance                 | $E_e$              | $\text{W/m}^2$                | $E_e=\dfrac{d\Phi_e}{dA}$                        |
| Radiant Exitance           | $M_e$              | $\text{W/m}^2$                | $M_e=\dfrac{d\Phi_{e,\text{out}}}{dA}$           |
| Radiant Exposure           | $H_e$              | $\text{J/m}^2$                | $H_e=\int E_e(t)~dt$                             |
| Radiant Energy Density     | $\omega_e$         | $\text{J/m}^3$                | $\omega_e=\dfrac{dQ_e}{dV}$                      |
| Spectral Radiant Flux      | $\Phi_{e,\lambda}$ | $\text{W/nm}$ or $\text{W/m}$ | $\Phi_e =\int\Phi_{e,\lambda}(\lambda)~d\lambda$ |
| Spectral Radiant Intensity | $I_{e,\lambda}$    | $\text{W/(sr·nm)}$            | $I_e=\int I_{e,\lambda}(\lambda)~d\lambda$       |
| Spectral Irradiance        | $E_{e,\lambda}$    | $\text{W/(m}^2\text{·nm)}$    | $E_e=\int E_{e,\lambda}(\lambda)~d\lambda$       |
| Spectral Radiance          | $L_{e,\lambda}$    | $\text{W/(m}^2\text{sr·nm)}$  | $L_e=\int L_{e,\lambda}(\lambda)~d\lambda$       |

### Visual
Takes into account [[Luminous Efficiency]], uses $I_v$ suffix

| Visual Unit                   | Symbol     | Unit                         | Formula                                       |
| ----------------------------- | ---------- | ---------------------------- | --------------------------------------------- |
| Luminous Energy               | $Q_v$      | $\text{lm}\cdot\text{s}$     | $Q_v=\int\Phi_v(t)~dt$                        |
| Luminous Flux                 | $\Phi_v$   | $\text{lm}$                  | $\Phi_v=\dfrac{dQ_v}{dt}$                     |
| Luminous Intensity            | $I_v$      | $\text{cd}$                  | $I_v=\dfrac{d\Phi_v}{d\Omega}$                |
| Luminance                     | $L_v$      | $\text{cd/m}^2$              | $L_v=\dfrac{d^2\Phi_v}{dA,d\Omega\cos\theta}$ |
| Illuminance                   | $E_v$      | $\text{lx}$                  | $E_v=\dfrac{d\Phi_v}{dA}$                     |
| Luminous Exitance             | $M_v$      | $\text{lx}$                  | $M_v=\dfrac{d\Phi_v}{dA}$ `emitted flux`      |
| Luminous Exposure             | $H_v$      | $\text{lx}\cdot\text{s}$     | $H_v=\int E_v(t)~dt$                          |
| Luminous Energy Density       | $\omega_v$ | $\text{lm}\cdot\text{s/m}^3$ | $\omega_v=\dfrac{dQ_v}{dV}$                   |
| Luminous Efficacy `radiation` | $K$        | $\text{lm/W}$                | $K=\dfrac{\Phi_v}{\Phi_e}$                    |
| Luminous Efficacy `source`    | $\eta$     | $\text{lm/W}$                | $\eta=\dfrac{\Phi_v}{P_{\text{in}}}$          |
| [[Luminous Efficiency]]       | $V$        | $1$ `normalized efficacy`    | $V=\dfrac{K}{K_{\max}}$                       |

![[Light Units.webp#rounded]]
