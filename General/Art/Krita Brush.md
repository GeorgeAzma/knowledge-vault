### Sensors
- **Pressure** pen pressure
- **PressureIn** increasing pen pressure only, `[10%, 40%, 20%, 50%] => [10%, 40%, 40%, 50%]` 
- **Tangential Pressure** some pens have 0-1 touch sensor on the side
- **Drawing Angle** stroke movement direction
- **X-tilt** pen tilt in X direction
- **Y-tilt** pen tilt in Y direction
- **Tilt-direction** pen tilt direction `-180° to 180°`
- **Rotation** pen rotation `along pen axis, rarely supported`
- **Fuzzy Dab** per dub random noise
- **Fuzzy Stroke** per stroke random noise
- **Speed** stroke speed
- **Fade** stroke distance `in brush size relative units`
- **Distance** stroke distance `in pixels`
- **Time** stroking time `^_-`
- **Perspective** distance in perspective `needs perspective assistant`
**Curves Calculation Mode** `multiply/add/max/min/difference`
### Pixel Engine
- **Size**
- **Ratio** `1 = circle, <1 = streched horizontally`
- **Spacing** dab spacing
- **Mirror** horizontal/vertical flip amount
- **Softness** dab edge feathering
- **Sharpness** dab fade slope `like smoothstep`
- **Scatter** offset dabs randomly `or with pattern` around main stroke path
