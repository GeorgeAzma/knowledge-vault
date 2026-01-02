``` c
cmake_minimum_required(VERSION 4.21)

project(Project LANGUAGES C CXX)

add_executable(app)

target_sources(app src/main.cpp)

target_include_directories(app PRIVATE include)
target_compile_definitions(app PRIVATE FOO)
```
