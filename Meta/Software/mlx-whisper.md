---
type: reference
title: "mlx-whisper"
para: resource
status: active
created: 2026-07-01
updated: 2026-07-01
tags:
  - software
  - reference
  - whisper
  - stt
---

# mlx-whisper

Apple Silicon（MLX）版 OpenAI Whisper —— **speech-to-text（語音轉文字 / STT）**。本 vault 用嚟**為冇字幕嘅 YouTube 片，由聲音生成 transcript**（Web Clipper 同 yt-dlp auto-caption 都只抓**現成字幕**，片完全冇字幕就要靠呢個由聲生成）。

- 裝法：`pipx install mlx-whisper`（隔離 venv，Python 3.14；特登避開 anaconda base 3.9）
- CLI：`~/.local/bin/mlx_whisper`
- 依賴：**ffmpeg**（brew 8.1.2，解碼音訊）；配 [[yt-dlp]] 抓音訊
- 版本：0.4.3（2026-07-01 裝，Claude 幫手）

## Pipeline：冇字幕片 → transcript

```bash
# 1) yt-dlp 抓音訊（前提：要有通到 YouTube 嘅網絡 / VPN exit）
yt-dlp -f bestaudio -x --audio-format mp3 -o audio.mp3 "<URL>"

# 2) mlx_whisper 轉文字
mlx_whisper audio.mp3 --language Cantonese --output-format srt --output-dir .
#   --language:       Cantonese / Chinese / English …（HK 內容用 Cantonese 或 Chinese）
#   --model:          預設 mlx-community/whisper-large-v3-turbo（首次自動由 HuggingFace 下載）
#   --output-format:  txt / srt / vtt / json
```

## Gotchas

- **首次跑會由 HuggingFace 下載 model**（需 internet；large-v3-turbo ~1.5GB），之後 cache。
- **冇 ffmpeg 會報錯**（解碼音訊靠佢）。
- 行喺**本機 IP**：YouTube geo-block 時 yt-dlp 抓唔到音訊 → 要先轉 VPN server（同你睇片一樣）。
- 廣東話口語 + 夾雜英文準確度一般；純書面/Mandarin 內容用 `--language Chinese` 較穩。
- model 越大越準越慢；`turbo` 係速度/質素平衡，細機可 `--model mlx-community/whisper-small`。
- STT 出嚟係**機器稿、有錯**：存入 bookmark `## Transcript` 要標明「Whisper 自動轉錄、未校對」，唔扮人手字幕。

## Related
- [[yt-dlp]]（抓音訊 / 抓現成字幕）・[[Software]] hub
