## How it works
- Do [[Word Embedding]] + [[Positional Encoding]] to get $d_{model}$ sized input vector for a token
- Do that for all tokens to get input matrix with size of $d_{vocab}$
- Have Matrices $k_w,q_w,v_w$, which contain Weights for Keys, Queries, Values for each input
- Size of $k_w,q_w$ rows is $d_k$ and size of $v_w$ is $d_v$
- Have bias vector $k_b,q_b,v_b$ with same dimensions
- Iterate over all input vectors in the input matrix
- Multiply them with vectors $k_w,q_w,v_w$ of same index
- Add to them bias vectors $k_b,q_b,v_b$ of same index
- That will get you $k,q,v$ matrices
	- Dot product 1st input's query vector and it's key vector 
	  to get the score for 1st input and optionally divide the score by $\sqrt{d_{k}}$ 
	- Dot product 1st input's query vector and 2nd input's key vector 
	  to get the score for 2nd vector and optionally divide the score by $\sqrt{d_{k}}$ 
	- Do the same for remaining vectors
	- That will get you the score vector for each of the inputs
	- Map scores using [[Softmax]] function
	- For each input get the value vector $v$
	- Multiply all of it's element by the score of the current input
	- That will get you $d_k$ sized multiplied output for each input
	- Sum the multiplied values element-wise
	- That will get you $d_k$ sized final output vector
	- Repeat these steps for each input's query vector to get output for each of the inputs
> [!note]
> You can make k, q, v weights using `nn.Linear(vocab_size, d_k or d_v, bias=False)`
