### [[Line]] to [[Line]] $x={d-c \over a-b}$
- $ax+c=bx+d$     `Line1 = Line2 at point x`
- $ax-cx=d-b$
- $x={d-c \over a-b}$
- $P=(x,ax+c)=({d-c \over a-b}, a{d-c \over a-b}+c)$
- If $a$ and $b$ are same, lines are parallel

### [[Point]] to [[Line Segment]]
```Python
def on_segment(p, l):
	return p.x <= max(l.p1.x, l.p2.x) &&
		   p.x >= min(l.p1.x, l.p2.x) &&
		   p.y <= max(l.p1.y, l.p2.y) &&
		   p.y >= min(l.p1.y, l.p2.y) &&
```

### [[Line Segment]] to [[Line Segment]]
```Python
def intersects(l1, l2):
	d1 = l1.p2 - l1.p1
	d2 = l2.p2 - l2.p1
    denom = d2.y * d1.x - d2.x * d1.y
    if denom == 0: # parallel
        return None
        
    ua = (d2.x * (l1.p1.y - l2.p1.y) - 
	      d2.y * (l1.p1.x - l2.p1.x)) / denom
    if ua < 0 or ua > 1: # out of range
        return None
        
    ub = (d1.x * (l1.p1.y - l2.p1.y) - 
	      d1.y * (l1.p1.x - l2.p1.x)) / denom
    if ub < 0 or ub > 1: # out of range
        return None
        
    p = l1.p1 + ua * d1
    
    return p
```

### [[Point]] to [[Circle]]
- Find a distance from the point and center of the circle
- If distance is equal to radius, point intersects

### [[Line]] to [[Circle]]
- $p=\text{Circle's center point}$
- $(x,y)=\text{Point on a line}$

[[Line]] formula $y=ax+b$
[[Circle]] formula $(x-p_x)^2+(y-p_y)^2=r^2$

Distance from $p$ to $(x,y)$ should be $r$
$(p_x-x)^2+(p_y-y)^2=r^2$

**Simplify**
- $(p_x-x)^2+(p_y-(ax+b))^2-r^2=0$
- $p_x^2-2p_xx+x^2+(p_y-ax-b)^2-r^2=0$
- $p_x^2-2p_xx+x^2+p_y^2-2p_yax-2p_yb+a^2x^2+2axb+b^2-r^2=0$
- $(1+a^2)x^2-2(ab+p_x-p_ya)x+p_x^2+p_y^2-2p_yb+b^2-r^2=0$

[[Quadratic Equation]]
- $a=1+a^2$
- $b=2(ab-p_x-p_ya)$
- $c=p_x^2+p_y^2-2p_yb+b^2-r^2$
$D=b^2-4ac=4((ab-p_x-p_ya)^2-(1+a^2)(p_x^2+p_y^2-2p_yb+b^2-r^2))$
$x\huge=\frac{-b\pm\sqrt{D}}{2a}=\frac{-2(ab-p_x-p_ya)\pm\sqrt{4((ab-p_x-p_ya)^2-(1+a^2)(p_x^2+p_y^2-2p_yb+b^2-r^2))}}{2(1+a^2)}$
$x=\huge\frac{p_x+a(p_y-b)\pm\sqrt{a^2(r^2-p_x^2)+(p_y-b)(2p_xa-p_y+b)+r^2}}{1+a^2}$
**Final intersection points**
- $(x_1, ax_1+b)$
- $(x_2, ax_2+b)$
```Python
def intersects(line, circle):
	a, b = line.a, line.b # slope and y-intercept
	p, r = circle.center, circle.radius
	
	da = 1 + a * a
	db = 2 * (a * b - p.x - p.y * a)
	dc = p.x * p.x + p.y * p.y + 2 * p.y * b + b * b - r * r
	
	D = db * db - 4 * da * dc
	if D < 0:
		return None
		
	D = sqrt(D)
	x1 = (-db - D) / (2 * da)
	x2 = (-db + D) / (2 * da)
	
	return x1, x2

#### Maybe more optimized ####
D = a * a * (r * r - p.x * p.x) + (p.y - b) * (2 * p.x * a - p.y + b) + r * r
if D < 0:
	return None

D = sqrt(D)
da = 1 / (1 + a * a)
db = p.x + a(p.y - b)
x1 = (db + D) * da
x2 = (db - D) * da
###############################
```
### [[Line Segment]] to [[Circle]]
```Python
def intersects(line, circle):
	d = line.p2 - line.p1
	s = circle.center - line.p1
	
	a = d.x * d.x + d.y * d.y
	b = 2 * d.x * s.x + d.y * s.y
	c = s.x * s.x + s.y * s.y - circle.radius * circle.radius

	D = b * b - 4 * a * c
	if D < 0: # No intersection points
		return None
		
	D = sqrt(D)
	t1 = (-b - D) / (2 * a)
	t2 = (-b + D) / (2 * a)

	return line.p1 + t1 * d, line.p1 + t2 * d
```
### [[Circle]] to [[Circle]]
Useful for finding object position 
with 2 radar detected distances
If we know radar positions
### Formula $p_1+ad_n\pm\sqrt{r_1^2-a^2}(-d_n.y,d_n.x)$
- $p_1,p_2$ Positions
- $r_1,r_2$ Radiuses
- $d=p_2-p_1$
- $d_n=d|d|^{-1}$
- $a=\frac{r_1^2-r_2^2+|d|^2}{2|d|}$
### Ray to [[Sphere]]
calculate by solving `length(ray_pos + ray_dir * dist) = radius`
``` c
// Returns ray trevelled distance or -1 if missed 
float ray_sphere_intersect(vec3 ro, vec3 rd, vec3 so, float sr) {
    vec3 so_ro = ro - so;
    float b = dot(rd, so_ro);
    float c = dot(so_ro, so_ro) - sr * sr;
    float d = b * b - c;
    if (d < 0.0) return -1.0;
    return -b + sqrt(d);
}
```
### [[Point]] to [[Triangle]]
``` c
float c1 = cross(b - a, p - a);
float c2 = cross(c - b, p - b);
float c3 = cross(a - c, p - c);
if !(c1 >= 0.0 && c2 >= 0.0 && c3 >= 0.0) {
    continue;
}
// tip: add padding c1 >= -pad
```
