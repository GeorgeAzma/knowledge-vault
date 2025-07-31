Compresses color data and high frequency data, because human eye can't perceive them well
### How it works
- Color Space Conversion:
	- Convert RGB to YCbCr (Brightness, Chrominance blue, Chrominance Red)
	- Divide into 2x2 pixel groups, downscale blue/red chrominance by averaging all pixels in a group
- Discrete Cosine Transform:
	- Divide into 8x8 pixel groups
	- Convert each pixel group into frequency domain using [[Fourier Transform|FFT]]
	![[Discrete Cosine Transform.webp|500]]
	- Quantize higher frequency data:
		- Divide data by quantization table and round up
		- Quantization table has higher values at higher frequencies
- [[Run Length Encoding]] + [[Huffman Encoding]] ![[JPEG Run Length and Huffman Encoding.webp]]

##### Resource youtu.be/Kv1Hiv3ox8I
