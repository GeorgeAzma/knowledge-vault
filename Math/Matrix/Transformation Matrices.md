### Orthographic
##### Intuition
- $x$/$y$/$z$ **col** scales box width/height/depth to `0-2` range
- $w$ **col** since space is still offset by $r/b/n$, this has to remove that offset
  by shifting back by that offset and by `-1` to get `[-1; 1]` range
$$
P = 
\begin{bmatrix}
\frac{2}{r - l} & 0 & 0 & -\frac{r + l}{r - l} \\
0 & \frac{2}{t - b} & 0 & -\frac{t + b}{t - b} \\
0 & 0 & \frac{-2}{f - n} & -\frac{f + n}{f - n} \\
0 & 0 & 0 & 1
\end{bmatrix}\quad
\begin{array}{l}
l, r & \text{(left, right clipping planes)} \\
b, t & \text{(bottom, top clipping planes)} \\
n, f & \text{(near, far clipping planes)}
\end{array}
$$
### Perspective
##### Intuition
- $x$/$y$ **col** higher fov makes `x` coords lower `x /= r`
  which makes sense because higher fov means
  we have to fit more stuff on screen so need to divide `x` more
- $-1$ makes $w$ more negative as $z$ increases, during perspective division 
  this makes further values more squished
- $\large\frac{f+n}{n-f}$ not $\frac{2}{n-f}$ because $z$ will be divided by itself during pespective division
- $\large\frac{2fn}{n-f}$ shift to get `[-1; 1]` range
$$
\begin{bmatrix}
{\large\frac1{r}} & 0 & 0 & 0 \\
0 & {\large\frac1{t}} & 0 & 0 \\
0 & 0 & {\large\frac{f+n}{n-f}} & {\large\frac{2fn}{n-f}} \\
0 & 0 & -1 & 0 \\
\end{bmatrix}\quad
\begin{array}{l}
r=\tan(\frac{\text{FOV}_x}2) & \text{(derived from vertical FOV)}\\
t=\tan(\frac{\text{FOV}_y}2) & \text{(typical FOV)}\\
n, f & \text{(near, far clipping planes)}
\end{array}
$$

##### Remarks
- $\text{FOV}_x=2\arctan(\tan(0.5\text{FOV}_y)\cdot\text{aspect}), \text{aspect}=\frac wh$
- horizontal $\text{FOV}$ is vertical $\text{FOV}$ but accounting for aspect ratio
- $\tan(\text{FOV}_y)=\large\frac{\text{near plane height}}{\text{near plane distance}}$
