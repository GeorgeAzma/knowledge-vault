Just a sine wave function
Used for [[Short Time Fourier Transform (STFT)]] bins
- Grab $n$ sized bin of samples
- Multiply it by Hann window
- Do FFT on the result
![[Han Window.webp]]
### Formula: $0.5(1-\cos(2\pi xn))$
- $n$ is bin size (Should be less than total size, preferably power of two)
#### Resource:
download.ni.com/evaluation/pxi/Understanding%20FFTs%20and%20Windowing.pdf

> [!note]
> There are other types of windows, more suitable in some cases, but this is the best in general case, like speech
