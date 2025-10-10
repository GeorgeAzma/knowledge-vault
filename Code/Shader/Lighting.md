### Lambert Diffuse
``` python
float diff = max(0.0, dot(normal, to_light));
```
### Phong Specular
``` python
vec3 reflected = reflect(-to_light, norm);
float spec = pow(max(0.0, dot(reflected, to_eye)), shine); # shine = 32
```
**Gouraud** model is same as phong but done in vertex shader
### Blinn-Phong `halfway`
``` python
vec3 halfway = normalize(to_light + to_eye);
float spec = pow(max(0.0, dot(normal, halfway)), shine); # shine = 16
```
### Other
``` python
# Sphere Normals
vec3(uv, -sqrt(1 - dot(uv, uv)))
# AO (untested)
albedo * exp2(2 - pow(max(0, 1 - mp(pos + norm * ao_radius).x / ao_radius), 2));
# 2D Fresnel-like Halo
smoothstep(1.02, 0.98, dot(uv, uv)) * pow(dot(uv, uv), 8) 
# Emit Light (gamma correct)
light = 0.01 / dist
light = pow(max(0, 1 - dist * falloff), 2)
light = exp(-falloff * dist)

vec3 to_cam = normalize(camera_pos - world_pos);
float fresnel = pow(1 - max(0.0, dot(to_cam, normal)), power);

# Vignette UV01
pow(uv.x * (1 - uv.y) * uv.y * (1 - uv.x) * 15, 0.25)

# Glossy Sphere Effect
#   - Generate sphere normals
#	- Divide normal xy by z (for magnification effect)
#	- Generate 2D fbm with sphere normals
#	- Smoothstep high end of the fbm
#	- Add smoothstepped value to initial color
#   - multiply by sphere/circle mask `d`
col += smoothstep(0.6, 1, fbm(n.xy * 3 / (1 + n.z), 2)) * d;
```
