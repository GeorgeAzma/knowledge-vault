### Shader
``` c
#version 450

layout(location = 0) in vec3 position;
layout(location = 1) in vec3 size;

layout(set = 0, location = 0) out vec3 color;

void main() {
    color = vec3(1.0, 1.0, 1.0);
}

############### SPIR-V #################
OpCapability Shader
%1 = OpExtInstImport "GLSL.std.450"
OpMemoryModel Logical GLSL450
OpEntryPoint Vertex %2 "main" %3 %4 %5 %6 %7
OpSource GLSL 450
OpName %2 "main"
OpName %3 "position"
OpName %4 "size"
OpName %5 "color"
OpName %6 "gl_VertexID"
OpName %7 "gl_InstanceID"
OpDecorate %3 Location 0
OpDecorate %4 Location 1
OpDecorate %5 Location 0
OpDecorate %5 DescriptorSet 0
OpDecorate %6 BuiltIn VertexId
OpDecorate %7 BuiltIn InstanceId
%8 = OpTypeVoid // void
%9 = OpTypeFunction %8 // () -> void
%10 = OpTypeFloat 32 // f32
%11 = OpTypeVector %10 3 // vec3<f32>
%12 = OpTypePointer Output %11 // out *vec3<f32>
%5 = OpVariable %12 Output // out color: out *vec3<f32>
%13 = OpConstant %10 1 // const %13: f32 = 1;
%9 = OpConstantComposite %11 %13 %13 %13 // vec3<f32>(1.0, 1.0, 1.0)
%14 = OpTypePointer Input %11 // in *vec3<f32>
%3 = OpVariable %14 Input // in position: in *vec3<f32>
%4 = OpVariable %14 Input // in size: in *vec3<f32>
%15 = OpTypeInt 32 1 // i32, 1 = signed
%16 = OpTypePointer Input %15 // in *i32
%6 = OpVariable %16 Input // in gl_VertexID: in *i32 
%7 = OpVariable %16 Input // in gl_InstanceID: in *i32 
// () -> void, None = no modifiers (inline, const...)
// opens fn scope, next instructions must be 
// OpFunctionParameter (if any) and OpLabel (entry block)
%2 = OpFunction %8 None %9 // main: () -> void {
      OpStore %5 %9        //     *color = vec3<f32>(1.0, 1.0, 1.0)
      OpReturn             //     return;
      OpFunctionEnd        // }
```
### Uniform Block
``` c
layout(std140, binding = 0) uniform Camera {
    mat4 view;
    mat4 proj;
} camera;

############### SPIR-V #################
OpName %1 "Camera"
OpMemberName %1 0 "view"
OpMemberName %1 1 "proj"
OpName %2 "camera"

# std140 based offsets/strides
OpMemberDecorate %1 0 ColMajor
OpMemberDecorate %1 0 Offset 0
OpMemberDecorate %1 0 MatrixStride 16
OpMemberDecorate %1 1 ColMajor
OpMemberDecorate %1 1 Offset 64
OpMemberDecorate %1 1 MatrixStride 16

OpDecorate %1 Block
OpDecorate %2 Binding 0 // layout(binding = 0)


%3 = OpTypeFloat 32 // f32
%4 = OpTypeVector %3 4 // vec4<f32>
%5 = OpTypeMatrix %4 4 // mat4<vec4<f32>>
%1 = OpTypeStruct %8 %8 // Camera: struct { mat4, mat4 }
%6 = OpTypePointer Uniform %1 // uniform *Camera
%2 = OpVariable %6 Uniform // camera: uniform *Camera
```
