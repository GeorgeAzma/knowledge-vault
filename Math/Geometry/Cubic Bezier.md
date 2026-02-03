### Formula $t(t(t(D-A+3(B-C))+3(A-2B+C))+3(B-A))+A$
- `At origin` $t(t(t(D+3(B-C))+3(C-2B))+3B)$
- `Derivative` $3(t(t(D-3C+3B-A)+2C-4B+2A)+B-A)$
### Highest Point $clamp(\frac{-A.y+2B.y-C.y-\sqrt{B.y^{2}-D.yB.y-B.yC.y+D.yA.y+C.y^{2}-A.yC.y}}{D.y-A.y+3B.y-3C.y},0,1)$
> [!note] Reverse sign for lowest point 
> Cubic beziers can have 2 valleys with 0 derivative, unlike quadratic
### To Quadratic $C_1=\frac{2B}{3},C_2=\frac{C+2B}{3}$
### Approx 2 cubic splines with 1
- 2 connected cubic beziers $((0,0),b,c,d);(d,e,f,g)$
- Find highest or lowest point $H_1,H_2$ for each bezier
- Clamp it to 0-1 and calculate bezier point at $H_1,H_2$
- Choose absolute higher xor lower bezier point $H$
- Approximation quadratic bezier $((0,0),2H-0.5e,e)$
