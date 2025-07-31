### Formula: $t(t(C-2B+A)+2(B-A))+A$
`t * (t * (c - 2.0 * b + a) + 2.0 * (b - a)) + a`
- **origin** $t(t(C-2B)+2B)$
- **derivative** $2t(C+A-2B)+2(B-A)$
### Highest Point $clamp(\frac{A.y-B.y}{A.y+C.y-2B.y},0,1)$
### To Cubic Approx $\frac{3\left(C_{1}+C_{2}\right)-D}{4}$
### Approx 2 quadratic splines with 1
- 2 connected quadratic beziers $((0,0),b,c);(c,d,e)$
- Find highest point $t$ value $H_1,H_2$ for each bezier
- Clamp it to 0-1 and calculate bezier point at $H_1,H_2$
- Choose absolute higher bezier point $H$
- Approximation quadratic bezier $((0,0),2H-0.5e,e)$
### Area $\int_0^1{\frac{|Bezier(t)\times End|}{||End||}dt}$
