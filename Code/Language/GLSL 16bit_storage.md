``` c
#extension GL_EXT_shader_16bit_storage : enable
layout(std430, binding=0) buffer SB16 {
    float16_t a;      // 2B, pad 6B
    f16vec3 b;        // 6B, pad 2B
    f16vec4 c;        // 8B
};
```
