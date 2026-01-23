`CMakeLists.txt`
``` c
cmake_minimum_required(VERSION 4.21)

project(Project LANGUAGES C CXX)

add_executable(app)

target_sources(app src/main.cpp)

target_include_directories(app PRIVATE include)
target_compile_definitions(app PRIVATE FOO)
```
### Setup
- Install CMake and add Environment Variables
``` bash
winget install Ninja-build.Ninja
```
### Run
``` bash
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release
$build_dir/$config my_exe.exe
```
### Run Script
``` powershell
$config = if ($args.Count -ge 1) { $args[0] } else { "Debug" }
$config = $config.Substring(0,1).ToUpper() + $config.Substring(1).ToLower()

$validConfigs = @("Debug", "Release", "RelWithDebInfo", "MinSizeRel")
if (-not $validConfigs -contains $config) {
    Write-Host "Invalid configuration. Valid options: $($validConfigs -join ', ')"
    exit 1
}

$buildDir = "build"
if (-not (Test-Path $buildDir)) {
    New-Item -ItemType Directory -Path $buildDir | Out-Null
}

Write-Host "=== Building $config ===" -ForegroundColor Green
cmake -S . -B $buildDir -G Ninja -DCMAKE_BUILD_TYPE=$config
cmake --build $buildDir --config $config

$exe_name = Get-ChildItem -Path $buildDir/$config -Filter *.exe -Recurse | Select-Object -First 1

if ($exe_name) {
    Write-Host "=== Running $($exe_name.FullName) ===" -ForegroundColor Cyan
    # Start-Process $exe_name.FullName -NoNewWindow -Wait
    & $exe_name.FullName
} else {
    Write-Host "No executable found in $buildDir/$config" -ForegroundColor Red
}
```
