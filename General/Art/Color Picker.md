---
aliases:
- HSL
- HSV
- HSI
- HSY
- Hue
- Saturation
- Value
- Lightness
- Intensity
- Luminance
---

``` python
def Value():
    if 'HSL': lightness = (min(r,g,b) + max(r,g,b)) / 2
    if 'HSV': value     = max(r,g,b)
    if 'HSI': intensity = (r + g + b) / 3
    if 'HSY': luma      = r * 0.299 + g * 0.587 + b * 0.114

# same for all 4
def Hue():
  M = max(r,g,b)
  m = min(r,g,b) 
  C = M - m # chroma

  if C == 0: H = 0
  if M == r: H = (g - b) / C % 6
  if M == g: H = (b - r) / C + 2
  if M == b: H = (r - g) / C + 4
  H /= 6 
  
def Saturation():
    if 'HSL': S = C / (1 - abs(2 * L - 1))   if L != [0, 1]  else 0 
    if 'HSV': S = C / V                      if V != 0       else 0 
    if 'HSI': S = 1 - m / I                  if I != 0       else 0
    if 'HSY': S = C
```