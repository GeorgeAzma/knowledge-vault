---
aliases:
  - PBR
  - BSDF
  - BRDF
  - BTDF
---
### Definitions
- $\omega_i$ incoming/incident light direction
- $\omega_o$ outgoing light direction `typically towards camera/view` $v$
- $n$ surface normal
- $h=\dfrac{\omega_i+\omega_o}{|\omega_i+\omega_o|}$ halfway vector
- $L_i(\omega_i)$ incoming [[Light Units#Energetic|radiance]]
- $L_o(\omega_o)$ outgoing [[Light Units#Energetic|radiance]]
- $E_i$ incoming [[Light Units#Energetic|irradiance]]
### BSDF $f_s(\omega_i,\omega_o)=\dfrac{dL_o(\omega_o)}{dE_i(\omega_i)}=f_r(\omega_i,\omega_o)+f_t(\omega_i,\omega_o)$
Bidirectional Scattering distribution function
### BRDF $L_o(\omega_o)=\int_{\Omega^+}f_r(\omega_i,\omega_o)~L_i(\omega_i)~(n\cdot\omega_i)~d\omega_i$
Bidirectional reflectance distribution function, ratio of outgoing [[Light Units|radiance]] and incoming [[Light Units|irradiance]]
- $\Omega^+=\set{\omega_i\in\mathbb{S}^2\mid n\cdot\omega_i>0}$ `directions above surface (relative to surface normal)`
### BTDF $L_o(\omega_o)=\int_{\Omega^-}f_t(\omega_i,\omega_o)~L_i(\omega_i)~|n\cdot\omega_i|~d\omega_i$
Biderectional transmittance distribution function, handles transmission of light through a surface `refraction, absorption`
- $\Omega^-=\set{\omega_i\in\mathbb{S}^2\mid n\cdot\omega_i<0}$ `directions below surface (relative to surface normal)`
### [[Normal Distribution Function]] `NDF, D in DFG`

### [[Geometry Function]] `G in DFG`
### [[Fresnel Equation]] `F in DFG`
- $k_d,k_s$ [[Refraction|Refractance]]/[[Reflection|Reflectance]] $k_d=1-k_s$

### Calculations $f_{cook-torrance}=\dfrac{DGF}{4(n\cdot\omega_o)(n\cdot\omega_i)}$
- Diffuse lighting $f_{lambert}=\dfrac{c}{\pi}$ `c is albedo`
- Specular lighting
### Code `Cook-Torrance`
``` c
void main() {
    vec3 view_dir = normalize(camera_pos - world_pos);

    vec3 f0 = vec3(0.04); 
    f0 = mix(f0, albedo, metallic);
	           
    // reflectance equation
    vec3 lighting = vec3(0.0);
    for(int i = 0; i < 4; ++i) {
        // calculate per-light radiance
        vec3 light_dir = normalize(light_pos[i] - world_pos);
        vec3 halfway = normalize(view_dir + light_dir);
        float distance = length(light_pos[i] - world_pos);
        float attenuation = 1.0 / (distance * distance);
        vec3 radiance = light_col[i] * attenuation;        

        float hdv = max(dot(halfway, view_dir), 0.0);
        vec3 ks = fresnel_schlick(hdv, f0);
        vec3 kd = vec3(1) - ks;
        kd *= 1.0 - metallic;	
        
        // cook-torrance brdf
        float ndf = distribution_ggx(normal, halfway, roughness);        
        float geometry = geometry_smith(normal, view_dir, light_dir, roughness);        
        
        float ndl = max(dot(normal, light_dir), 0.0);
        float ndv = max(dot(normal, view_dir), 0.0);
        float denom = 4.0 * ndv * ndl + 1e-4; // specular energy conservation
        vec3 specular = ndf * geometry * ks / denom;  
            
        // add to outgoing radiance Lo            
        lighting += (kd * albedo / PI + specular) * radiance * ndl; 
    }   
  
    vec3 ambient = vec3(0.03) * albedo * ao;
    vec3 color = ambient + lighting;
	
    color = color / (color + 1.0);
    color = pow(color, vec3(1.0 / 2.2));
   
    gl_FragColor = vec4(color, 1.0);
}  
```
> [!warning] Make sure to convert albedo from `sRGB` to `linear`
> don't convert metallic/roughness maps (and usually AO maps)
### [[Disney PBR]]
### Resources
- https://learnopengl.com/PBR/Theory
- https://learnopengl.com/PBR/Lighting
- https://youtu.be/KkOkx0FiHDA
