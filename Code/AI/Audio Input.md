### Ways
- **Raw Samples** => model => **Raw Samples**
- [[Short Time Fourier Transform (STFT)|STFT]] [[Spectrogram]] => model => [[Short Time Fourier Transform (STFT)|STFT]] [[Spectrogram]] => Griffin Lim => **Raw Samples**
- [[MEL]] [[Spectrogram]] => model => [[Short Time Fourier Transform (STFT)|STFT]] [[Spectrogram]] => [[MEL]] [[Spectrogram]] => 
  => Inv [[MEL]] [[Spectrogram]] (lossy) => Griffin Lim => **Raw Samples**