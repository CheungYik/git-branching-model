@echo off
setlocal

if "%~1"=="" (
    echo Usage: %~nx0 ^<version^>
    exit /b 1
)

echo %~1 > version.txt

echo Bumped version number to %~1