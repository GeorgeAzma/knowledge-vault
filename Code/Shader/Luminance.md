``` c
float luma(vec3 c) { // ITU BT.709
  return dot(c, vec3(0.2126, 0.7152, 0.0722));
}
float luma(vec3 c) { // ITU BT.601
  return dot(c, vec3(0.299, 0.587, 0.114));
}
```
