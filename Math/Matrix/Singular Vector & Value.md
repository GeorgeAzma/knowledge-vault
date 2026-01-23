### $S_L=AA^T$
### $S_R=A^TA$
- [[Eigenvector]][[s]] of $S_L,S_R$ are Left/Right Singular Vectors of $A$
- Square root of [[Eigenvalue]][[s]] of $S_L,S_R$ are Left/Right Singular Values of $A$
If you sort Singular Values of $S_L,S_R$ by descending order
Their values are going to be identical
> [!note] 
> If $S_L$ dimension is higher then $S_R$ or vice-versa
> Then there is going to be leftover/unmatched
> sorted singular values and they are always 0

When you multiply every vector on unit circle by a matrix $A$, the circle gets distorted into an ellipse

- **Singular Values ($\sigma_i$)** These represent the lengths of the semi-axes of the resulting ellipse. They tell you how much the transformation "stretched" or "squashed" the space along specific directions
    
- **Right-Singular Vectors ($v_i$)** These are the specific orthogonal directions in the original space that will end up being the axes of the ellipse after the transformation
    
- **Left-Singular Vectors ($u_i$):** These are the orthogonal directions in the output space that the axes of the ellipse actually point toward