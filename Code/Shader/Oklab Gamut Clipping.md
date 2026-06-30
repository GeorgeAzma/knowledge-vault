https://bottosson.github.io/posts/gamutclipping/
``` c
// a,b (normalized)
vec2 gamut_cusp(vec2 ab) {
    float a = ab.x;
    float b = ab.y;
    vec3 w;
    float k0, k1, k2, k3, k4;
    if (-1.88170328 * a - 0.80936493 * b > 1.0)
        k0 = 1.19086277, k1 = 1.76576728, k2 = 0.59662641, k3 = 0.75515197, k4 = 0.56771245, w = vec3(4.0767416621, -3.3077115913, 0.2309699292);      
    else if (1.81444104 * a - 1.19445276 * b > 1.0)
        k0 = 0.73956515, k1 = -0.45954404, k2 = 0.08285427, k3 = 0.12541070, k4 = 0.14503204, w = vec3(-1.2684380046, 2.6097574011, -0.3413193965);
    else
        k0 = 1.35733652, k1 = -0.00915799, k2 = -1.15130210, k3 = -0.50559606, k4 = 0.00692167, w = vec3(-0.0041960863, -0.7034186147, 1.7076147010);

    float s = k0 + k1 * a + k2 * b + k3 * a * a + k4 * a * b;

    vec3 k_lms = a * vec3(0.3963377774, -0.1055613458, -0.0894841775) + 
                 b * vec3(0.2158037573, -0.0638541728, -1.2914855480); 

    // Halley's method
    for (int i = 0; i < 3; ++i) {
        vec3 lms = 1.0 + s * k_lms;
        vec3 lms_ds = 3.0 * k_lms * lms * lms;
        vec3 lms_ds2 = 6.0 * k_lms * k_lms * lms;
        float f = dot(w, lms * lms * lms);
        float f1 = dot(w, lms_ds);
        float f2 = dot(w, lms_ds2);
        s -= f * f1 / (f1 * f1 - 0.5 * f * f2);
    }
    
    vec3 lms = 1.0 + s * k_lms;
    lms *= lms * lms;
    
    vec3 rgb = lms * mat3( 4.0767416621, -3.3077115913,  0.2309699292,
                          -1.2684380046,  2.6097574011, -0.3413193965,
                          -0.0041960863, -0.7034186147,  1.7076147010);
    float max_ch = max(rgb.r, max(rgb.g, rgb.b));
    
    float l_cusp = 1.0 / pow(max_ch, 1.0 / 3.0);
    float c_cusp = s * l_cusp;

    return vec2(l_cusp, c_cusp);
}

float find_gamut_intersection(vec2 ab, float L1, float C1, float L0) {
    float a = ab.x;
    float b = ab.y;
	// find the cusp of the gamut triangle
	vec2 cusp = gamut_cusp(ab);

	// find the intersection for upper and lower half seprately
	float t;
	if ((L1 - L0) * cusp.y - (cusp.x - L0) * C1 <= 0.0) // lower half
		t = cusp.y * L0 / (C1 * cusp.x + cusp.y * (L0 - L1));
	else { // upper half
		// first intersect with triangle
		t = cusp.y * (L0 - 1.0) / (C1 * (cusp.x - 1.0) + cusp.y * (L0 - L1));

		float dL = L1 - L0;
		float dC = C1;
		vec3 k_lms = vec3(+0.3963377774 * a + 0.2158037573 * b,
                          -0.1055613458 * a - 0.0638541728 * b,
                          -0.0894841775 * a - 1.2914855480 * b);
		vec3 lms_dt = dL + dC * k_lms;
        
		// Halley's method
        for (int i = 0; i < 3; ++i) {
			float L = L0 * (1.0 - t) + t * L1;
			float C = t * C1;
			vec3 lms_ = L + C * k_lms;
			vec3 lms = lms_ * lms_ * lms_;
			vec3 lmsdt = 3.0 * lms_dt * lms_ * lms_;
			vec3 lmsdt2 = 6.0 * lms_dt * lms_dt * lms_;
			vec3 rgb0 = vec3(dot(lms, vec3(4.0767416621, -3.3077115913, 0.2309699292)) - 1.0,
			                 dot(lms, vec3(-1.2684380046, 2.6097574011, -0.3413193965)) - 1.0,
			                 dot(lms, vec3(-0.0041960863, -0.7034186147, 1.7076147010)) - 1.0);
			vec3 rgb1 = vec3(dot(lmsdt, vec3(4.0767416621, -3.3077115913, 0.2309699292)),
			                 dot(lmsdt, vec3(-1.2684380046, 2.6097574011, -0.3413193965)),
			                 dot(lmsdt, vec3(-0.0041960863, -0.7034186147, 1.7076147010)));
			vec3 rgb2 = vec3(dot(lmsdt2, vec3(4.0767416621, -3.3077115913, 0.2309699292)),
			                 dot(lmsdt2, vec3(-1.2684380046, 2.6097574011, -0.3413193965)),
			                 dot(lmsdt2, vec3(-0.0041960863, -0.7034186147, 1.7076147010)));
			vec3 u_rgb = rgb1 / (rgb1 * rgb1 - 0.5 * rgb0 * rgb2);
            vec3 t_rgb = -rgb0 * u_rgb;
			t_rgb = mix(vec3(1e6), t_rgb, step(-1e-6, u_rgb));
			t += min(t_rgb.r, min(t_rgb.g, t_rgb.b));
		}
	}

	return t;
}

vec3 gamut_clip_preserve_chroma(vec3 rgb) {
	if (all(lessThan(rgb, vec3(1))) && all(greaterThan(rgb, vec3(0))))
		return rgb;
	vec3 lab = rgb2oklab(rgb);
	float c = max(1e-6, length(lab.yz));
	vec2 ab = lab.yz / c;
	float l0 = clamp(lab.x, 0.0, 1.0);
	float t = find_gamut_intersection(ab, lab.x, c, l0);
	return oklab2rgb(vec3(mix(l0, lab.x, t), t * c * ab));
}
```