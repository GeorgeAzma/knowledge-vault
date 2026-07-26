When given a noisy live measurement of a changing variable, kalman filter tries to predict its true state
### How It Works
``` python
x = 0.0 # best guess of current state
p = 1.0 # uncertainty/variance in best guess

# called when measurement comes in (after some delta time)
def kalman_step(x, p, x_measured):
    # predict new state by extrapolating current guess of the true state
    x_pred = x + v * dt
    # since prediction is not perfect, it has prediction/process noise
    q = 0.001
    # add prediction noise to uncertainty in current best guess
    p_pred = p + q

    measurement_noise = 0.1

    k = p_pred / (p_pred + measurement_noise) # kalman gain

    innovation = x_measured - x_pred

    x = x + k * innovation # blend prediction & measurement
    p = (1.0 - k) * p # reduce uncertainty
```
https://youtu.be/lIYYJMHAwMU