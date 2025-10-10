
| Type | Perceptual <br>Accuracy |                   Formula                   |
| :--: | :---------------------: | :-----------------------------------------: |
| HSL  |           bad           | `lightness = (min(r,g,b) + max(r,g,b)) / 2` |
| HSV  |           bad           |            `value = max(r,g,b)`             |
| HSI  |           meh           |        `intensity = (r + g + b) / 3`        |
| HSY  |          best           |  `luma = dot(rgb, (0.299, 0.587, 0.114))`   |
