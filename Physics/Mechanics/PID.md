**Proportional Integral Derivative** continuously adjusts system's input to make its output match desired target `increase heater to reach constant 20C`
- $e(t)$ error `target_temp - curr_temp`
- $u(t)=K_Pe(t)+K_I\int e(t)dt+K_D\dfrac{de(t)}{dt}$ control output `heater change +5C, -3C ...`
    - $K_P,K_I,K_D$ control parameters `proportional, integral, derivative`
``` python
K_P = 2 # proportional term coefficient, reacts to current error
K_I = 1 # integral term coefficient, reacts to accumulated error
K_D = 3 # derivative term coefficient, reacts to error slope

target_temp = 100 

curr_temp = 99 # system state reading

error = target_temp - curr_temp = 1 # error is 1C

# Proportional term says: 1C error is not much
# use: reduces error over time
P = K_P * error = 2C
heater_temp += P

# Integral term says: we've been 1C too cold for 30 seconds, keep increasing power
# use: eliminates constant error, but can overshoot/oscillate
#      also if heater is only capable of 100C max, integral term may accumulate to infinity
I = K_I * integral_dt(e(t)) = 30C

# Derivative term says: temperature is approcahing target rapidly, we may need to slow down
# use: future prediction to approach target faster or to not overshoot
D = K_D * deriv_dt(e(t))

u(t) = P + I + D # control output

# practical implementation
while True:
    e = target - measurement # calc error
    P = K_P * e # apply proportional term
    I += K_I * e * dt # accumulate error over time each iteration
    D = K_D * (e - e_prev) / dt # calc derivative using previous error
    u = P + I + D # controller output update
```
### Problems
- sensitive to measurement noise
- often filtered in practice
### Tuning Parameters
- manual tuning
- Ziegler-Nicholis method
- software based optimization