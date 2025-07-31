[[Neural Network]] node that connects to itself.
It receives an input which is a single value from a sequence and it generates output and hidden values, hidden values are remembered
Then we go to the next sequence value, we receive previous hidden values (weighted and biased) and add it to current node's input.
This will again generate new output and hidden values and cycle repeats till we went through all values of a sequence.

RNN can have multiple hidden nodes
![[RNN.webp]]
More hidden nodes you have, more pathways there are to affect another sequence value

You an also stack RNN's
