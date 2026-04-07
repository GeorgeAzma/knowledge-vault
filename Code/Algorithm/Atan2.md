``` python
def atan2(y, x): # range [-PI, PI]
    if x != 0:
        return atan(y / x) + (x < 0) * (PI if y >= 0 else -PI)
    return PI / 2 * sign(y)
```
