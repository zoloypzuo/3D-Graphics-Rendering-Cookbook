@echo off
set CurrentDir=%cd%
set ScriptDir=%~dp0
set EngineDir=%ScriptDir%\
set Args=%*

cd /d %EngineDir%
@echo on

rmdir /S /Q tracy
mklink /D /J tracy C:\Users\zoloypzuo\Documents\GitHub\tracy

cd %CurrentDir%
pause
