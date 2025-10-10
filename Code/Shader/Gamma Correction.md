- eyes are more sensitive to change in dark values 
  `perceived_brightness ~= pow(linear_brightness, 1 / 2.2)`
- colors are stored as [[sRGB]] `sRGB = pow(col, 1 / 2.2)` for more precision for dark values
- monitor applies `pow(sRGB ^ 2.2)` to correct stored values
- but sometimes values aren't `sRGB (e.g. light calcs)`
  so final light needs to be converted to [[sRGB]] `pow(light, 1 / 2.2)`
- textures/colors are `sRGB` for light calcs they must be linear `pow(tex, 2.2)`

`[linear_rgb] -> encode -> [srgb] -> monitor decodes -> [linear_displayed_rgb]`
> [!note] `vec3(1)` looks `~2x` as bright as `vec3(0.5)`
> since eye perceives `pow(linear_brightness, 1 / 2.2)` 
> and monitor applies `pow(vec3(0.5), 2.2)`
> these two cancel out, so brightness change is linearly perceived
