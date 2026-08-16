---
aliases:
  - Infinite Impulse Response
  - Finite Impulse Response
  - IIR
  - FIR
  - Pole
  - Multi-Pole
---
### IIR `Infinite Impulse Response`
- **Pole** how many previous outputs to take into account `used for FIR/IIR`
    - 1-pole IIR is same as [[exponential moving average]]
    - Multi-pole IIR just chains multiple [[Exponential Moving Average|EMAs]] in series or in parallel
    - Multi-pole IIR can be used to generate any [[colored noise]]
### FIR `Finite Impulse Response`
- similar to IIR/EMA but takes in finite $N$ previous samples, weighs them and adds them