``` python
# modeled after redmi note 9 photo adjustment
  'exposure' col * exp2(exposure)
'brightness' pow(col, vec3(exp2(-brightness)))
  'contrast' (col - 0.5) * contrast + 0.5
 'lightness' mix(col, vec3(1), lightness * (1.0 - dot(color, vec3(0.299, 0.587, 0.114))))
'saturation' mix(dot(col, vec3(0.2126, 0.7152, 0.0722)).xxx, col, 1.0 + saturation)
  'vibrance' mix(col, avg.xxx, (dot(col, vec3(1.0 / 3.0)) - max(col.r, max(col.g, col.b))) * vibrance)
    'warmth' mix(col, mix(cool, warm, warmth), abs(warmth))
      'tint' color + vec3(tint, -tint, tint)
'highlights' mix(col, min(col * (1.0 + highlights), 1.0), step(0.5, col))
    'levels' pow((col - in_black) / (in_white - in_black), gamma) * (out_white - out_black) + out_black
```
