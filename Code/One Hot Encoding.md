## Example `(c from [a, b, c]) = [0, 0, 1]`:
- You have 3 possible inputs `[a, b, c]`
- You want to pass `c` as an input to the neural network
- You could pass index of `c` to the NN but they don't unnormalized inputs
- So Instead you pass One Hot Encoded vector \[0, 0, 1\]
- Which is vector of length 3, with all zeros except 1 where `c` is

> [!note] If you want softer version of this see: [[Softmax]]
