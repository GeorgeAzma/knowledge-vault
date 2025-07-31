`C:\Users\lumim\AppData\Local\Programs\Microsoft VS Code\bin\code.bat`
`code.cmd must be changed to code.bat`
``` bash
@echo off
setlocal
set VSCODE_DEV=
set ELECTRON_RUN_AS_NODE=1
start "" /B "%~dp0..\Code.exe" "%~dp0..\resources\app\out\cli.js" %*
IF %ERRORLEVEL% NEQ 0 EXIT /b %ERRORLEVEL%
endlocal
```
