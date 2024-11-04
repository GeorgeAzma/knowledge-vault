### Render
- (round) rectangles + circles
- rotation/scale/translation
- color + gradient
- transparency
- sharp text
- texture
- (inner) shadow/glow/outline (issgo)
- blur + custom processing shader based on id
- custom polygons
- custom shaders
### Techniques
- **Batch Rendering** for round rectangles/custom polygons
  `Vertex { pos: f3, col: f4, uv: f2, id: ui } 10b`  
- **Texture Atlas** with rectangle packing `8k no rotation`
- **FBO** shadow/glow/blur/outline calculation
   - Jump flood for SDF, use it to calculate above 
    in FBO which gets added to final frame
- **Text** textured quads `ClearType?` or sdf/msdf/mtsdf
- **SSBO** storing data for each id
  `SSBO { outline_width, outline_edge, blur }`
  `outline_edge allows for outer shadow/glow`
  `negative outline_width is inner shadow`
  `blur id's using blur value`
- **Blur** 2 pass gaussian unless no blurs are rendered
  `if determining that has overhead, just blur always, or when user tells to`
- **Primitives** precomputed rounded primitives
### Problems
- Determining issgbo color and amount in jump flooding:
  maybe spread id of closest pixel and use that id to lookup color from ssbo
  and apply effects if pixel is close enough specified by id's amount
- Transparency between instanced/batched primitives and in general
  - Sorting and z-index 
- Custom shaders might be expensive
- Batching is slower than instancing, but allows for gradients + control
- Antialiasing `msaa might be slow`
- Gradient outline or texture outline `and for text too`
- Rotation/Translation/Scale/Coloring/UV/IDs have extra overhead for batching
### Renderer Details
##### Global Variables
- **Position** adds position to batch vertices
- **Rotation** rotates batch around it's center
- **Scale** scales batch positions outwards from center
##### Functions
- `rect(x, y, w, h)`
- `round_rect(x, y, w, h, r)`
- `circle(x, y, r)`
- `line(x1, y1, x2, y2, w)`
- `round_line(x1, y1, x2, y2, w, r)`
- `msaa_on()` `msaa_off()` `default: on`
- `vsync_on()` `vsync_off()` `default: off`
### Current Approach
### Pros
- Fast
- Easy
### Cons
- can't do gradients `somewhat solve via mat4`
- can't do complex shapes `somewhat solve via many simple shapes`
- can't do (inner) shadow/glow
- can't blur
- mediocre text
- can't do custom shaders
- can't do id processing shaders
- mediocre antialiasing
- mediocre transparency
- no custom uvs
