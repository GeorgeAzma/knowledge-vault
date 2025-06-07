Optimization technique, makes something better without making others worse
![[Pareto Efficiency.webp]]
- In this image all blue solutions are pareto optimal (When minimizing for $f_1(x)$ and $f_2(x)$)
- Black line is called **Pareto Front**, where $f_1(x)+f_2(x)=f_1(x_n)+f_2(x_n)$
- You would never consider white solutions since they will always be worse than pareto front

> [!example]
> - Optimize for torque and top rotation speed for an electric motor
> - Lets say you care about torque x2 as much as rpm
> - So: $f_1(x)=x$ and $f_2(x)=2x$, where $f_1(x)$ is rpm and $f_2(x)$ is torque
> - Lets say possible rpms and torques are: (1, 3), (2, 1), (2, 2), (0, 2)
> - Optimize for: $f_1(x)+f_2(x)$
> - (1, 3): $f_1(1)+f_2(3)=7$
> - (2, 1): $f_1(2)+f_2(1)=4$
> - (2, 2): $f_1(2)+f_2(2)=6$
> - (0, 2): $f_1(0)+f_2(2)=4$
> - Solutions (2, 1), (0, 2) are pareto optimal, hence part of pareto frontier
