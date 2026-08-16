### $440\text{ hz}\to0\text{ hz}$ in $3$ seconds
- **Wrong** $\cos(2\pi\cdot440\cdot t\cdot(1-t/3))$
- **Correct** $\cos(2\pi\cdot440\cdot t\cdot(1-t/6))$
- **Pitch = [[Derivative]] inside $\cos$** `not whatever comes after 2pi`
##### Calculation
- pitch should be a function of $p(x)=1-t/3$
- pitch = derivative inside $\cos$, so we want derivative to be $f'(x)=p(x)=1-t/3$
- [[Integral|Integrate]] $f(t)=\int f'(t)=t-t^2/6\implies f(t)=t(1-t/6)$
### [[Useful Functions]]
``` rust
pub fn slide(t: f32, f0: f32, f1: f32, d: f32) -> f32 {
    let td = t.min(d);
    let phase = f0 * td + (f1 - f0) * td * td / (2.0 * d);
    phase + (t > d) as i32 as f32 * f1 * (t - d)
}
```
##### [[Colored Noise]]
##### [[Impulse Response]]
##### [[Filter]]
### TODO:
- **Biquad Filter**
    - used to make lowpass, highpass, bandpass, peaking... filters
    - **cool thing is** you can input white noise to biquad filters that filter out specific frequency bands, to get noisy human like frequency bands and simulate formants/speech or plucked string `Karplus-Strong`

``` rust
#[derive(Clone, Copy)]
pub enum FilterType { Lowpass, Highpass, Bandpass, Peaking { gain_db: f32 } }

pub struct Biquad {
    b0: f32, b1: f32, b2: f32,
    a1: f32, a2: f32,
    x1: f32, x2: f32,
    y1: f32, y2: f32,
}

impl Biquad {
    pub fn new(filter_type: FilterType, freq: f32, q: f32, sample_rate: f32) -> Self {
        let w0 = std::f32::consts::TAU * freq / sample_rate;
        let alpha = w0.sin() / (2.0 * q);
        let cos_w0 = w0.cos();

        let (b0, b1, b2, a0, a1, a2) = match filter_type {
            FilterType::Lowpass => (
                (1.0 - cos_w0) / 2.0, 1.0 - cos_w0, (1.0 - cos_w0) / 2.0,
                1.0 + alpha, -2.0 * cos_w0, 1.0 - alpha,
            ),
            FilterType::Highpass => (
                (1.0 + cos_w0) / 2.0, -(1.0 + cos_w0), (1.0 + cos_w0) / 2.0,
                1.0 + alpha, -2.0 * cos_w0, 1.0 - alpha,
            ),
            FilterType::Bandpass => (
                alpha, 0.0, -alpha,
                1.0 + alpha, -2.0 * cos_w0, 1.0 - alpha,
            ),
            FilterType::Peaking { gain_db } => {
                let A = 10.0f32.powf(gain_db / 40.0);
                (
                    1.0 + alpha * A, -2.0 * cos_w0, 1.0 - alpha * A,
                    1.0 + alpha / A, -2.0 * cos_w0, 1.0 - alpha / A,
                )
            }
        };

        Self {
            b0: b0 / a0, b1: b1 / a0, b2: b2 / a0,
            a1: a1 / a0, a2: a2 / a0,
            x1: 0.0, x2: 0.0, y1: 0.0, y2: 0.0,
        }
    }

    pub fn process(&mut self, input: f32) -> f32 {
        let output = self.b0 * input + self.b1 * self.x1 + self.b2 * self.x2
            - self.a1 * self.y1 - self.a2 * self.y2;
            
        self.x2 = self.x1; self.x1 = input;
        self.y2 = self.y1; self.y1 = output;
        output
    }
}

pub struct FormantFilter {
    f1: Biquad, f2: Biquad, f3: Biquad,
}

impl FormantFilter {
    pub fn new(vowel: char, sample_rate: f32) -> Self {
        // Formant center frequencies (F1, F2, F3) for male vowels
        let (f1, f2, f3) = match vowel.to_ascii_uppercase() {
            'A' => (730.0, 1090.0, 2440.0),
            'E' => (530.0, 1840.0, 2480.0),
            'I' => (270.0, 2290.0, 3010.0),
            'O' => (570.0, 840.0, 2410.0),
            'U' => (300.0, 870.0, 2240.0),
            _ => (500.0, 1500.0, 2500.0),
        };

        // Tight resonance (Q = 10.0) creates ringing formants
        Self {
            f1: Biquad::new(FilterType::Bandpass, f1, 10.0, sample_rate),
            f2: Biquad::new(FilterType::Bandpass, f2, 10.0, sample_rate),
            f3: Biquad::new(FilterType::Bandpass, f3, 10.0, sample_rate),
        }
    }

    pub fn process(&mut self, input: f32) -> f32 {
        // Parallel resonance bank
        (self.f1.process(input) + self.f2.process(input) + self.f3.process(input)) * 0.5
    }
}

pub struct CombFilter {
    buffer: Vec<f32>,
    idx: usize,
    feedback: f32,
    damp: f32,
    store: f32,
}

impl CombFilter {
    pub fn new(delay_samples: usize, feedback: f32, damp: f32) -> Self {
        Self {
            buffer: vec![0.0; delay_samples],
            idx: 0,
            feedback,
            damp,
            store: 0.0,
        }
    }

    pub fn process(&mut self, input: f32) -> f32 {
        let output = self.buffer[self.idx];
        
        // Lowpass damping on the feedback signal
        self.store = output * (1.0 - self.damp) + self.store * self.damp;
        
        self.buffer[self.idx] = input + self.store * self.feedback;
        self.idx = (self.idx + 1) % self.buffer.len();
        
        output
    }
}

pub struct PluckedString {
    buffer: Vec<f32>,
    idx: usize,
    last_y: f32,
    feedback: f32,
}

// Karplus-Strong Plucked String
impl PluckedString {
    pub fn new(freq: f32, sample_rate: f32, feedback: f32) -> Self {
        let delay_samples = (sample_rate / freq).round() as usize;
        Self {
            buffer: vec![0.0; delay_samples.max(1)],
            idx: 0,
            last_y: 0.0,
            feedback, // e.g. 0.98 for decay duration
        }
    }

    // Excite the string with a burst of impulse noise
    pub fn trigger_impulse(&mut self, noise: &[f32]) {
        for (slot, &n) in self.buffer.iter_mut().zip(noise.iter()) {
            *slot = n;
        }
    }

    pub fn process(&mut self) -> f32 {
        let x = self.buffer[self.idx];
        
        // 1-Pole Lowpass inside the feedback loop (EMA dampening)
        let y = 0.5 * (x + self.last_y) * self.feedback;
        self.last_y = y;

        self.buffer[self.idx] = y;
        self.idx = (self.idx + 1) % self.buffer.len();
        y
    }
}
```