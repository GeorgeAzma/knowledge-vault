##### Parameters
``` python
P_t = 1000 # transmit power [W]
G_t = 30 # transmit gain [dBi] (db isotropic) (G = G_t = G_r; usually)
f = 3e9 # transmit signal frequency [Hz] (3Ghz)
R = 1e3 # target range
rcs = 1 # radar cross section of target [m^2] (sigma)
```
##### Calculated Parameters
- $\lambda=\dfrac{c}{f}$
``` python
G_t_lin = 10 ** (G_t / 10) # linear transmit gain (2 = x2 stronger than isotropic at strongest direction)
wavelength = c / f # lambda
```

### Power Received $P_r={\color{LimeGreen}\dfrac{P_tG_t}{4\pi R^2}}\cdot{\color{CornflowerBlue}\dfrac{\sigma}{4\pi R^2}}\cdot {\color{Goldenrod}A_e}$
- $=\dfrac{P_tG^2\lambda^2\sigma}{64\pi^3 R^4}$ `minimal form`

1. ${\color{LimeGreen}\dfrac{P_tG_t}{4\pi R^2}}$ power at target
``` python
power_at_target = (P_t * G_t_lin) / (4 * pi * R**2)
power_at_target_db = 10 * log10(power_at_target)
print(f"power per area, at distance R = {R}m: {power_at_target:.3f} W/m^2")
```
2. ${\color{CornflowerBlue}\dfrac{\sigma}{4\pi R^2}}$ path from target
``` python
reflection_scalar = rcs / (4 * pi * R**2)
reflection_scalar_db = 10 * log10(reflection_scalar)
print(f"power scaling factor on path from target to antenna with R = {R} m: {reflection_scalar_db:.1f} dB")
```

3. ${\color{Goldenrod}A_e}=\dfrac{G\lambda^2}{4\pi}$ effective aperture
``` python
effective_aperture = G * wavelength**2 / (4 * pi) # A_e
print(f"effective aperture of the antenna with G = {G_t} dBi and f = {f / 1e9} GHz: {effective_aperture:.2f})
```
- **Combine** $P_r={\color{LimeGreen}\dfrac{P_tG_t}{4\pi R^2}}\cdot{\color{CornflowerBlue}\dfrac{\sigma}{4\pi R^2}}\cdot {\color{Goldenrod}\dfrac{G\lambda^2}{4\pi}}$
``` python
P_r = power_at_target * reflection_scalar * effective_aperture
P_r_db = 10 * log10(P_r)
print(f"power received: {P_r_db:.1f} dBW")
```

##### Rearrangements
- $R=\left(\dfrac{P_tG_t\sigma A_e}{16\pi^2P_r}\right)^{1/4}$ `find target range`
- $P_t=\dfrac{P_r16\pi^2R^4}{G_t\sigma A_e}$ `find transmitted power`
### Example
**Given**
- `100 m` far target `R`
- `-60 dBW` desired recieve power `P_r`
- `3 m^2` radar cross section of target `rcs`

**Radar Specs**
- `10 GHz (X-band)` transmit signal `f`
- `5 kW` transmit power `P_t`
- `25 dB` antenna gain `G`

**How much power should we transmit?**
- use rearrangement $P_t=\dfrac{P_r16\pi^2R^4}{G_t\sigma A_e}$
``` python
rcs = 3 # radar cross section of target
R = 100 # target range [m]
P_r = -60 # desired receive power [dBW]
P_r_lin = 10 ** (P_r / 10)
f = 10e9
wavelength = c / f
G_t = 25 # [dBi]
G_t_lin = 10 ** (G_t / 10)
A_e = G_t_lin * wavelength**2 / (4 * pi)# effective aperture

P_t = P_r_lin * 16 * pi**2 * R**4 / (G_t_lin * rcs * A_e)
P_t_db = 10 * log10(P_t)

print(f"to achieve received power of {P_r:.2f} dBW, transmit {P_t_db:.2f} dBW")
```
### Signal To Noise Ratio $\text{snr}={\color{CornflowerBlue}\dfrac{P_tG^2\lambda^2\sigma}{(4\pi)^3R^4}}\cdot\dfrac{1}{\color{VioletRed}k_BT_sB_nL}$
- $k_B$ [[Boltzmann Constant]]
``` python
P_t = 1.4e6 # [W] (1.4 MW)
G_t_db = 33 # [dBi]
G_t = 10 ** (G_t_db / 10)

f = 2.8e9 # [Hz] (2.8 GHz)
wavelength = c / f

R = 60
rcs = 1 # m^2

k_B = 1.380649 * 10**(-23) # J / K
T = 950 # [K]
bw = 1.67e6 # [Hz] (1.67 MHz)
L_db = 8 # [dB]
L = 10 ** (L_db / 10)

N_pulses = 21

```
1. ${\color{CornflowerBlue}\dfrac{P_tG^2\lambda^2\sigma}{(4\pi)^3R^4}}$ signal power
``` python
signal_power = P_t * G_t**2 * wavelength**2 * rcs / ((4 * pi)**3 * R**4)
```
2. $\dfrac{1}{\color{VioletRed}k_BT_sB_nL}$ noise power
``` python
noise_power = k_B * T * bw * L
```
- **Combine** $\text{snr}={\color{CornflowerBlue}\dfrac{P_tG^2\lambda^2\sigma}{(4\pi)^3R^4}}\cdot\dfrac{1}{\color{VioletRed}k_BT_sB_nL}$
``` python
snr = signal_power / noise_power
snr_db = 10 * log10(snr)
print(f"SNR for a single pulse: {snr_db:.2f} dB")

snr_integrated_db = snr_db + 10 * log10(N_pulses)
print(f"SNR after integrating {N_pulses} pulses: {snr_integrated_db:.2f} dB")
```
#### Range Resolution $\Delta R=\dfrac{c\tau}{2}\approx\dfrac{c}{2B}$
minimum differentiable range
- $\tau$ pulse width
- $t_{\Delta R}=\dfrac{2\Delta R}{c}$ time it takes to get from target to closest differentiable target and back
- $\tau<t_{\Delta R}$ pulse width should be short enough to avoid overlap
##### Angular Resolution
``` python
f = 10e9 # emitted light frequency [Hz] (10 GHz)
wavelength = c / f # [m]
k = 2 * pi / wavelength # wave number

# assuming 1D uniformly spaced phased array (ULA - uniform linear array)
d_x = wavelength / 2 # element spacing [m]
N = 4 # number phased array elements 

def compute_af(weights, u_0):
    n = np.arange(weights.size)
    AF = np.sum(
        weights[:, None] * np.exp(1j * n[:, None] * d_x * k_0 * (u - u_0)), axis=0
    )
    AF /= AF.max()
    return AF

AF = compute_af(
    signal.windows.kaiser(N, beta=2),
    np.sin(0),
)
plt.polar(theta, 20 * np.log10(np.abs(AF)))
plt.ylim(-100, 2)
plt.xlim(-pi / 2, pi / 2)
plt.title("Array Factor (AF)", fontsize=16, y=1.1)

# First side-lobe level for a rectangular (boxcar) window
plt.axhline(-3, c="b", linestyle="--")

plt.show()
```
#### Other Definitions
- https://youtu.be/MmpPfQ8WoWk
- **X-Band Signal** `8-12 GHz` usually `10 GHz`
``` python
def lin2db(x):
    return 10 * np.log10(x)

def db2lin(x):
    return 10 ** (x / 10)
```