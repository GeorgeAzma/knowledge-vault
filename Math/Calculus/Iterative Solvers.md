---
aliases:
  - Jacobi Iteration
  - Gauss-Seidel
  - Red-Black Gauss-Seidel
  - Successive Over-Relaxation
---
#### Linear System $\begin{array}{c}4x+y=9\\ x+3y=8\end{array}\implies x=\dfrac{9-y}{4},~~y=\dfrac{8-x}{3}$
- **Initial Guess** $x_0=0,~y_0=0$
- **Analytic Solution** $x^*=\dfrac{19}{11}=1.(72),~~y^*=\dfrac{23}{11}=2.(09)$
### Jacobi $G_j=-D^{-1}(L+U)$
- $x_n=\dfrac{9-y_{n-1}}{4}$
- $y_n=\dfrac{8-x_{n-1}}{3}$
- **iteration** `0` error `0.777`
    - $x'=\dfrac{9-0}{4}=2.25$
    - $y'=\dfrac{8-0}{3}=2.67$
- **iteration** `1` error `0.226`
    - $x'=\dfrac{9-2.67}{4}=1.58$
    - $y'=\dfrac{8-2.25}{3}=1.92$
- **iteration** `2` error `0.064`
    - $x'=\dfrac{9-1.92}{4}=1.77$
    - $y'=\dfrac{8-1.58}{3}=2.13$
- **iteration** `3` error `0.018`
    - $x'=\dfrac{9-2.13}{4}=1.71$
    - $y'=\dfrac{8-1.77}{3}=2.07$
error decay $e\approx\exp(-1.24x-0.25)$
$e_{n+1}\approx0.28e_n$    
### Gauss-Seidel $G_{GS}=-(D+L)^{-1}U$
- $x_n=\dfrac{9-y_{n-1}}{4}$
- $y_n=\dfrac{8-x_{n}}{3}$ `uses updated x-value`
- **iteration** `0` error `0.551`
    - $x'=\dfrac{9-0}{4}=2.25$
    - $y'=\dfrac{8-2.25}{3}=1.91$
- **iteration** `1` error `0.045`
    - $x'=\dfrac{9-1.91}{4}=1.77$
    - $y'=\dfrac{8-1.77}{3}=2.07$
- **iteration** `2` error `0.003`
    - $x'=\dfrac{9-2.07}{4}=1.73$
    - $y'=\dfrac{8-1.73}{3}=2.08$
- **iteration** `3` error `0.0003`
    - $x'=\dfrac{9-1.73}{4}=1.72$
    - $y'=\dfrac{8-1.72}{3}=2.09$
error decay $e\approx\exp(-2.484x-0.596)$
$e_{n+1}\approx0.08e_n\approx0.28^2e_n$ which means `1` iteration of gauss-seidel = `2` iterations of jacobi
### Red-Black Gauss-Seidel `RBGS`
Gauss-Saidel for 2D grid
- split grid into checkerboard
- update red squares
- update black squares with red squares
### Successive Over-Relaxation `SOR`
Gauss-Saidel that overshoots `old = lerp(old, new, 1.7)`
