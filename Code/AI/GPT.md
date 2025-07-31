Generative Pre-trained Transformer
youtu.be/zxQyTK8quyY
## How It Works
#### Encode Words Into Numbers
##### Create Vocabulary 
most frequent tokens in train text, where tokens are words/subwords/chars
``` python
vocab = create_vocab(train_text) # Map<token, freq_idx> 
# >> { <pad>: 0, ' ':1, 'play':4, 'the':2, 'ing':3, 'piano':5 }
# note: vocab must have all chars for it to be able to tokenize anything
# crate_vocab(): divides words into all possible subwords
#                most frequent subwords are selected
```
##### [[Tokenization]] 
convert sentence to tokens and get their vocab indices
``` python
seq_len = 8 # context size (max sentence tokens)
sentence = 'playing the piano' # same as prompt
tokens = tokenize(sentence) # >> [4, 3, 1, 2, 1, 5, 0, 0]
# len(tokens) = seq_len, so output tokens is padded via 0s
# <pad> tokens are ignored via mask
``` 
##### [[Word Embedding]] 
convert tokens to meaning vectors called word embeddings
``` python
d_model = 4 # len(word_embedding)
embedding = nn.Embedding(len(vocab), d_model)
word_embedding = embedding.forward(token_idx) # >> [0.3, 0.1, -0.5, 0.9]
# or use pre-trained token embeddings like Word2Vec
# embedding is done for each token 'len(tokens)=seq_len'
# to get 'tok_embed' with shape = (seq_len, batch_size, d_model) (unless batch_first=True)
```
#### Encode Token Positions
##### [[Positional Encoding]] 
is added to [[Word Embedding]][[s]]
``` python
for pos, embed in enumerate(tok_embed): # ignore batches
    embed += encode_position(pos, d_model)
    embed = layer_norm(embed)
```
#### Encode Relationships Among Tokens
##### [[Self Attention]]
Grabs meaning from previous tokens based on their relevance
and generates new meaning that kinda represents context up to current token
``` python
# Example: for tok_idx=1
# Word embeddings + Positional Encoding 
# are mapped to Keys, Queries, Values using nn.Linear
k = nn.Linear(d_model / nheads, bias=False)
v = nn.Linear(d_model / nheads, bias=False)
q = nn.Linear(d_model / nheads, bias=False)
# Map 1st token embeddings to k,q,v
ks[0, :] = k.forward(word_embedding[0, :])
qs[0, :] = q.forward(word_embedding[0, :])
vs[0, :] = v.forward(word_embedding[0, :])

# self k,q,v is also calculated
ks[1, :] = k.forward(word_embedding[1, :])
qs[1, :] = q.forward(word_embedding[1, :])
vs[1, :] = v.forward(word_embedding[1, :])

# future k,q,v isn't calculated yet to avoid cheating
# ks[2] = ...

similarity[0] = dot(qs[2, :], ks[0, :]) # divide by sqrt(d_model) for normalization
similarity[1] = dot(qs[2], ks[1]) # self similarity
# future word similarity is not calculated to avoid cheating 
# because it won't have next words when generating
# similarity[2] = dot(qs[2], ks[2])
similarity = softmax(similarity)

output[1] = (vs * similarity[:, None]).sum(dim=0)
# vs[0, :] * sim[0] + vs[1, :] * sim[1] + vs[2, :] * sim[2]
# sim[2] is 0 to avoid cheating

# residual connection
output[1] += word_embedding[1, :]

output[1] = layer_norm(output[1])
```
##### [[Masked Multi Head Self Attention]]
[[Self Attention]] outputs meaning based on relevance of tokens
but [[Self Attention]] weights are fixed so relevance is constant, so multiple [[Self Attention]] heads 
are used to have more versatility and allow more perspectives in deciding what tokens are relevant
``` python
self_attention_blocks.forward(word_embedding[0, :])
```
-  [[Residual Connection]] for [[Self Attention]] output and word embedding + positional encoding output
-  [[Layer Normalization]]
- Grab the outputs of the decoder
- Pass it to [[Neural Network]], with input/output size of $d_{model}$ and inner layer dimensionality of $d_{ff}$
- [[Residual Connection]] for [[Neural Network]] output
- [[Layer Normalization]]
- Calculate Keys and Values and pass them to decoder
- In decoder calculate Queries using decoder outputs
- Now decoder has K, Q, V
- Use them to do [[Multi Head Self Attention]] with [[Residual Connection]] again
- [[Layer Normalization]]
- Pass it to [[Neural Network]]
- [[Residual Connection]] for [[Self Attention]] output and [[Neural Network]] output
- [[Layer Normalization]]
- Take these outputs and convert them back into tokens
- We do that by running the outputs to Linear Transformation
- That can be done using single layer [[Neural Network]] with no [[Activation Function]]
- Output will be probability for each word in the vocabulary
- Which we run through the [[Softmax]] function to get the final output
### Typical GPT Parameters
According to `torch.nn.TranformerDecoderLayer`
```python
d_model = 512 # word embedding size
nhead = 8
dim_feedforward = 2048 # d_model * 4
seq_len = 64 # context size
num_layers = 6
activation = 'relu' # or 'gelu'

# Derived from above
d_head = d_model / nhead = 64
d_kqv = d_head # key, query, value dim
# kqv.shape = (batch_size, nhead, seq_len, d_head)

# Optimizer
warmup_steps = 4096
lr = min(1 / step ** 0.5, step / warmup_steps ** 1.5) / d_model ** 0.5
torch.optim.Adam(params, lr, betas=(0.9, 0.98), epsilon=1e-9)  

layer = nn.TransformerDecoderLayer(d_model, nhead, dim_feedforward, batch_first=True)
transformer = nn.TransformerDecoder(layer, num_layers)
```

Apply Residual dropout to each sub layer before it is added to sub layer input and normalized, chance of dropout is $0.1$, also apply dropout to sums of embeddings + positional encodings in both encoder and decoder

Apply [[Label Smoothing]] with value ${\large\epsilon_{ls}}=0.1$

![[GPT Architecture.webp|400]]
![[GPT Translator Architecture.webp|600]]
![[Self Attention.webp]]
See [[GPT Code]]
