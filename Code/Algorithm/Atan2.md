``` python
def atan2(y, x): # range [-PI, PI]
    if x != 0: atan(y / x) + PI     * sign(y)
    else                     PI / 2 * sign(y)
```
