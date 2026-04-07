Transforms control points to curves https://youtu.be/jvPPXbo87ds
# Uniform Cubic Splines

|        Spline        |  $C$  |  $G$  | Degree |
| :------------------: | :---: | :---: | :----: |
|        Linear        | $C_0$ | $G_0$ |   1    |
| [[Quadratic Bezier]] | $C_1$ | $G_1$ |   2    |
|   [[Cubic Bezier]]   | $C_2$ | $G_2$ |   3    |
|       Hermite        | $C_1$ | $G_1$ |   3    |
|       Cardinal       | $C_1$ | $G_1$ |   3    |
|     Catmull-Rom      | $C_1$ | $G_1$ |        |
|    Cubic B-Spline    | $C_2$ | $G_2$ |   3    |
- $C_n$ continuous $n$-th derivative
- $C_0$ connected points
- $C_1$ no corners, uniform speed
- $C_2$ smooth curve/bend, uniform acceleration
- $G_0$ same as $C_0$ `connected points`
- $G_1$ smooth curve `no corner`
- $G_2$ smooth curve, smooth reflections
- $C_n\implies G_n$
### [[Matrix]] $\mathbf{p}(t)=\begin{bmatrix}1&t&t^2&t^3\end{bmatrix}M\begin{bmatrix}P_0\\P_1\\P_2\\P_3\end{bmatrix}$

### [[Quadratic Bezier]] $M_{\text{Quadratic Bezier}}=\begin{bmatrix}1&0&0\\-2&2&0\\1&-2&1\end{bmatrix}$
### [[Cubic Bezier]] $M_{\text{Bezier}}=\begin{bmatrix}1&0&0&0\\-3&3&0&0\\3&-6&3&0\\-1&3&-3&1\end{bmatrix}$
### Cardinal Spline $M_{\text{Cardinal}}=\begin{bmatrix}0&1&0&0\\-\tau&0&\tau&0\\2\tau&\tau-3&3-2\tau&-\tau\\-\tau&2-\tau&\tau-2&\tau\end{bmatrix}$
Each point has `P2.vel = P3.pos - P1.pos`
- $\tau$ tension, use `0.5` for smoothest curve, called **Catmull-Rom**
##### Catmull-Rom $M_{\text{Catmull–Rom}}=\frac12\begin{bmatrix}0&2&0&0\\-1&0&1&0\\2&-5&4&-1\\-1&3&-3&1\end{bmatrix}$
### Hermite $M_{\text{Hermite}}=\begin{bmatrix}1&0&0&0\\0&0&1&0\\-3&3&-2&-1\\2&-2&1&1\end{bmatrix}$
Specify velocity for each point
### B-Spline $M_{\text{B-Spline}}=\frac16\begin{bmatrix}1&4&1&0\\-3&0&3&0\\3&-6&3&0\\-1&3&-3&1\end{bmatrix}$
