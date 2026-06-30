### Equations
- $\vec\nabla\cdot\vec{E}=\huge\frac{\rho}{\epsilon_0}$ `divergence of E, how much it flows in/out from the point`
- $\vec\nabla\cdot\vec{B}=0$
- $\vec\nabla\times\vec{E}=-\dfrac{\partial\vec{B}}{\partial t}$ `curl of E, how much it rotates around the point`
- $\vec\nabla\times\vec{B}=\mu_0(\vec{J}+\epsilon_0\dfrac{\partial\vec{E}}{\partial t})$
### Definitions
- $\vec\nabla=\huge(\frac{\partial}{\partial x}, \frac{\partial}{\partial y}, \frac{\partial}{\partial z})$ `partial derivative for each spatial axis`
- $\vec{E}$ Electric field
- $\vec{B}$ Magnetic field
- $\rho$ [[Charge]] density
- $\vec{J}$ [[Current]]
- $\mu_0$ [[Vacuum Permeability]]
- $\epsilon_0$ [[Vacuum Permittivity]]
### What equations mean
- Electrically charged particles generate an electric field that flows in/out of the particle
- Particles don't have magnetic charge by itself
- Changing magnetic field creates a rotating electric field and vice versa
- Electric currents at changing electric field generate a magnetic field
### [[Geometric Algebra]] Formula $\nabla F=\dfrac{J}{c\epsilon_0}$
- $\nabla F=\nabla\cdot F+\nabla\land F$ [[Geometric Product]]
- $\nabla=\dfrac{1}{c}\partial t+\vec{\nabla}=\dfrac{1}{c}\dfrac{\partial}{\partial t}+\dfrac{\partial}{\partial x}\hat{x}+\dfrac{\partial}{\partial y}\hat{y}+\dfrac{\partial}{\partial z}\hat{z}$
- $J=c\rho-\vec{J}$
- $F=\vec{E}+Ic\vec{B}$ `
- $I=e_xe_ye_z$ unit [[bivector|trivector]]
- $I\vec{B}$ equivalent to [[Hodge Star Operator]] `converts vector to orthogonal bivector`
- $c$ [[Light#Speed of Light $c=f lambda=299,792,458m/s$|Speed of Light]]
##### Expanding
$$
\large
\begin{array}{}
\nabla F=\dfrac{J}{c\epsilon_0}\\
\left(\dfrac{1}{c}\dfrac{\partial}{\partial t}+\vec\nabla\right)\left(\vec{E}+ic\vec{B}\right)=\dfrac{c\rho-\vec{J}}{c\epsilon_0}\\
\dfrac{1}{c}\dfrac{\partial\vec{E}}{\partial t}+\vec\nabla\vec{E}+i\dfrac{\partial\vec{B}}{\partial t}+ic\vec\nabla\vec{B}=\dfrac{c\rho-\vec{J}}{c\epsilon_0}\\
\dfrac{1}{c}\dfrac{\partial\vec{E}}{\partial t}+\vec\nabla\vec{E}+\vec\nabla\wedge\vec{E}+i\dfrac{\partial\vec{B}}{\partial t}+ic\vec\nabla\cdot\vec{B}+ic\vec\nabla\wedge\vec{B}=\dfrac{c\rho-\vec{J}}{c\epsilon_0}
\end{array}
$$
##### Resource youtu.be/hJD8ywGrXks
