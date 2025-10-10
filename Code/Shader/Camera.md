``` c
bokeh_blur = smoothstep(0.22, 0.18, length(uv))

# makes vector face camera
vec3 lookat(vec3 eye, vec3 v) {
    vec3 f = normalize(eye);
    vec3 s = normalize(vec3(-f.z, 0, f.x));
    return v * mat3(s, cross(s, f), -f);
}

# dir to pix from FOV
normalize(vec3(uv, tan((PI - radians(fov)) * 0.5)))
# dir to pix from focal length
normalize(vec3(uv / focal_length, 1))
# dir to pix from diopter
normalize(vec3(uv * diopter, 1))
```
