`.vscode/launch.json`
``` json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Run Release",
            "type": "cppvsdbg",
            "request": "launch",
            "program": "${workspaceFolder}\\x64\\Release\\cuda.exe",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "console": "integratedTerminal",
            "preLaunchTask": "Build Release"
        }
    ]
}
```
