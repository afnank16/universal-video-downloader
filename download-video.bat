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

cd /d "%USERPROFILE%\Downloads"

echo Downloading...
echo.

yt-dlp ^
  --no-playlist ^
  --merge-output-format mp4 ^
  -o "%%(title)s.%%(ext)s" ^
  "%URL%"

echo.

if errorlevel 1 (
    echo ============================================
    echo DOWNLOAD FAILED
    echo ============================================
    echo.
    echo The website may require authentication,
    echo DRM, or may not be supported by yt-dlp.
) else (
    echo ============================================
    echo DOWNLOAD COMPLETE
    echo ============================================
    echo.
    echo Your video is in:
    echo %USERPROFILE%\Downloads
)

echo.
pause