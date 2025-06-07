NN takes 3 possible inputs `[a, b, c]` 
if you want to pass single possibility like `c` to the NN
you can pass it's index $2$ but that's not normalized
so instead use one hot encoding like `[0, 0, 1]`
> [!tip] You usually want softer version of this so use [[Softmax]]
