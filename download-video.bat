
@echo off
setlocal
title Universal Video Downloader

echo ============================================
echo        Universal Video Downloader
echo ============================================
echo.
set /p "URL=Paste video URL: "
echo.

if "%URL%"=="" (
    echo No URL was entered.
    pause
    exit /b 1
)

echo Select video quality:
echo.
echo [1] 360p
echo [2] 480p
echo [3] 720p
echo [4] 1080p
echo [5] Best available quality
echo.

choice /c 12345 /n /m "Choose quality (1-5): "

if errorlevel 5 set "FORMAT=bv*+ba/b"
if errorlevel 4 set "FORMAT=bv*[height<=1080]+ba/b[height<=1080]"
if errorlevel 3 set "FORMAT=bv*[height<=720]+ba/b[height<=720]"
if errorlevel 2 set "FORMAT=bv*[height<=480]+ba/b[height<=480]"
if errorlevel 1 set "FORMAT=bv*[height<=360]+ba/b[height<=360]"

echo.
cd /d "%USERPROFILE%\Downloads"

echo Downloading...
echo.

yt-dlp ^
  --no-playlist ^
  --merge-output-format mp4 ^
  -f "%FORMAT%" ^
  -o "%%(title)s.%%(ext)s" ^
  "%URL%"

echo.

if errorlevel 1 (
    echo ============================================
    echo DOWNLOAD FAILED
    echo ============================================
    echo Check the URL, yt-dlp, and FFmpeg.
) else (
    echo ============================================
    echo DOWNLOAD COMPLETE
    echo ============================================
    echo Saved in: %USERPROFILE%\Downloads
)

echo.
pause
