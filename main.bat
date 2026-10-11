
@echo off
setlocal EnableExtensions
title Universal Video Downloader
color 0A

:START
cls
echo ==========================================
echo       UNIVERSAL VIDEO DOWNLOADER
echo ==========================================
echo.
echo Enter the video URL:
set "URL="
set /p "URL=> "

if not defined URL (
    echo.
    echo ERROR: You did not enter a URL.
    pause
    goto START
)

echo.
echo Select video quality using UP/DOWN arrows.
echo Press ENTER to confirm.
echo.

set "RESULTFILE=%TEMP%\yt_quality_%RANDOM%.txt"

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0quality_menu.ps1" -ResultFile "%RESULTFILE%"

if errorlevel 1 (
    echo.
    echo Quality selection was cancelled or failed.
    if exist "%RESULTFILE%" del "%RESULTFILE%" >nul 2>&1
    pause
    goto START
)

if not exist "%RESULTFILE%" (
    echo.
    echo ERROR: No quality selection was returned.
    pause
    goto START
)

set "FORMAT="
set /p "FORMAT="<"%RESULTFILE%"
del "%RESULTFILE%" >nul 2>&1

if not defined FORMAT (
    echo.
    echo ERROR: No quality was selected.
    pause
    goto START
)

echo.
echo ==========================================
echo Downloading video...
echo ==========================================
echo.

cd /d "%USERPROFILE%\Downloads"

yt-dlp --no-playlist --merge-output-format mp4 -f "%FORMAT%" -o "%%(title)s.%%(ext)s" "%URL%"

if errorlevel 1 (
    echo.
    echo ==========================================
    echo DOWNLOAD FAILED
    echo ==========================================
    echo.
    echo Check the URL, internet connection, yt-dlp installation,
    echo and whether FFmpeg is installed for merging video and audio.
) else (
    echo.
    echo ==========================================
    echo DOWNLOAD COMPLETED
    echo ==========================================
    echo Saved to: %USERPROFILE%\Downloads
)

echo.
pause
goto START
