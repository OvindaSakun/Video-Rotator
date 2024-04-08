@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Drag and drop video files onto this .bat script to rotate them.
    pause
    exit /b
)

:loop
if "%~1"=="" goto finished

set "input=%~1"
set "dir=%~dp1"
set "filename=%~n1"
set "ext=%~x1"

echo Rotating Counter-Clockwise: "%~nx1" ...

ffmpeg -nostdin -y -i "%input%" -vf "transpose=2" -c:v libx264 -preset fast -crf 18 -c:a copy "%dir%%filename%_ccw%ext%"

shift
goto loop

:finished
echo.
echo Done! All videos rotated counter-clockwise.
pause