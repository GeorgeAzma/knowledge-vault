Approximates percentage of microfacets facing halfway vector `normalize(L + V)`
Trowbridge-Reitz GGX formula $NDF_{GGXTR}(n,h,\alpha)=\dfrac{\alpha^2}{\pi((n\cdot h)(\alpha^2-1)+1)^2}$
```c
  float distribution_ggx(float ndh, float roughness) { 
      ndh = max(ndh, 0.0); 
      float denom = ndh * ndh * (roughness * roughness - 1.0) + 1.0; 
      return roughness * roughness / (denom * denom * PI); 
  }
```