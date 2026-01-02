
``` python
# A, B = bonded atoms
# c = small correction
distance(A-B) == covalent_radius(A) + covalent_radius(B) - c
distance(A=B) == 0.9(covalent_radius(A) + covalent_radius(B)) - c
distance(A≡B) == 0.85(covalent_radius(A) + covalent_radius(B)) - c

# also more s-orbitals atom has, stronger it's pull, meaning shorted bond distance
# because s-orbitals are closest to atom center
```

| Bond |  Å   |
| :--: | :--: |
| H-H  | 0.74 |
| H-C  | 1.09 |
| H-N  | 1.01 |
| H-O  | 0.96 |
| H-F  | 0.92 |
| C-C  | 1.54 |
| C-N  | 1.47 |
| C-O  | 1.43 |
| C-F  | 1.39 |
| C-Cl | 1.77 |
| C-Br | 1.94 |
| C-I  | 2.14 |
| N-N  | 1.45 |
| O-O  | 1.48 |
| S-S  | 2.05 |
| C=C  | 1.34 |
| C=O  | 1.23 |
| C=N  | 1.30 |
| N=O  | 1.21 |
| S=O  | 1.43 |
| P=O  | 1.50 |
| C≡C  | 1.20 |
| C≡N  | 1.16 |
| N≡N  | 1.10 |
