Converts words/tokens into vectors with meaning called word embeddings
> [!example] $\vec{King}-\vec{Man}+\vec{Woman}=\vec{Queen}$
### How it works
- Do [[Tokenization]] to create vocabulary of tokens
- Create a Linear embedding layer with $d_{vocab}$ and $d_{model}$
> [!note] $d_{model}$ is embedding vector length 
- Forward embedding layer with [[One Hot Encoding|One Hot Encoded]] token index as an input
> [!tip] Since word is [[One Hot Encoding|One Hot Encoded]] effectively only single neuron of embedding layer is active and set to 1, so it's trained weights are the embeddings of the word
> > [!note] Embedding layers don't have biases, it'd be pointless

> [!note]
> You can use `nn.Embedding(d_vocab, d_model)` which is basically the same as `nn.Linear(d_vocab, d_model)` but it takes in token index and converts it to one hot vector automatically, it's also probably more optimized and doesn't multiply
> 0s of the [[One Hot Encoding]] needlesly 
> > [!note] though for some reason it was slower than my custom embedding algorithm when testing
