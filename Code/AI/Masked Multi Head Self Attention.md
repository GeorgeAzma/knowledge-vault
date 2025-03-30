Masked Multi Head Attention is same as [[Multi Head Self Attention]]
Except that you add mask matrix to the scores before applying [[Softmax]] to them,
Which has lower triangle all 0s and upper triangle all $-\infty$
This will make so that self attention does not know what will come next
After current token, so it can't cheat.
This is only required for decoder, since we don't care about encoder cheating
in fact it's better, since it will have fuller understanding of the sentence
