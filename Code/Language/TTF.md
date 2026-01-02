learn.microsoft.com/en-us/typography/opentype/spec/otff#font-tables
### Tables
- **head** `em units, global bounding box`
- **loca** `offsets of all tables`
- **maxp** `num of glyphs`
- **glyf** `per glyph: points, contour end idxs, bounding box`
- **hhea** `ascent/descent, line gap, num of advance widths in hmtx`
- **hmtx** `per glyph: advance width, left side bearing`
- **cmap** `maps unicode chars to glyph indices`
- **kern** `kerning space between 2 glyph pairs`
  `if format is 1 use GPOS instead`
- **GPOS** more modern/advanced **kern** alternative
- **vhea/vmtx** `same as hhea/hmtx for vertical fonts`
- **post** `italic angle, underline pos, underline thickness, is monospace`
- **OS/2** `subscript/superscript x/y off/size (recommended)`
- **GSUB** glyph substitution, like vscode ext that substitutes `>=` with $\Rightarrow$

> [!note] FreeType has different namings
> - `horiBearingX` equivalent to glyph's `left_side_bearing`
> - `horiBearingY` equivalent to glyph's `y_max`
