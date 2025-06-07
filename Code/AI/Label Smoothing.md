Instead of having a [[One Hot Encoding|one hot vector]] with hard 0 and 1 values you can use label smoothing with $\epsilon=0.1$ parameter which will convert the vector to `[0.1, 0.1, 0.9, 0.1]`.
