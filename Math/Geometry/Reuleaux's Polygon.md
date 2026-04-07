made by intersection of $n$ circles
### [[SDF]]
``` c
float reuleaux(vec2 p, int n) {
    float a = atan(p.y, p.x);
    float ang = 3.1415926 / float(n);
    float cc = cos(a - 2.0 * ang * floor(0.5 * (a - 3.1415926) / ang + 0.5));
    return length(p) - (cc + sqrt(1.0 + 2.0 * cos(ang) + cc * cc));
}
```
### Formulas 
- $n=4$ formula $x^{2}+y^{2}+\max(|x|,|y|)=1$