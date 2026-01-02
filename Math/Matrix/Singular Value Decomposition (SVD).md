Breaks down matrix multiplication into simple `rotation, stretch, rotation`
- 1st matrix resets initial rotation, to align matrix columns/vectors to [[Standard Basis Vector]][[s]]
- 2nd matrix scales along [[Standard Basis Vector]][[s]]
  `since matrix is unrotated, this scales without distortion`
- 3rd matrix applies final rotation
and 3rd matrix applies final rotation
![[SVD Visualization.webp|350]]
### Formula $A=U\Sigma V^T$
- $U$ Normalized [[Singular Vector & Value|Left Singular Vectors]] of $A$
- $\Sigma$ [[Diagonal Matrix]] of [[Singular Vector & Value|Singular Values]] $\sigma_n$
- $V^T$ Normalized [[Singular Vector & Value|Right Singular Vectors]] of $A$
- $A^TA=(U\Sigma V^T)^T(U\Sigma V^T)=V\Sigma^T U^TU\Sigma V^T=U\Sigma^2 V^T$ 
  since $U$ is [[Orthogonal Matrix]] $U^TU=U^{-1}U=I$ so it cancels out
> [!note] 
> - $Dim(A)=Dim(\Sigma)$
> - $U,V^T$ are [[Orthogonal Matrix|Orthogonal Matrices]]
> - $\Sigma$ [[Singular Vector & Value|Singular Values]] are descending order
> -  $U,V$ [[Singular Vector & Value|Singular Vectors]] are descending order by their [[Eigenvector]][[s]] to match [[Singular Vector & Value|Singular Values]] of $\Sigma$
youtu.be/vSczTbgc8Rc
### Steps
- $V^T$ is [[Orthogonal Matrix]], meaning it applies rotation, but transpose of [[Orthogonal Matrix]] is its [[Inverse|Inverse]] so it actually reverses the rotation, aligning rotated vector to [[Standard Basis Vector|Standard Basis]]
- $\Sigma$ stretches that vector and since it's aligned to [[Standard Basis Vector|Standard Basis]] it doesn't distort it in any way
> [!note] $\Sigma$ might shrink some dimensions to 0, lowering dimensionality it can also add dimensions
- $U$ Rotates the stretched matrix to final rotation
