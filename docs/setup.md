# Setup Guide

This guide explains how to set up the Universal Video Downloader on Windows.

## Requirements

The downloader requires:

- Windows 10 or Windows 11
- Python
- yt-dlp
- FFmpeg
- Deno

You do not need Node.js.

## 1. Install Python

Download Python from:

https://www.python.org/downloads/windows/

Download the **Windows installer (64-bit)**.

During installation, make sure you enable:

```text
Add python.exe to PATH
```

Then click **Install Now**.

Verify:

```powershell
python --version
```

Also verify pip:

```powershell
pip --version
```

## 2. Install yt-dlp

```powershell
python -m pip install -U "yt-dlp[default]"
```

Verify:

```powershell
yt-dlp --version
```

## 3. Install FFmpeg

FFmpeg is required when video and audio are provided as separate streams.

Using `winget`:

```powershell
winget install Gyan.FFmpeg
```

Close and reopen PowerShell, then verify:

```powershell
ffmpeg -version
```

## 4. Install Deno

Some websites, particularly YouTube, may require a JavaScript runtime for modern media extraction.

Install Deno:

```powershell
winget install DenoLand.Deno
```

Close and reopen PowerShell, then verify:

```powershell
deno --version
```

## 5. Verify Everything

Run:

```powershell
python --version
yt-dlp --version
ffmpeg -version
deno --version
```

If all commands return version information, the required dependencies are installed.

## 6. Download the Project

Clone the repository:

```powershell
git clone https://github.com/YOUR-USERNAME/universal-video-downloader.git
```

Move into the project directory:

```powershell
cd universal-video-downloader
```

Alternatively, download the repository as a ZIP file from GitHub and extract it.

## 7. Run the Downloader

From PowerShell:

```powershell
.\download-video.bat
```

You can also double-click:

```text
download-video.bat
```

The program will ask for a video URL:

```text
Paste video URL:
```

Paste the URL and press **Enter**.

The downloaded video will be saved in:

```text
C:\Users\<username>\Downloads
```

The filename is automatically generated from the video's title.

## 8. Troubleshooting

### `python` is not recognized

Python is either not installed or wasn't added to PATH.

Re-run the Python installer and make sure:

```text
Add python.exe to PATH
```

is enabled.

Then open a new PowerShell window.

### `yt-dlp` is not recognized

Try:

```powershell
python -m yt_dlp --version
```

If that works, update yt-dlp:

```powershell
python -m pip install -U "yt-dlp[default]"
```

### `ffmpeg` is not recognized

Install FFmpeg :

```powershell
winget install Gyan.FFmpeg
```

Then restart PowerShell.

### `deno` is not recognized

Install Deno:

```powershell
winget install DenoLand.Deno
```

Then restart PowerShell.

### A video fails to download

Not every URL can necessarily be downloaded.

Possible reasons include:

- The website is not supported by yt-dlp
- The video is private
- Authentication is required
- The content is DRM protected
- The platform has changed its media-delivery system
- The platform is blocking automated requests
- A required extraction component is unavailable

First update yt-dlp:

```powershell
python -m pip install -U "yt-dlp[default]"
```

If the problem persists, check the error message and open an issue on GitHub.

**Do not include passwords, cookies, authentication tokens, or other private information in an issue.**

## 9. Updating Dependencies

Update yt-dlp:

```powershell
python -m pip install -U "yt-dlp[default]"
```

Update FFmpeg:

```powershell
winget upgrade Gyan.FFmpeg
```

Update Deno:

```powershell
winget upgrade DenoLand.Deno
```

## Legal and Responsible Use

Only download content that you have the legal right or permission to download.

Do not use this project to bypass:

- DRM
- Paywalls
- Authentication
- Access controls
- Private-content restrictions

Users are responsible for complying with applicable laws and the terms of service of the websites they use.

## Summary

The complete setup is:

```text
Windows
   │
   ├── Python
   │
   ├── yt-dlp
   │
   ├── Deno
   │
   └── FFmpeg
          │
          ▼
  download-video.bat
          │
          ▼
       Video URL
          │
          ▼
        yt-dlp
          │
          ▼
   Video + Audio
          │
          ▼
        FFmpeg
          │
          ▼
      Downloads/
```
