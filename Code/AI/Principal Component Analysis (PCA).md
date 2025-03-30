Lowers dimensionality of data
### How to Calculate
- Standardize data `subtract mean, divide by standard deviation`
- Calculate [[Covariance Matrix]]
- Compute [[Eigen Vector]][[s]] and [[Eigen Value]][[s]]
- Rank Principal Components by importance a.k.a [[Eigen Value]][[s]]
- Retain only Top $N$ (usually 2D-3D) most important PCs
- Project data onto Principal Components
```python
# Step 1: Standardize the data
def standardize_data(X):
    mean = calculate_mean(X)
    std_dev = calculate_std_dev(X)
    standardized_X = (X - mean) / std_dev
    return standardized_X

# Step 2: Calculate the covariance matrix
def calculate_covariance_matrix(standardized_X):
    covariance_matrix = np.cov(standardized_X.T)
    return covariance_matrix

# Step 3: Compute eigenvectors and eigenvalues
def compute_eigenvectors(covariance_matrix):
    eigenvalues, eigenvectors = np.linalg.eig(covariance_matrix)
    return eigenvalues, eigenvectors

# Step 4: Select principal components
# Sort eigenvalues in descending order and select top k eigenvectors
def select_principal_components(eigenvalues, eigenvectors, k):
    sorted_indices = np.argsort(eigenvalues)[::-1]
    top_k_indices = sorted_indices[:k]
    principal_components = eigenvectors[:, top_k_indices]
    return principal_components

# Step 5: Project data onto principal components
# Transform the data onto the new feature space defined by the principal components
def project_onto_components(standardized_X, principal_components):
    projected_data = np.dot(standardized_X, principal_components)
    return projected_data

# Example usage:
# Assuming X is your dataset, n_samples x m_features
standardized_data = standardize_data(X)
cov_matrix = calculate_covariance_matrix(standardized_data)
eigenvals, eigenvecs = compute_eigenvectors(cov_matrix)
principal_comps = select_principal_components(eigenvals, eigenvecs, k=2)
projected_data = project_onto_components(standardized_data, principal_comps)

```
### Resource youtu.be/FgakZw6K1QQ
This also gives better intuition for [[Eigen Vector]][[s]] at 12:30
#### Related [[Singular Value Decomposition (SVD)]]

> [!example] Can be used in machine learning, to reduce dimensionality of input data, e.g. if it has 2D points as an input,
> these points maybe correlated (e.g. $p=(x,y)=(x,2x+noise)$),
> in this case you can remove $y$ dimension for performance,
> then project point onto a lower dimensional point
> $p_n=\begin{bmatrix}1&0\\2&0\end{bmatrix}p$
> $p_n=(x,2x)$

