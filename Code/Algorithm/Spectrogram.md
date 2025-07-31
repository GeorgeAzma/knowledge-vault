Displays audio frequency domain data
### How it Works
- [[Short Time Fourier Transform (STFT)]] is done on waveform signal
- For each window
	- Display each frequency's amplitude using a pixel
	- Which gives you array of pixels
- Join these pixel arrays to get a 2D grid with time and frequency axis
> [!note] Spectrogram frequency axis is usually log scale
