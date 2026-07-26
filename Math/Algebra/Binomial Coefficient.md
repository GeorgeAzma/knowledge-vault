---
aliases:
  - Combination
---
### Formula $\dbinom{n}{r}=\dfrac{n!}{(n-r)!r!}$
$n=6,\ r=2$ How many pairs can be made from group of 6 people
Related to [[Pascal's Triangle]] where $n$ is depth and $r$ is index
> [!example] Coin flip $\binom{100}{50}$ $100$ flips, $50$ heads, probability of exactly $50$ heads $P(50)=\dfrac{\binom{100}{50}}{2^{100}}\approx0.08\approx 8\%$

![[Pascal's Triangle#Table]]
### [[Stirling's Factorial Approximation]] $n!\approx\sqrt{2\pi n}\left(\dfrac{n}{e}\right)^n$ 
substitute in $\dbinom{n}{r}$ gives $\dfrac{n!}{(n-r)!r!}=$
- $=\dfrac{\sqrt{2\pi n}\left(\dfrac{n}{e}\right)^n}{\sqrt{2\pi (n-r)}\left(\dfrac{n-r}{e}\right)^{n-r}\cdot~\sqrt{2\pi r}\left(\dfrac{r}{e}\right)^r}$ `substitute approximation`
- $=\dfrac{\sqrt{2\pi n}}{\sqrt{2\pi (n-r)}\sqrt{2\pi r}}\dfrac{\left(\dfrac{n}{e}\right)^n}{\left(\dfrac{n-r}{e}\right)^{n-r}\left(\dfrac{r}{e}\right)^r}$ `separate square root and power parts`
- $=\dfrac{\sqrt{2\pi n}}{\sqrt{2\pi (n-r)}\sqrt{2\pi r}}\dfrac{\dfrac{n^n}{e^n}}{\dfrac{(n-r)^{n-r}}{e^{n-r}}\dfrac{r^r}{e^r}}$ `expand powers`
- $=\sqrt{\dfrac{n}{2\pi r(n-r)}}\dfrac{n^ne^{n-r}e^r}{(n-r)^{n-r}r^re^n}$ `simplify`
- $=\sqrt{\dfrac{n}{2\pi r(n-r)}}\dfrac{n^ne^n}{(n-r)^{n-r}r^re^n}$ `simplify powers`
- $=\sqrt{\dfrac{n}{2\pi r(n-r)}}\dfrac{n^n}{(n-r)^{n-r}r^r}$ `cancel`
- $=\sqrt{\dfrac{n}{2\pi r(n-r)}}\left(\dfrac{n}{r}\right)^r\left(\dfrac{n}{n-r}\right)^{n-r}$ `rewrite`
for $r=n/2$ this simplifies to $\sqrt{\dfrac{2}{\pi x}}$