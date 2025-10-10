calculates volume of function being revolved around axis `which be hollow near rotation axis`
### $V=2\pi\int_a^b\text{radius}\cdot\text{height}\ dx$
- rotates around $x$ axis
- **radius** thickness $|y(x)-c|$ `c = axis of rotation`
- **height** vertical length of region at point $x$
> [!example] $\large y=e^{5x},\ y=0,\ x=-2,\ x=3$ around line $y=-1$
> - $\text{radius}=e^{5x}-(-1)=e^{5x}+1$ `y_upper_bound - y_rot_axis`
> - $\text{height}=e^{5x}-0=e^5x$ `y_upper - y_lower`
> - $a=-2,\ b=3$ 
> - $V=2\pi\int_{-2}^3(e^{5x}+1)(e^{5x})=2\pi\int_{-2}^3(e^{10x}+e^{5x})$
> - $\int e^{10x}dx=\frac{1}{10}e^{10x}$ and $\int e^{5x}dx=\frac{1}{5}e^{5x}$
> - $V=2\pi\large[\frac{1}{10}{e^{10x}}+\frac{1}{5}{e^{5x}}]^3_{-2}$
> - for $x=-2$ we get $a=\frac{1}{10}e^{-20}+\frac{1}{5}e^{-10}$
> - for $x=3$ we get $b=\frac{1}{10}e^{30}+\frac{1}{5}e^{15}$
> - $V=2\pi[b-a]=\large2\pi[(\frac{1}{10}e^{30}+\frac{1}{5}e^{15})-(\frac{1}{10}e^{-20}+\frac{1}{5}e^{-10})]$
> - $\large=2\pi[\frac{e^{30}-e^{-20}}{10}+\frac{e^{15}-e^{-10}}{5}]=2\pi\huge\frac{e^{30}-e^{-20}+2e^{15}-2e^{-10}}{10}$
