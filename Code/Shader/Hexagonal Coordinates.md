``` c
vec2 hex_uv(vec2 p) {
    vec4 hc = floor(vec4(p, p - vec2(0.5, 1) ) / vec2(1, 1.7320508).xyxy);
    vec4 h = p.xyxy - vec4(hc.xy + 0.5, hc.zw + 1.0) * vec2(1, 1.7320508).xyxy;   
    return dot(h.xy, h.xy) < dot(h.zw, h.zw) ? h.xy : h.zw;
}
vec4 hex_uv_id(vec2 uv) {    
    const vec2 s = vec2(1, 1.7320508);
    vec4 hex_id = floor(vec4(uv, uv - vec2(0.5, 1)) / s.xyxy) + 0.5;
    vec4 hex_uv = vec4(uv - hex_id.xy * s, uv - (hex_id.zw + 0.5) * s);
    return dot(hex_uv.xy, hex_uv.xy) < dot(hex_uv.zw, hex_uv.zw)
        ? vec4(hex_uv.xy, hex_id.xy) 
        : vec4(hex_uv.zw, hex_id.zw + 0.5);    
}
float hex_sdf(vec2 p) {    
    p = abs(p);
    return max(dot(p, vec2(0.5, 0.8660254)), p.x);
}
// SDF Hex grid
float d = hex_sdf(hex_uv(uv));
```
