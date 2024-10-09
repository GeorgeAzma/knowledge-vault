Generative Pre-trained Transformer

## How It Works `Translator GPT`
- ### Encoder/Decoder
	- [[Tokenization]]
	- [[Word Embedding]]
	- [[Positional Encoding]]
	- Normalize outputs (Using [[Layer Normalization]] or [[Batch Normalization]])
	- [[Multi Head Self Attention]] (For Decoder use [[Masked Multi Head Self Attention]]) with $h$ Heads
	- Use [[Residual Connection]], for [[Self Attention]] output and (word embedding + positional encoding) output
	- Normalize outputs (Using [[Layer Normalization]] or [[Batch Normalization]])
- Grab the outputs of the encoder
- Pass these outputs to [[Neural Network]], with input/output size of $d_{model}$ and inner layer  dimensionality of $d_{ff}$
- Use [[Residual Connection]] for [[Self Attention]] output and [[Neural Network]] output
- Normalize outputs (Using [[Layer Normalization]] or [[Batch Normalization]])
- Calculate Keys and Values
- Pass them to the decoder
- In the decoder calculate Queries using decoder outputs
- Now decoder has K, Q, V
- Use them to do [[Multi Head Self Attention]] with [[Residual Connection]] again
- Normalize outputs (Using [[Layer Normalization]] or [[Batch Normalization]])
- Pass these outputs to [[Neural Network]]
- Use [[Residual Connection]] for [[Self Attention]] output and [[Neural Network]] output
- Normalize outputs (Using [[Layer Normalization]] or [[Batch Normalization]])
- Now we need to take these outputs and convert them back into tokens
- We do that by running the outputs to Linear Transformation
- That can be done using single layer [[Neural Network]] with no [[Activation Function]]
- Output will be probability for each word in the vocabulary
- Which we run through the [[Softmax]] function to get the final output

> [!note]
> - Typical GPT parameters:
>	- $d_{model}=512$
>	- $d_v=64$
>	- $N=6$
>	- $d_{ff}$=2048
>	- $h=8$
>	- Meaning each head has $d_{model} \div h=64$ query size
>	- [[Activation Function]] RELU or GELU (Not sure)
>	- GPT uses Adam Optimizer with $\beta_1=0.9,\beta_2=0.98,\epsilon=10^{-9}$
>	- $lrate=d_{model}^{-0.5}\min{(step^{-0.5},step*WarmupSteps^{-1.5})}$
>	- $WarmupSteps=4000$
>	- Apply Residual dropout to each sub layer before it is added to sub layer input and normalized, chance of dropout is 0.1, also apply dropout to sums of embeddings + positional encodings in both encoder and decoder
>	- Apply Label Smoothing with value $\epsilon_{ls}=0.1$
> - Chat GPT is decoder only

![[GPT Architecture.webp]]
![[GPT Translator Architecture.webp]]
![[Self Attention.webp]]
See [[GPT Code]]
