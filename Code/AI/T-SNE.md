reduces dimensionality of the data such that similar samples are clustered together
useful for visualizing high dimensional data grouped into similar clusters
though clusters themselves are not distributed in a meaningful way unlike
### Algorithm
``` python
# 1. Compute pairwise distances between samples in high-D
for i in 0..N-1:
    for j in 0..N-1:
        if j != i:
            dist[i][j] = ||X[i] - X[j]||^2

# 2. Convert distances to conditional probabilities p_j|i
for i in 0..N-1:
    sigma_i = find_sigma(dist[i], perplexity)  # binary search for perplexity
    for j in 0..N-1:
        if j != i:
            p_j_given_i[j] = exp(-dist[i][j] / (2*sigma_i^2))
    p_j_given_i /= sum(p_j_given_i) if j != i # normalize sum(p_j_given_i) = 1


# 3. Symmetrize to get joint probabilities p_ij
for i in 0..N-1:
    for j in 0..N-1:
        if j != i:
            p_ij = (p_j_given_i + p_i_given_j) / (2 * N)

# 4. Initialize low-D embedding Y randomly (D = 2)
for i in 0..N-1:
    Y[i] = [random_uniform(-0.5, 0.5), random_uniform(-0.5, 0.5)]


# 5. Compute low-D similarities q_ij
def compute_q(Y):
    sum_num = 0
    for i in 0..N-1:
        for j in 0..N-1:
            if j != i:
                num[i][j] = 1 / (1 + ||Y[i] - Y[j]||^2)   # Student-t kernel
    q_ij = num / sum(num) if j != i # normalize sum(q_ij) = 1
    return q_ij

# 6. Gradient descent to minimize KL divergence
for iter in 1..n_iter:
    q_ij = compute_q(Y)
    for i in 0..N-1:
        grad[i] = 0
        for j in 0..N-1, j != i:
            grad[i] += 4 * (p_ij - q_ij) * (Y[i] - Y[j]) * (1 + ||Y[i]-Y[j]||^2)^(-1)
    # Update embedding positions
    for i in 0..N-1:
        Y[i] += learning_rate * grad[i]

# 7. Return low-D points Y
return Y
```