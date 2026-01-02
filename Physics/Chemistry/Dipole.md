[[Partial Charge|partial charges]] between [[Bond|atomic bonds]] in a molecule create
### Dipole Moment $\mu=q\cdot d$
uses [[Debye]] unit $D$
- $q$ [[Partial Charge]]
- $d$ [[Bond]] length
##### Intuition
both partial charge and distance matter for stronger dipole
since if atoms are closer, partial charges kinda merge and cancel out

- Bigger [[Electronegativity|ΔEN]] → bigger partial charge → larger dipole
- bent geometry → less cancelling out → larger dipole

### Calculating Dipole moment `H2O`
``` python
# units
A = 1e-10m # angstrom
e = 1.602e-19C # elementary charge
D = 3.33564Cm # debye

# bond parameters
d = bond_length(O-H)  = 0.958A 
q = partial_charge(H) = 0.33e
θ = bond_angle(H-O-H) = 104.45

# O-H dipole moment
μ = q * d = (0.958*1e-10) * (0.33*1.602e-19) = 5.064e-30 / D = 1.518D
μ1 = μ2 = μ

# H2O molecular dipole moment
# basically sum of bond aligned vectors with length = partial charge
# but we only care about angles between bond vectors, not their initial orientation
# when you want to sum vectors with lengths and angles in between
# law of cosines formula is useful, though with 1 of the vectors negated
# which gives final formula: |μ1+μ2| = sqrt(μ1^2+μ2^2+2*μ1*μ2*cosθ)
μ_total = sqrt(μ1^2 + μ2^2 + 2*μ1*μ2*cos(θ)) = 
          sqrt(2 * 1.518^2 + 2 * 1.518^2 * cos(104.45 / 2)) =
          1.518 * sqrt(2 + 2 * cos(104.45 / 2)) =
          1.518 * sqrt(1.2419) = 1.518 * 1.114 = 1.691
          
```