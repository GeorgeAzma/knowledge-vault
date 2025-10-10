[[RMSProp]] + [[Gradient Descent|Momentum/SGD]]
$\large m_t=\beta_1m_{t-1}+(1-\beta_1)g_t$
$\large v_t=\beta_2v_{t-1}+(1-\beta_2)g_t^2$
$\large\theta=\theta-\huge\frac{\alpha m_t}{\sqrt{v_t+\epsilon}}$ `parameters / weights`
- $\beta_1$ momentum
- $\beta_2$ gamma in [[RMSProp]]
- $\alpha$ learning rate
- $g_t$ gradient
### Warm Start
to avoid when $m_{t-1}=0,\ v_{t-1}=0$
$\large\hat{m_t}=\frac{m_t}{1-\beta_1^t}$
$\large\hat{v_t}=\frac{v_t}{1-\beta_2^t}$
### What It's Doing
It is an average [[Gradient Descent|Momentum]] optimizer, but it tries to jump over flat areas `or low gradient areas`
it increases learning rate when gradients are low by dividing learning rate by squared gradients
specifically it divides by [[Moving Average]] of the squared gradients, where $\beta_2$ controls averaging
