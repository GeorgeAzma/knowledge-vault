### $Ax=b$
- [[Gaussian Elemination]] small/medium dense systems
- [[LU Decomposition]] useful for solving for multiple $b$ without recalculation
- [[Cholesky Decomposition]] faster [[LU Decomposition]] when $A$ is [[Symmetric Matrix|Symmetric]] [[Positive Definite Matrix]] `SPD`
- [[QR Decomposition]] numerically stable, useful for least squares $\min\limits_X||Ax-b||$
- [[Singular Value Decomposition]] robust
### Iterative Methods
- [[Gradient Descent]] slow but general 
- [[Conjugate Gradient]] for [[Symmetric Matrix|symmetric]] [[Positive Definite Matrix|positive definite matrices]] fast and memory efficient
- [[Newton's Method]] $X_{k+1}=X_k-H^{-1}\nabla f$ where $H=\nabla^2 f$ [[Laplacian]]