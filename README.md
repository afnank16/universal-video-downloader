# Universal Video Downloader

A simple video downloader for Windows powered by **yt-dlp** and **FFmpeg**. Paste a supported video URL and the downloader automatically selects the best available quality, downloads the video and audio, and merges them into a playable MP4 file.

> **Note:** This project is intended for downloading content that you own or have permission to download. Respect copyright laws, platform terms of service, and access restrictions.

---

## ✨ Features

- 🎥 Download videos from many platforms supported by yt-dlp
- ⭐ Automatically select the best available quality
- 🔊 Automatically download separate audio when necessary
- 🔧 Automatically merge video and audio using FFmpeg
- 📁 Save downloads directly to the Windows Downloads folder
- 📝 Automatically use the video's title as the filename
- 🖥️ Simple Windows `.bat` interface
- 🚫 No need to manually specify resolution or format IDs

---

## 📂 Project Structure

```
universal-video-downloader/
│
├── download-video.bat
├── README.md
├── LICENSE
├── .gitignore
│
└── docs/
    └── setup.md
```

---

## 🛠️ Requirements

You need:

- Windows 10/11
- Python
- yt-dlp
- FFmpeg

> Some websites may require additional yt-dlp components or a JavaScript runtime.

---

## 🚀 Installation

### 1. Install Python

Download Python from:

[https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/)

During installation, make sure:

☑ **Add python.exe to PATH**

is enabled.

Verify:

```bash
python --version
```

### 2. Install yt-dlp

```bash
python -m pip install -U "yt-dlp[default]"
```

Verify:

```bash
yt-dlp --version
```

### 3. Install FFmpeg

On Windows, you can install it using `winget`:

```bash
winget install Gyan.FFmpeg
```

Verify:

```bash
ffmpeg -version
```

### 4. Install Deno

Some current YouTube extraction functionality may require a JavaScript runtime.

```bash
winget install DenoLand.Deno
```

Verify:

```bash
deno --version
```

---

## ▶️ Usage

Run:

```bash
.\download-video.bat
```

Or double-click `download-video.bat`.

You'll be asked:

```
Paste video URL:
```

Paste the URL and press Enter.

The downloader will save the video to:

```
C:\Users\<username>\Downloads
```

The filename will automatically be based on the video's title.

---

## 🧠 How It Works

The project itself doesn't implement video extraction from every website. Instead, it acts as a simple interface around yt-dlp.

```
                Video URL
                    │
                    ▼
          ┌─────────────────┐
          │   Downloader    │
          │      .bat       │
          └────────┬────────┘
                    │
                    ▼
              ┌─────────┐
              │ yt-dlp  │
              └────┬────┘
                    │
              Video + Audio
                    │
                    ▼
              ┌─────────┐
              │ FFmpeg  │
              └────┬────┘
                    │
                    ▼
              Final MP4
                    │
                    ▼
              Downloads/
```

yt-dlp handles extracting the available media streams, while FFmpeg handles merging or processing them when necessary.

---

## 🎞️ Quality Selection

The downloader doesn't hard-code a resolution such as 1080p. Instead, it uses:

```
bv*+ba/b
```

which tells yt-dlp to prefer:

1. Best available video
2. Best available audio
3. Fall back to the best combined format when separate streams aren't available

Therefore, if a video only has 480p available, the downloader doesn't fail simply because 1080p doesn't exist.

---

## 🌐 Supported Websites

The project can work with websites supported by yt-dlp. The exact capabilities depend on the website and its current delivery system.

Examples may include various:

- Video-sharing platforms
- Social-media platforms
- Streaming sites
- Direct video URLs
- HLS/M3U8 sources

See the [official yt-dlp documentation](https://github.com/yt-dlp/yt-dlp) for the current supported-site information.

---

## ⚠️ Limitations

This project cannot guarantee that every video on the internet can be downloaded.

Downloads may fail when:

- The website isn't supported by yt-dlp
- The content is DRM protected
- The content requires authentication
- The content is private or restricted
- The platform changes its media-delivery system
- The required media stream is unavailable
- The website blocks automated requests
- Additional authentication or extraction requirements are needed

> A URL being accessible in a web browser does not necessarily mean yt-dlp can download it.

---

## 🔐 Privacy & Security

This project does not intentionally collect or upload your URLs or downloaded videos.

However, third-party tools such as yt-dlp communicate with the websites from which you request content.

**Never commit authentication information to this repository.**

Do not upload files such as:

- `cookies.txt`
- `cookies.sqlite`
- `.env`
- `*.part`
- `*.mp4`

or any other files containing private credentials or personal information.

---

## ⚖️ Legal Notice

This project is provided for legitimate downloading purposes.

You are responsible for ensuring that your use complies with:

- Copyright law
- Applicable local laws
- The terms of service of the website
- The rights of the content owner

**Do not use this project to bypass DRM, authentication, paywalls, or other access controls.**

The developers of this project are not responsible for how the software is used.

---

## 🤝 Contributing

Contributions are welcome!

If you'd like to contribute:

1. Fork the repository
2. Create a branch
   ```bash
   git checkout -b feature/my-feature
   ```
3. Make your changes
4. Commit your changes
   ```bash
   git commit -m "Add my feature"
   ```
5. Push your branch
   ```bash
   git push origin feature/my-feature
   ```
6. Open a Pull Request

Please keep contributions focused and include useful documentation when introducing new functionality.

---

## 🐛 Issues

If you encounter a problem, open a [GitHub Issue](../../issues) and include:

- Operating system
- Python version
- yt-dlp version
- FFmpeg version
- Website involved
- Relevant error message

**Do not post cookies, authentication tokens, passwords, or other private information in an issue.**

---

## 📜 License

This project is licensed under the MIT License. See [LICENSE](./LICENSE) for details.

---

## 🙏 Credits

This project would not be possible without these excellent open-source projects:

- [yt-dlp](https://github.com/yt-dlp/yt-dlp) — media extraction and downloading
- [FFmpeg](https://ffmpeg.org/) — multimedia processing
- [Python](https://www.python.org/) — runtime for yt-dlp

---

## ⭐ If you find this project useful

Give the repository a star on GitHub and feel free to contribute improvements.
