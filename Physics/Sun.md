### Time
- **Local Solar Time** where `12:00` is highest point of the sun
- **Local Standard Time Meridian** `15 * GMT_offset` degree offset from GMT meridian
- **Equation of Time** `9.87 * sin(2B) - 7.53 * cos(B) - 1.5 * sin(B)` 
  where `B = 360 / 365 * (d - 81)` and `d` is days since `1st Jan`
  corrects time by accounting for earth's axial tilt and orbit eccentricity `in minutes`
- **Time Correction Factor** `4 * (longitude - lstm) + eot) / 60` 
  `local_solar_time = local_time + time_correction` `in hours`
- **Culmination** when sun is highest `or zenith is closest to 0`
  `culmination = 12 - time_correction`
- **Sunrise** `sunrise = culmination - 12 / PI * arccos(tan(-latitude) * tan(declination))`
- **Sunset** `sunset = culmination + 12 / PI * arccos(tan(-latitude) * tan(declination))`
### Angles
- **Hour Angle** `local_solar_time` to angle which sun moved from noon 
  `hour_angle = PI / 12 * (local_solar_time - 12)`
- **Declination** equator-sun
- **Elevation** ground-sun
- **Zenith** up-sun `PI / 2 - elevation`
- **Azimuth** north-sun `a if hour_angle < 0 else TAU - a`
  where `y = latitude, x = declination` and
  `a = arcsin(sin(x) * sin(y) + cos(x) * cos(y) * cos(hour_angle))`
### Other
- **Shadow Length** `cot(elevation)`
- **Sun Radius** `696,340km`
- **Earth Distance** `149,597,870 km (varying)`
- **Rainbow** happens when elevation is `42°` and when air has droplets
