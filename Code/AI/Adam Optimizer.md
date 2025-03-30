[[RMSProp]] + [[Gradient Descent|Momentum/SGD]]
## $$\begin{array}{l}
m_t=\beta_1m_{t-1}+(1-\beta_1)g_t\\
v_t=\beta_2v_{t-1}+(1-\beta_2)g_t^2\\
\theta=\theta-\large\frac{\alpha m_t}{\sqrt{v_t+\epsilon}}
\end{array}$$
- $\beta_1$ momentum
- $\beta_2$ gamma in [[RMSProp]]
- $\alpha$ learning rate
### Warm Start
to avoid when $m_{t-1},v_{t-1}$ are zero
$\huge\hat{m_t}=\frac{m_t}{1-\beta_1^t}$
$\huge\hat{v_t}=\frac{v_t}{1-\beta_2^t}$
