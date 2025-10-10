learnopengl.com/PBR/Theory
learnopengl.com/PBR/Lighting
youtu.be/KkOkx0FiHDA
- Average amount of light reflected from microfacets to camera
  For that we need 3 functions
	- **Normal Distribution Function** `NDF, D in DFG`
	  Approximates percentage of microfacets facing halfway vector
	  Trowbridge-Reitz GGX formula $NDF_{GGXTR}(n,h,\alpha)=\large\frac{\alpha^2}{\pi((n\cdot h)(\alpha^2-1)+1)^2}$
	```c
	  float distribution_ggx(float ndh, float roughness) { 
		  ndh = max(ndh, 0.0); 
		  float denom = ndh * ndh * (roughness * roughness - 1.0) + 1.0; 
		  return roughness * roughness / (denom * denom * PI); 
	  }
	```
	- **Geometry Function** `G in DFG`
	  Some rough microfacets shadow others and some block path towards the camera
	  this function approximates light percentage towards camera that is not blocked
	  Schlick-GGX formula $G_{SchlickGGX}(n,v,k)=\large\frac{n\cdot v}{(n\cdot v)(1-k)+k}$
	  - $k$ roughness mapping $k_{direct}=\frac{(\alpha+1)^2}{8}$, $k_{IBL}=\frac{\alpha^2}{2}$ 
	  ``` c
		float geometry_schlick_ggx(float ndv, float k) {
			return ndv / (ndv * (1.0 - k) + k); 
		}
        // intuition
        // ndv/(ndv*(1-0)+0) = ndv/ndv = 1 (k=0, no roughness, no shadowing)
        // ndv/(ndv*(1-1)+1) = ndv (k=1, rough)
		```
	- Now combine geometry shadowing and geometry obstruction
	  $G(n,v,l,k)=G_{SchlickGGX}(n,v,k)G_{SchlickGGX}(n,l,k)$
	  ``` c
	    float geometry_smith(float ndv, float ndl, float k) {
			float ggx1 = geometry_schlick_ggx(max(ndv, 0.0), k); 
			float ggx2 = geometry_schlick_ggx(max(ndl, 0.0), k);
			return ggx1 * ggx2; 
	    }
		```
	- **Fresnel Equation** `F in DFG`
	  Percentage of [[Reflection|reflected]] vs [[Refraction|refracted]] [[Light]] at different angles
	  using fresnel schlick approximation, see [[Reflection]] for more info
	 ``` c
      // for dielectric (note: RGB are same for dielectric)
	  vec3 fresnel_schlick(vec3 f0, float hdv) { 
	      return f0 + (1.0 - f0) * pow(1.0 - hdv, 5.0); 
      }
	  ```
	- Calculate `f0`, which is surface [[Reflection#Reflectance and Transmittance|reflectance]] when looking directly at it
	  typically $0.04$ for non-metal dielectrics
	``` c
        // note: this is approx, metallic fresnel term is complex
		vec3 f0 = mix(vec3(0.04), albedo, metallic);
		vec3 f = fresnel_schlick(dot(halfway, view_dir), f0);
	```
- Calculate lighting $f_r=k_df_\text{lambert}+k_sf_\text{cook-torrance}$
- $k_d,k_s$ [[Refraction|Refractance]]/[[Reflection|Reflectance]] $k_d=1-k_s$
- Diffuse lighting $f_{lambert}=\frac{c}\pi$ `c is albedo`
- Specular lighting $f_{cook-torrance}=\huge\frac{DFG}{4(\omega_o\cdot n)(\omega_i\cdot n)}$
### Code
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
        vec3 radiance     = light_col[i] * attenuation;        

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
