Use loss surface slope to go down steep surfaces slowly and flat surfaces faster

momentum accelerates in consistent direction, while RMSProp controls step size to overshoot flat areas

takes moving average of gradients and divides learning rate by square root of the moving average
### Formula $E(g_t^2)=\gamma E(g_{t-1}^2)+(1-\gamma)g_t^2,\quad\theta=\theta-\frac{\eta}{\sqrt{E(g_t^2)+\epsilon}}g_t$
- $E$ exponential moving average of gradients $\large g_t^2$
- $\theta$ model parameters being optimized
