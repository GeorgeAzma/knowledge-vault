glossy gradient loop
``` c
float d = -iTime;
float a = 0.0;
for (float i = 0.0; i < 8.0; ++i) {
    a += sin(cos(a * uv.y + d - uv.y) + d - uv.y);
    d += cos(uv.x - a);
}
d += iTime;


float d = 0.0, a = 0.5, b = 0.8;
for (float i = 0.0; i < 8.0; ++i) {
    a += cos(u_time + cos(b) - cos(d * 0.8) - a * uv.x * 0.6);
    d += sin(u_time + uv.y - b * 0.7 - a);
    b += sin(u_time - uv.y * 1.2 + sin(uv.x * 1.4 + d * 0.9));
}
```
cool smoke like thing
``` c
float hash12(vec2 p) {
	vec3 p3 = fract(p.xyx / 0.1031);
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

vec2 flow(vec2 p) {
    for(float i = 0.0; i < 4.0; ++i) {
        p += dot(p, p) * vec2(-p.y, p.x) * fbm(p * 4.0, 4);
    }

    return p;
}

void main() {
    float uvd = 2.0 / min(u_resolution.x, u_resolution.y);
    vec2 uv = (gl_FragCoord.xy - u_resolution * 0.5) * uvd;
    
    float l = length(uv);
    float h = exp(-(1.0 - l * l) * 16.0);
    h *= smoothstep(1.0, 1.0 - uvd * 1.5, l);

    uv = flow(uv);
    float x = exp(-distance(uv, vec2(0.5)) * 8.0);

    fragColor = vec4(vec3(x), 1);
}
```
glistening Orb
``` c
float hash12(vec2 p) {
	vec3 p3 = fract(p.xyx / 0.1031);
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

vec2 flow(vec2 p) {
    float l = sqrt(length(p));
    for(float i = 0.0; i < 4.0; ++i) {
        p += l * vec2(-p.y, p.x) * (sin(1.0 / (1.0 - l * 0.5) * 16.0) * 0.5 + 0.5);
    }

    return p*p*p;
}

void main() {
    float uvd = 2.0 / min(u_resolution.x, u_resolution.y);
    vec2 uv = (gl_FragCoord.xy - u_resolution * 0.5) * uvd;
    
    float l = length(uv);
    float h = exp(-(1.0 - l * l) * 16.0);
    h *= smoothstep(1.0, 1.0 - uvd * 1.5, l);

    uv = flow(uv);
    float x = 0.0;
    x += exp(-distance(uv, vec2(0.5)) * 8.0);
    x += exp(-distance(uv, vec2(-0.5)) * 8.0);
    x += exp(-distance(uv, vec2(0.1)) * 12.0);

    fragColor = vec4(vec3(x), 1);
}
```
