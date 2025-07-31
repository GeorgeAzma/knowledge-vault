GPU algorithm used for generating [[SDF]] and voronoi diagrams
youtu.be/-lEeBwNdfw4
``` c
// # How it works
// pixels are uv coordinates or (-1, -1) if mask is 0
// 1. set initial mask that you want to generate sdf from
// 2. look at moore neighbor uv values 2^n pixels outwards from current pixel
//    (note set n such that 2^n is bigger then image max resolution, like 2048)
//  - set curr pix's uv to closest neighbor's stored uv
//    (or don't change if curr pix's value is closest)
// 3. repeat this next frame looking out by 2^(n-1) pixels, until 2^n == 1
// this gives super close approximation of mask's sdf
// and offset uv from closest mask pixel.

// [!notes]
// - you can also do interior sdf (useful for strokes)
// - JFA (jump flood algorithm) works backwards too 
//   e.g. 2^0 to 2^n step size, but is slower that way

void mainImage(out vec4 fragColor, vec2 fragCoord) {
    float mr = min(iResolution.x, iResolution.y);

    // Set initial mask on 0th Frame
    if (iFrame == 0) {
        vec2 uv = (fragCoord * 2.0 - iResolution.xy) / mr;
        float l = length(uv) + sin(atan(uv.y, uv.x) * 4.0) * 0.1;
        float d = max(step(0.0, 0.4 - l), step(0.0, l - 0.6));
        uv = fragCoord / iResolution.xy;
        fragColor = d > 0.5 ? vec4(-1, -1, uv) : vec4(uv, -1, -1);
        return;
    }

	// Jump Flood Algorithm (JFA)
    int n = int(ceil(log2(max(iResolution.x, iResolution.y))));
    if (iFrame >= 1 && iFrame <= n) {
        int step_size = 1 << max(0, n - iFrame);
        vec3 best_point_dist_exter = vec3(1e6);
        vec3 best_point_dist_inter = vec3(1e6);
        vec2 uv = fragCoord / iResolution.xy;
        for (int x = -1; x <= 1; ++x) {
            for (int y = -1; y <= 1; ++y) {
                vec4 point_exter_inter = texelFetch(iChannel0, ivec2(fragCoord) + ivec2(x, y) * step_size, 0);
                if (point_exter_inter.x > 0.0) {
                    float dist = distance(point_exter_inter.xy, uv);
                    if (dist < best_point_dist_exter.z) {
                        best_point_dist_exter = vec3(point_exter_inter.xy, dist);
                    }
                }
                if (point_exter_inter.z > 0.0) {
                    float dist = distance(point_exter_inter.zw, uv);
                    if (dist < best_point_dist_inter.z) {
                        best_point_dist_inter = vec3(point_exter_inter.zw, dist);
                    }
                }
            }
        }
        fragColor = vec4(best_point_dist_exter.xy, best_point_dist_inter.xy);
        return;
    }
    fragColor = texelFetch(iChannel0, ivec2(fragCoord), 0);
}

// stroke_distance = max(distance(exter, uv), distance(inter, uv));
// sdf = distance(exter, uv) - distance(inter, uv);
```
