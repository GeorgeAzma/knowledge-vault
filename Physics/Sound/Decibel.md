``` rust
// amp = sound pressure level (SPL)
// amp_ref = can be lowest pressure difference human ear can hear at 1000 hz = ~2e-5
// note: (amp / amp_ref).log10() = amp.log10() - amp_ref
fn amp_to_db(amp: f32, amp_ref: f32):
    20.0 * (amp / amp_ref).log10()
    
fn db_to_amp(db: f32):
    10f32.pow(db / 20.0)
    
// amp = sound intensity level (SIL, W/m^2)
// amp_ref = lowest intensity difference human ear can hear at 1000 hz = 10e-12
fn amp_to_db(amp: f32):
    20.0 * amp.max(1e-20).log10()
    
fn db_to_amp(db: f32):
    10f32.pow(db / 20.0)
```
### dB Types
- Sound pressure level (SPL) $20\log_{10}{\dfrac{p}{p_0}}$ `p is pressure`
- Sound intensity level (SIL) $10\log_{10}{\dfrac{I}{I_0}}$
- [[Voltage]] level $10\log_{10}{\dfrac{V}{V_0}}$
- Power level $10\log_{10}{\dfrac{P}{P_0}}$ `P is power`
- Gain $10\log_{10}{\dfrac{P_{out}}{P_{in}}}$ `P is power`
- Attenuation $10\log_{10}{\dfrac{P_{in}}{P_{out}}}$ `P is power, equals negative Gain dB`
### Decibel Chart
| dB | $W/m^2$ | Example |
| ---- | ---- | ---- |
| 0 | $10^{-12}$ | Quiet `Threshold of hearing at 1000 hertz` |
| 10 | $10^{-11}$ | Leaves rustling |
| 20 | $10^{-10}$ | Whisper from meter distance |
| 30 | $10^{-9}$ | Quiet home |
| 40 | $10^{-8}$ | Average home |
| 50 | $10^{-7}$ | Average office |
| 60 | $10^{-6}$ | Conversation |
| 70 | $10^{-5}$ | Busy traffic |
| 80 | $10^{-4}$ | Loud radio |
| 90 | $10^{-3}$ | Inside heavy truck `Damage if prolonged exposure` |
| 100 | $10^{-2}$ | Siren `Damage if 8h a day` |
| 110 | $10^{-1}$ | Loud chainsaw `Damage if 30min` |
| 120 | $1$ | Loud rock concert `Threshold of pain` |
| 140 | $10^2$ | Jet 30 meters `Severe pain, damage in seconds` |
| 160 | $10^4$ | Bursting of eardrums |
