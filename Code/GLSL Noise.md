---
aliases:
  - Hash
  - FBM
  - Voronoi
  - Worley
---
```c
/////////////// 2D //////////////
float hash12(vec2 p) {
	vec3 p3 = fract(p.xyx * 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

float noise(vec2 p) {
	vec2 i = floor(p);
	vec2 f = p - i;
	f *= f * (3.0 - 2.0 * f);
	float res = mix(
		mix(hash12(i), hash12(i + vec2(1, 0)), f.x),
		mix(hash12(i + vec2(0, 1)), hash12(i + vec2(1)), f.x), f.y);
	return res;	
}
/////////////// FBM ///////////////
float fbm(vec2 p, int octaves) {
	float s = 0.0, m = 0.0, a = 1.0;
	for(int i = 0; i < octaves; i++) {
		s += a * noise(p);
		m += a;
		a *= 0.5;
		p *= mat2(1.6, 1.2, -1.2, 1.6);
	}
	return s / m;
}
/////////////// 1D ///////////////
float hash11(float p) {
    p = fract(p * 0.1031);
    p *= p + 33.33;
    return fract(p * p * 2.0);
}

float noise(float p) {
	float i = floor(p);
	return mix(hash11(i), hash11(i + 1.0), p - i);
}
// "f *= f * (3.0 - 2.0 * f)" is smoothstep(0, 1, f)
// Remove for slight performance and linear look
// Rotate fbm noise for no grid bias: 
// p *= mat2(cos(0.5), sin(0.5), -sin(0.5), cos(0.5));
// p *= mat2(.877, .479, -.479, .877);
// Make it swirly
// p += vec2(cos(s * 6.0));
// 3D rot
// mat3(0, 1.6, 1.2, -1.6, 0.72,-0.96, -1.2,-0.96, 1.28)

/////////////// Hashes ///////////////
// Hash without sine
float hash11(float p) {
    p = fract(p * 0.1031);
    p *= p + 33.33;
    return fract(p * p * 2.0);
}
float hash12(vec2 p) {
	vec3 p3 = fract(p.xyx * 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

// Sin Hash (x1.5-x2 speed) but unreliable
float hash11(float p) {
	return fract(sin(p) * 43758.5453);
}
float hash12(vec2 p) {
	return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}
vec2 hash22(vec2 p) {
	return fract(sin(p) * 43758.5453);
}

//////// Simplex 2D ////////
vec2 hash22(vec2 p) {
	vec3 p3 = fract(p.xyx * vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float noise(vec2 p) {
	vec2 i = floor(p + (p.x + p.y) * 0.366025);
    vec2 a = p - i + (i.x + i.y) * 0.211324;
    float m = step(a.y, a.x); 
    vec2 o = vec2(m, 1.0 - m);
    vec2 b = a - o + 0.211324;
	vec2 c = a - 0.577351;
    vec3 h = max(0.5 - vec3(dot(a, a), dot(b, b), dot(c, c)), 0.0);
	vec3 n = h * h * h * h * 
        vec3(dot(a, hash22(i) - 0.5), 
             dot(b, hash22(i + o) - 0.5), 
             dot(c, hash22(i + 1.0) - 0.5));
    return dot(n, vec3(70)) + 0.5;
}

//////// Worley 2D ////////
vec2 hash22(vec2 p) {
	vec3 p3 = fract(p.xyx * vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float worley(vec2 x) {
    vec2 p = floor(x);
    vec2 f = x - p;
	float va = 1.0;
    for(int j = -1; j <= 1; j++) 
    for(int i = -1; i <= 1; i++) {
        vec2 g = vec2(i, j);
		vec2 r = g - f + hash22(p + g);
		va = min(dot(r, r), va);
    }
    return va;
}

//////// Voronoi 2D ////////
// s is edge smoothness 
// Note: if using low s, you can decrease for loop range
vec3 hash32(vec2 p) {
	vec3 p3 = fract(p.xyx * vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yxz + 33.33);
    return fract((p3.xxy + p3.yzz) * p3.zyx);
}

float voronoise(vec2 x, float s) {
    vec2 p = floor(x);
    vec2 f = x - p;
	float k = 1.0 + 63.0 * pow(1.0 - s, 4.0);
	float va = 0.0;
	float wt = 0.0;
    for(int j = -2; j <= 2; j++)
    for(int i = -2; i <= 2; i++) {
        vec2 g = vec2(i, j);
		vec3 o = hash32(p + g);
		vec2 r = g - f + o.xy;
		float d = dot(r, r);
		float ww = pow(1.0 - smoothstep(0.0, 1.414213562373, sqrt(d)), k);
		va += o.z * ww;
		wt += ww;
    }
    return va / wt;
}

//////// Blue 2D ////////
float bluenoise(vec2 p) {
    float v = 0.0;
    for (int k = 0; k < 9; k++)
        v += hash12(p + vec2(k % 3 - 1, k / 3 - 1));
    return 0.9 * (1.125 * hash12(p) - v / 8.0) + 0.5;
}

/////////////// 3D /////////////////
vec4 perm(vec4 x) { x *= x * 34.0 + 1.0; return x - floor(x / 289.0) * 289.0; }

float noise(vec3 p) {
    vec3 a = floor(p);
    vec3 d = p - a;
    d *= d * (3.0 - 2.0 * d);
    vec4 b = a.xxyy + vec4(0, 1, 0, 1);
    vec4 k1 = perm(b.xyxy);
    vec4 k2 = perm(k1.xyxy + b.zzww) + a.zzzz;
    vec4 k3 = perm(k2);
    vec4 k4 = perm(k2 + 1.0);
    vec4 o1 = fract(k3 * 0.02439024);
    vec4 o2 = fract(k4 * 0.02439024);
    vec4 o3 = mix(o1, o2, d.z);
    vec2 o4 = mix(o3.xz, o3.yw, d.x);
    return mix(o4.x, o4.y, d.y);
}


vec3 hash33(vec3 p) {
	p = fract(p * vec3(.1031, .1030, .0973));
    p += dot(p, p.yxz + 33.33);
    return fract((p.xxy + p.yxx) * p.zyx) - 0.5;
}

float simplex3d(vec3 p) {
	 vec3 s = floor(p + dot(p, vec3(1.0 / 3.0)));
	 vec3 x = p - s + dot(s, vec3(1.0 / 6.0));
	 vec3 e = step(vec3(0), x - x.yzx);
	 vec3 i1 = e * (1.0 - e.zxy);
	 vec3 i2 = 1.0 - e.zxy * (1.0 - e);
	 vec3 x1 = x - i1 + 1.0 / 6.0;
	 vec3 x2 = x - i2 + 1.0 / 3.0;
	 vec3 x3 = x - 0.5;
	 vec4 w, d;
	 w.x = dot(x, x);
	 w.y = dot(x1, x1);
	 w.z = dot(x2, x2);
	 w.w = dot(x3, x3);
	 w = max(0.6 - w, 0.0);
	 d.x = dot(hash33(s), x);
	 d.y = dot(hash33(s + i1), x1);
	 d.z = dot(hash33(s + i2), x2);
	 d.w = dot(hash33(s + 1.0), x3);
	 w *= w;
	 w *= w;
	 d *= w;
	 return dot(d, vec4(52));
}
```
### Extra
``` c
//// Worm Like 2D
// Note: "f = f * f * (3.0 - 2.0 * f)" is smoothstep(0, 1, f)
// Less linear looking, remove for slight performance
float worm_noise(vec2 p) {
    const float kF = 12.0;
    vec2 i = floor(p);
	vec2 f = p - i;
    f *= f * (3.0 - 2.0 * f);
    return mix(mix(sin(kF * dot(p, hash22(i + vec2(0, 0)))),
               	   sin(kF * dot(p, hash22(i + vec2(1, 0)))), f.x),
               mix(sin(kF * dot(p, hash22(i + vec2(0, 1)))),
               	   sin(kF * dot(p, hash22(i + vec2(1, 1)))), f.x), f.y);
}

float worms(vec2 p) {
    const mat2 m = mat2(1.6, 1.2, -1.2, 1.6);
    float f = 0.0;
    f += 0.4 * worm_noise(p); p = m * p;
    f += 0.3 * worm_noise(p); p = m * p;
    f += 0.2 * worm_noise(p); p = m * p;
    f += 0.1 * worm_noise(p); p = m * p;
    return f;
}

//// Fabric Like 2D
float noise(vec2 p) {
    return smoothstep(-0.5, 0.9, sin((p.x - p.y) * 555.0) * sin(p.y * 1444.0)) - 0.4;
}

float fabric(vec2 p) {
    const mat2 m = mat2(1.6, 1.2, -1.2, 1.6);
    float f = 0.0;
    f += 0.4 * noise(p); p = m * p;
    f += 0.3 * noise(p); p = m * p;
    f += 0.2 * noise(p); p = m * p;
    f += 0.1 * noise(p);
    return f;
}


//// Tillable 2D
float noise(vec2 p, float scale) {
	p *= scale;
	vec2 f = fract(p);
    p = floor(p);
    f *= f * (3.0 - 2.0 * f);
    return mix(mix(hash12(p, scale),
			       hash12(p + vec2(1, 0), scale), f.x),
			   mix(hash12(p + vec2(0, 1), scale),
			       hash12(p + vec2(1, 1), scale), f.x), f.y);
}

//// Crater 3D
float crater_noise(vec3 x) {
    vec3 p = floor(x);
    vec3 f = x - p;
    float va = 0.;
    float wt = 0.;
    for (int i = -2; i <= 2; i++) 
        for (int j = -2; j <= 2; j++) 
            for (int k = -2; k <= 2; k++) {
                vec3 g = vec3(i,j,k);
                vec3 o = 0.8 * hash33(p + g);
                float d = distance(f - g, o);
                float w = exp(-4. * d);
                va += w * sin(2.*PI * sqrt(d));
                wt += w;
            }
    return abs(va / wt);
}

//// Crater 2D
float crater_noise(vec2 p, float scale) {
	p *= scale;
    vec2 f = fract(p);
    p = floor(p);
    float va = 0.;
    float wt = 0.;
    for (int i = -2; i <= 2; i++) 
        for (int j = -2; j <= 2; j++) {
                vec2 g = vec2(i, j);
                vec2 o = hash22(p + g, scale);
                float d = distance(f - g, o);
                float w = exp(-4. * d);
                va += w * sin(TAU * sqrt(max(d, 0.06)));
                wt += w;
            }
    return abs(va / wt);
}

float crater_fbm(vec3 x) {
    float craters = crater_noise(x * 1.5) * 0.8 + crater_noise(x * 4.0) * 0.5 + crater_noise(x * 11.0) * 0.3;
    return exp(-craters);
}

// Fuzz / Scratch Map 
float scratch(vec2 uv, float f) {
    vec2 seed = floor(uv);
    uv -= seed;
    seed.x = floor(sin(seed.x * 51024.0) * 3104.0);
    seed.y = floor(sin(seed.y * 1324.0) * 554.0);
 
    uv = uv * 2.0 - 1.0;
    uv = uv * cos(seed.x + seed.y) + vec2(-uv.y, uv.x) * sin(seed.x + seed.y);
    uv += sin(seed.x - seed.y);
    uv = uv * 0.5 + 0.5;
    
    const float WAVYNESS = 0.1;
    float s = (sin(seed.x + uv.y * 3.1415) + sin(seed.y + uv.y * 3.1415)) * WAVYNESS;
    
    float x = abs(uv.x - 0.5 + s);
    x = 0.5 - x * f;
    x = smoothstep(-2.0, fwidth(x) * 1.5 + 16.0, x) * 12.0;
    x *= uv.y;
    
    return x;
}

float scratches(vec2 uv) {
    float scratches = 0.0;
    float f = 1.0 / length(fwidth(uv));
    for(int i = 0; i < 5; ++i) {
        float x = scratch(uv, f);
    	scratches = max(scratches, x);
        uv = uv * mat2(1.0, 0.7, -0.7, 1.0) - 12.31;
    }
    return scratches;
}
```
