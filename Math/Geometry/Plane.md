similar to [[Line]] but for 3D
### $Ax+By+Cz+D=0$
- $\vec{n}=(A,B,C)$ `normal`
### Distance Formulas
- $d=\dfrac{|Ax_0+By_0+Cz_0+D|}{\sqrt{A^2+B^2+C^2}}$ `point-plane distance`
     plug in the point in plane equation to get distance from laying on $P(\dots)=0$ plane, and divide by plane normal to get unit distance
- $A(x_0+at)+B(y_0+bt)+C(z_0+ct)+D=0$ solve for $t$ then plug $t$ back `line-plane intersection`

### Angle Formulas
- $\cos\theta=\dfrac{d_1\cdot d_2}{|d_1||d_2|}$ `line-line` dot product between line directions normalized
- $\cos\theta=\dfrac{n_1\cdot n_2}{|n_1||n_2|}$`plane-plane` dot product between plane normals normalized
- $\cos\theta=\dfrac{n\cdot d}{|n||d|}$`line-plane` dot product between plane normal and line direction normalized

- $\vec{s}=\vec{n_1}\times\vec{n_2}$ `intersecting line direction of two intersecting planes`
