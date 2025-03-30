- `max(abs(dpdx(sdf)), abs(dpdy(sdf)))` sharper [[SDF]] antialiasing
### Text
``` rust
// from my render engine
var r = 1.0 - 2.0 * textureSample(atlas, atlas_sampler, p).r;
let pd = vec3f(dpdx(p.x), dpdy(p.y), 0.0);
var px = textureSample(atlas, atlas_sampler, p + pd.xz).r;
var py = textureSample(atlas, atlas_sampler, p + pd.zy).r;
var nx = textureSample(atlas, atlas_sampler, p - pd.xz).r;
var ny = textureSample(atlas, atlas_sampler, p - pd.zy).r;
var d = max(abs(px - nx), abs(py - ny));
// stroke stuff
let strk = select(saturate((r + in.stroke_width * 0.28) / d), 0.0, in.stroke_width < 0.001);
var col = mix(in.color, in.stroke_color, strk);

let edge = saturate(1.0 - r / d);
col.a *= edge;
```
