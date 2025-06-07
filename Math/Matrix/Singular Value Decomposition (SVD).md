Breaks down matrix multiplication into simple (rotation, stretch, rotation)
![[SVD Visualization.webp|350]]
### Formula $A=U\Sigma V^T$
- $U$ Normalized [[Singular Vector & Value|Left Singular Vectors]] of $A$
- $\Sigma$ [[Diagonal Matrix]] of [[Singular Vector & Value|Singular Values]] $\sigma_n$
- $V^T$ Normalized [[Singular Vector & Value|Right Singular Vectors]] of $A$
> [!note] 
> - $Dim(A)=Dim(\Sigma)$
> - $U,V^T$ are [[Orthogonal Matrix|Orthogonal Matrices]]
> - $\Sigma$ [[Singular Vector & Value|Singular Values]] are descending order
> -  $U,V$ [[Singular Vector & Value|Singular Vectors]] are descending order by their [[Eigen Vector]][[s]] to match [[Singular Vector & Value|Singular Values]] of $\Sigma$
youtu.be/vSczTbgc8Rc
### Steps
- $V^T$ is [[Orthogonal Matrix]], meaning it applies rotation, but transpose of [[Orthogonal Matrix]] is its [[Matrix Inverse|Inverse]] so it actually reverses the rotation, aligning rotated vector to [[Standard Basis Vector|Standard Basis]]
- $\Sigma$ stretches that vector and since it's aligned to [[Standard Basis Vector|Standard Basis]] it doesn't distort it in any way
> [!note] $\Sigma$ might shrink some dimensions to 0, lowering dimensionality it can also add dimensions
- $U$ Rotates the stretched matrix to final rotation
