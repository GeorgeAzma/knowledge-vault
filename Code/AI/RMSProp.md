Tries to determine slope of error surface so that 
it goes down steep surfaces with low speed/learning_rate
and flat surfaces with high speed

momentum accelerates in consistent direction
while RMSProp controls step size to overshoot flat areas etc.

takes moving average of gradients and divides 
learning rate by square root of the moving average

### Formula $E(g_t^2)=\gamma E(g_{t-1}^2)+(1-\gamma)g_t^2, \theta=\theta-\frac{\eta}{\sqrt{E(g_t^2)+\epsilon}}g_t$
