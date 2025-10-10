``` c
gray = dot(color, vec3(0.2126, 0.7152, 0.0722)) // Rec.709
gray = dot(color, vec3(0.299, 0.587, 0.114)) // Rec.601 (old TVs)
gray = dot(color, vec3(0.2627, 0.6780, 0.0593)) // Rec.2020 (wide-gamut displays)
```
