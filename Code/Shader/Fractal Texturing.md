``` c
# fractal texturing for infinite zoom detail
vec4 fractal_tex_mip(sampler2D tex, vec2 uv, float depth) {
	float lod = log2(depth);
	float lodi = floor(lod);
    float e = exp2(-lodi);
	vec2 uv1 = uv * e * 2.0;
	vec2 uv2 = uv * e;
	vec2 uv3 = uv * e * 0.5;
    vec2 dx = dFdx(uv) / depth;
    vec2 dy = dFdy(uv) / depth;
	vec4 tex0 = textureGrad(tex, uv1, dx, dy);
	vec4 tex1 = textureGrad(tex, uv2, dx, dy);
	vec4 tex2 = textureGrad(tex, uv3, dx, dy);
	return (tex1 + mix(tex0, tex2, lod - lodi)) * 0.5;
}
```
