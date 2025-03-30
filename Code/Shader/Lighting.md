### Lambert Diffuse
``` c
float diff = max(0.0, dot(normal, to_light));
```
### Phong Specular
``` c
vec3 reflected = reflect(-to_light, norm);
float spec = pow(max(0.0, dot(reflected, to_eye)), shine); // shine = 32.0
```
**Gouraud** model is same as phong but done in vertex shader
### Blinn-Phong `halfway`
``` c
vec3 half = normalize(to_light + to_eye);
float spec = pow(max(0.0, dot(normal, halfway)), shine); // shine = 16.0
```
