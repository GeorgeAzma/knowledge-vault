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

> [!tip]
> - Good bin size 4096
> - Good hop length 2048

youtu.be/PjKlMXhxtTM
