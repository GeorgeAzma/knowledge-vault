### Equations
- $\vec\nabla\cdot\vec{E}=\huge\frac{\rho}{\epsilon_0}$
- $\vec\nabla\cdot\vec{B}=0$
- $\vec\nabla\times\vec{E}=-\huge\frac{\delta\vec{B}}{\delta t}$
- $\vec\nabla\times\vec{B}=\mu_0(\vec{J}+\epsilon_0\large\frac{\delta\vec{E}}{\delta t})$

> [!note]
> $\vec\nabla\cdot\vec{E}$ is divergence of $\vec{E}$
> how much it flows in/out of the point
> 
> $\vec\nabla\times\vec{E}$ is curl of $\vec{E}$
> how much it rotates around the point
### Definitions
- $\vec\nabla=\huge(\frac{\delta}{\delta x}, \frac{\delta}{\delta y}, \frac{\delta}{\delta z})$
- $\vec{E}$ Electric field
- $\vec{B}$ Magnetic field
- $\rho$ [[Charge]] density
- $J$ [[Current]]
- $\mu_0$ [[Vacuum Permeability]]
- $\epsilon_0$ [[Vacuum Permittivity]]
### What equations mean
- Electrically charged particles generate an electric field that flows in/out of the particle
- Particles don't have magnetic charge by itself
- Changing magnetic field creates a rotating electric field and vice versa
- Electric currents at changing electric field generate a magnetic field
### [[Geometric Algebra]] Formula $\nabla F=\frac{J}{c\epsilon_0}$
- $\nabla=\frac{1}{c}\frac{\delta}{\delta t}+\frac{\delta}{\delta x}\hat{x}+\frac{\delta}{\delta y}\hat{y}+\frac{\delta}{\delta z}\hat{z}$
- $J=c\rho-\vec{J}$
- $F=\vec{E}+ic\vec{B}$ `i is unit trivector`
- $c$ [[Light#Speed of Light $c=f lambda=299,792,458m/s$|Speed of Light]]
###### Expanding 
$$
\large
\begin{array}{}
\nabla F=\frac{J}{c\epsilon_0}\\
(\frac{1}{c}\frac{\delta}{\delta t}+\vec\nabla)(\vec{E}+ic\vec{B})=\frac{c\rho-\vec{J}}{c\epsilon_0}\\
\frac{1}{c}\frac{\delta\vec{E}}{\delta t}+\vec\nabla\vec{E}+i\frac{\delta\vec{B}}{\delta t}+ic\nabla\vec{B}=\frac{c\rho-\vec{J}}{c\epsilon_0}\\
\frac{1}{c}\frac{\delta\vec{E}}{\delta t}+\vec\nabla\vec{E}+\vec\nabla\wedge\vec{E}+i\frac{\delta\vec{B}}{\delta t}+ic\vec\nabla\cdot\vec{B}+ic\vec\nabla\wedge\vec{B}=\frac{c\rho-\vec{J}}{c\epsilon_0}
\end{array}
$$
##### Resource youtu.be/hJD8ywGrXks
