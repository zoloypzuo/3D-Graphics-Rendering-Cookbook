@echo off
set CurrentDir=%cd%
set ScriptDir=%~dp0
set EngineDir=%ScriptDir%\
set Args=%*

cd /d %EngineDir%
@echo on

cd build_vs2019
cmake .. -G "Visual Studio 16 2019" -A x64
cmake --build . --config Release

cd %CurrentDir%
pause
