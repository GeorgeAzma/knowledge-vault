learnopengl.com/PBR/Theory
learnopengl.com/PBR/Lighting
youtu.be/KkOkx0FiHDA
- Approximate amount of light going to camera
  by statistically averaging amount of light going
  from each microfacet to the camera
  For that we need 3 functions
	- **Normal Distribution Function** `NDF, D in DFG`
	  Approximates percentage of microfacets 
	  exactly facing halfway vector,
	  Trowbridge-Reitz GGX formula
	  $NDF_{GGXTR}(n,h,\alpha)=\large\frac{\alpha^2}{\pi((n\cdot h)(\alpha^2-1)+1)^2}$
	```c
	  float distribution_ggx(float ndh, float roughness) { 
		  ndh = max(ndh, 0.0); 
		  float denom = ndh * ndh * (roughness * roughness - 1.0) + 1.0; 
		  return roughness * roughness / (denom * denom * PI); 
	  }
	```
	- **Geometry Function** `G in DFG`
	  Some rough microfacets shadow others
	  and some block path towards the camera
	  this function approximates that,
	  Schlick-GGX formula
	  $G_{SchlickGGX}(n,v,k)=\large\frac{n\cdot v}{(n\cdot v)(1-k)+k}$
	  - $k$ roughness mapping $k_{direct}=\frac{(\alpha+1)^2}{8}$, $k_{IBL}=\frac{\alpha^2}{2}$ 
	  ``` c
		float geometry_schlick_ggx(float ndv, float k) {
			return ndv / (ndv * (1.0 - k) + k); 
		}
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
	  vec3 fresnel_schlick(vec3 f0, float hdv) { 
	      return f0 + (1.0 - f0) * pow(clamp(1.0 - hdv, 0.0, 1.0), 5.0); 
      }
	  ```
	- Calculate `f0`, which is surface [[Reflection#Reflectance and Transmittance|reflectance]] when looking directly at it
	  typically $0.04$ for non-metal dielectrics
	``` c
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
        
        vec3 ks = fresnel_schlick(max(dot(halfway, view_dir), 0.0), f0);
        vec3 kd = vec3(1) - ks;
        kd *= 1.0 - metallic;	
        
        // cook-torrance brdf
        float ndf = distribution_ggx(normal, halfway, roughness);        
        float geometry = geometry_smith(normal, view_dir, light_dir, roughness);        
        
        float denom = 4.0 * max(dot(normal, view_dir), 0.0) * max(dot(normal, light_dir), 0.0) + 0.0001;
        vec3 specular = ndf * geometry * ks / denom;  
            
        // add to outgoing radiance Lo
        float ndl = max(dot(normal, light_dir), 0.0);             
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

### Disney PBR
- Calculate Diffuse
``` c
float f90 = 0.5 + 2.0 * (roughness * cos^2(theta_d))
float fdiffuse = mix(1.0, f90, dot(normal, light_dir)) * mix(1.0, f90, view_dir)
fdiffuse = fdiffuse / PI * albedo
```
- Calculate Sub-Surface Scattering
``` c
float ss90 = roughness * cos^2(theta_d);
float ndl = dot(normal, light_dir);
float ndv = dot(normal, view_dir);
float ss = mix(1.0, ss90, pow(1.0 - ndl, 5.0));
ss *= mix(1.0, ss90, pow(1.0 - ndv, 5.0));
ss = 1.25 * (ss * (1.0 / (ndl + ndv) - 0.5) + 0.5);
```
- Calculate Sheen
``` c
float fsheen = pow(1.0 - cos\theta_d, 5.0);
fdiffuse = albedo * mix(fd, ss, subsurface) + fsheen;
```
- Calculate Anisotropic GGX
### Disney Code
``` c
float sq(float x) { return x * x; }

float distribution_ggx1(float ndh, float a) {
	if (a >= 1.0) return 1.0 / PI;
	float t = 1.0 + (a * a - 1.0) * ndh * ndh;
	return (a * a - 1.0) / (PI * log(a * a) * t);
}	  

float distribution_ggx(vec3 normal, vec3 halfway, float roughness) { 
	float ndh = max(dot(normal, halfway), 0.0); 
	float denom = ndh * ndh * (roughness * roughness - 1.0) + 1.0; 
	return roughness * roughness / (denom * denom * PI); 
}

float distribution_ggx_aniso(float ndh, float hdx, float hdy, float ax, float ay) {
	return 1.0 / (PI * ax * ay * sq(sq(hdx / ax) + sq(hdy / ay) + ndh * ndh));
}

float smithg_ggx(float ndv, float alphag) {
	float a = alphag * alphag;
	float b = ndv * ndv;
	return 1.0 / (ndv + sqrt(a + b - a * b));
}

float smithg_ggx_aniso(float ndv, float vdx, float vdy, vec2 roughness) {
	return 1.0 / (ndv + sqrt(sq(vdx * roughness.x) + sq(vdy * roughness.y) + sq(ndv)));
}

float3 brdf(vec3 light_dir, vec3 view_dir, vec3 normal, vec3 tangent, vec3 binormal)
{
	float ndl = max(dot(normal, light_dir), 0.0);
	float ndv = max(dot(normal, view_dir), 0.0);

	vec3 halfway = normalize(light_dir + view_dir);
	float ndh = max(dot(normal, halfway), 0.0);
	float ldh = max(dot(light_dir, halfway), 0.0);

	vec3 cdlin = pow(base_color, vec3(2.2));
	float cdlum = 0.3 * cdlin.r + 0.6 * cdlin.g + 0.1 * cdlin.b;

	vec3 ctint = cdlum > 0.0 ? cdlin / cdlum : vec3(1); // normalize lum to isolate hue+sat
	vec3 cspec0 = mix(specular * 0.08 * mix(vec3(1), ctint, specular_tint), cdlin, metallic);
	vec3 csheen = mix(vec3(1), ctint, sheen_tint);

	// Diffuse fresnel - go from 1 at normal incidence to 0.5 at grazing
	// and lerp in diffuse retro-reflection based on roughness
	float fl = fresnel_schlick(ndl), fv = fresnel_schlick(ndv);
	float fd90 = 0.5 + 2.0 * ldh * ldh * roughness;
	float fd = mix(1.0, fd90, FL) * mix(1.0, fd90, fv);

	// Based on Hanrahan-Krueger brdf approximation of isotropic bssrdf
	// 1.25 scale is used to (roughly) preserve albedo
	// Fss90 used to "flatten" retroreflection based on roughness
	float ss90 = ldh * ldh * roughness;
	float ss = lerp(1.0, ss90, fl) * mix(1.0, ss90, fv);
	ss = 1.25 * (ss * (1.0 / (ndl + ndv) - 0.5) + 0.5);

	// specular
	float aspect = sqrt(1.0 - anisotropic * 0.9);
	vec2 roughness = max(vec2(0.001), sq(roughness) * vec2(1.0 / aspect, aspect));
	float ds = distribution_ggx_aniso(NdotH, dot(halfway, tangent), dot(halfway, binormal), roughness);
	float fh = fresnel_schlick(ldh);
	vec3 fs = mix(cspec0, vec3(1), fh);
	float gs  = smithg_ggx_aniso(ndl, dot(light_dir, tangent), dot(light_dir, binormal), ax, ay);
	gs *= smithg_ggx_aniso(ndv, dot(view_dir, tangent), dot(view_dir, binormal), ax, ay);

	// sheen
	vec3 fsheen = fh * sheen * csheen;

	// clearcoat (ior = 1.5 -> F0 = 0.04)
	float dr = distribution_ggx1(ndh, mix(0.1, 0.001, clearcoat_gloss));
	float fr = mix(0.04, 1.0, fh);
	float gr = smithg_ggx(ndl, 0.25) * smithg_ggx(ndv, 0.25);

	return (mix(fd, ss, subsurface) * cdlin / PI + fsheen) * (1.0 - metallic) + gs * fs * ds + 0.25 * clearcoat * gr * fr * Dr;
}
```
