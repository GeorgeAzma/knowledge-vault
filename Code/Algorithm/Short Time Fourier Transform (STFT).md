---
aliases:
  - Librosa
---
Frequently used in [[Spectrogram]]
### How it Works
- Waveform signal is divided into **Bin Size** windows
- Bin size should be big enough to retain frequency information
- Bin size should be small enough to represent instantaneous time step
- Windows are overlapping and **Hop Length** apart from each other
- Windows use [[Window Function]] to have a smooth fade transition from one window to another
- After applying window function to all the overlapped windows you need to normalize the output, since window functions don't sum to 1
### Why it's used
- It gives time-localized frequency information
- Unlike [[Fourier Transform]] which gives frequency information averaged over entire time interval

> [!tip] Good bin size/hop length for visualization
> ``` python
> fft_size, hop_length = [(8192, 2048), (4096, 1024), (4096, 2048)]
> ```

youtu.be/PjKlMXhxtTM
### Code
``` python
n_fft = 4096
hop_length = 1024
window = "hann"

stft = librosa.stft(
    audio,
    n_fft=n_fft,
    hop_length=hop_length,
    window=window
) # shape = (sample_rate / 2, n_frames)
# n_frames = n_samples / hop_length

magnitude = np.abs(stft)
magnitude_db = librosa.amplitude_to_db(
    magnitude,
    ref=np.max
)

# extracts start frequency for each frequency bin, useful for graphing frequency axis
# e.g. for 48KHz with n_fft=4096 gives 48000/4096=11.71hz bins
# so frequencies are [0, 11.71, 23.42, 35.13, ..., 23993.79]
frequencies = librosa.fft_frequencies(
    sr=sample_rate,
    n_fft=n_fft
)

# converts frame numbers to seconds, useful for graphing
# e.g. for 48KHz with hop_length=1024 gives 1024/48000=0.021333s
# so frame_times are [0, 0.0213, 0.0426...]
frames = np.arange(stft.shape[1])
frame_times = librosa.frames_to_time(
    frames,
    sr=sample_rate,
    hop_length=hop_length
)
```