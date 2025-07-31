``` c
// Wetness: Amount of surface that is wet
// Porosity: Porous surfaces darken more, can use roughness instead
// Note: Wetness/Porosity can be a texture mask
// Note: Normals point up if there is 98% wetness, because of water pools
color = mix(color, color * color, clamp(wetness, 0.0, 0.35) * porosity);
roughness = mix(roughness, 0.1, clamp(wetness, 0.2, 1.0));
specular = mix(specular, 0.25, clamp(wetness, 0.25, 0.5));
ao = mix(ao, 1.0, clamp(wetness, 0.45, 0.95));
normal_ts = mix(normal_ts, vec2(0.5), clamp(wetness, 0.45, 0.95));
vertex_normal_ws = normalize(mix(vertex_normal_ws, vec3(0, 1, 0), clamp(wetness, 0.98, 1.0)))
```
