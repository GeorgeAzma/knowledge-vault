### Render
- [x] (round) rectangles + circles
- [x] rotation/scale/translation
- [x] color
- gradient
- [x] colored outline
- gradient outline
- texture outline
- [x] transparency
- sharp text
- texture
- (inner) shadow/glow/outline + blur `issgob`
- custom filter shader based on object id
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
### Ideas
- store object ID + object containing bounding box in RGBA32
- Determining ISSGBO color and amount in jump flooding:
  maybe spread id of closest pixel and use that id to lookup color from ssbo
  and apply effects if pixel is close enough specified by id's amount
##### Functions
- [x] `rect(x, y, w, h)`
- [x] `round_rect(x, y, w, h, r)`
- [x] `circle(x, y, r)`
- [x] `line(x1, y1, x2, y2, w)`
- [x] `round_line(x1, y1, x2, y2, w, r)`
- `msaa_on()` `msaa_off()` `default: on`
- `vsync_on()` `vsync_off()` `default: off`
