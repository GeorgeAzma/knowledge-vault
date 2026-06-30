Some rough microfacets shadow others and some block path towards the camera
this function approximates light percentage towards camera that is not blocked
Schlick-GGX formula $G_{SchlickGGX}(n,v,k)=\dfrac{n\cdot v}{(n\cdot v)(1-k)+k}$
- $k$ roughness mapping $k_\text{direct}=\dfrac{(\alpha+1)^2}{8},\quad k_\text{IBL}=\dfrac{\alpha^2}{2}$ 
``` c
float geometry_schlick_ggx(float ndv, float k) {
    return ndv / (ndv * (1.0 - k) + k); 
}
// intuition
// ndv / (ndv * (1 - 0) + 0) = ndv / ndv = 1 (k = 0, no roughness, no shadowing)
// ndv / (ndv * (1 - 1) + 1) = ndv (k = 1, rough)
```

Combine geometry shadowing and geometry obstruction
  $G(n,v,l,k)=G_{SchlickGGX}(n,v,k)G_{SchlickGGX}(n,l,k)$
``` c
  float geometry_smith(float ndv, float ndl, float k) {
    float ggx1 = geometry_schlick_ggx(max(ndv, 0.0), k); 
    float ggx2 = geometry_schlick_ggx(max(ndl, 0.0), k);
    return ggx1 * ggx2; 
  }
```
