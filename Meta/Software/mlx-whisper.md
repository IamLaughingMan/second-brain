---
type: reference
title: "mlx-whisper"
para: resource
status: active
created: 2026-07-01
updated: 2026-07-02
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
- **Model（持久，已下載）**：`whisper-large-v3-turbo` **2.2GB** 已 cache 落 `~/.cache/huggingface/hub/`（2026-07-02 首次實跑落齊、會 reuse、唔會自動清）。4-bit 量化變體 `whisper-large-v3-turbo-q4`（442MB、`weights.npz`）＝更細更快、中文質素接近 full turbo，**比 `whisper-small`（459MB）仲細又更準**，細機/慢網首選。

## Pipeline：冇字幕片 → transcript

```bash
# 0) 先驗有冇現成字幕（有就唔使 STT）
yt-dlp --skip-download --list-subs --cookies-from-browser chrome "<URL>"

# 1) yt-dlp 抓音訊（bestaudio webm/opus 就得，唔使 -x re-encode；whisper 內部 ffmpeg 自己 decode）
yt-dlp -f bestaudio -o audio.%(ext)s --cookies-from-browser chrome "<URL>"

# 2) mlx_whisper 轉文字（大陸 Mandarin creator 用 zh；HK 廣東話用 Cantonese）
mlx_whisper audio.webm --model mlx-community/whisper-large-v3-turbo --language zh --output-format txt --output-dir .
#   --model:          large-v3-turbo（已 cache）；細機/慢網用 whisper-large-v3-turbo-q4
#   --output-format:  txt / srt / vtt / json

# 3) 簡→正 + 直寫入 bookmark 檔尾（shell 直寫＝唔經 Claude context、0 token）
opencc -i audio.txt -o audio.hk.txt -c s2hk && cat audio.hk.txt >> "<bookmark.md>"
```

## Gotchas（★ = 2026-07-02 實跑 5 條片學到）

- **★ yt-dlp 撞 bot-wall**：YouTube 而家會「Sign in to confirm you're not a bot」→ **必加 `--cookies-from-browser chrome`**（同 geo 無關；deno 自動解 JS challenge）。
- **★ HF model 下載會靜默 hang**：`huggingface_hub` 首次落 model 冇 timeout，經 VPN 慢時會 hang 幾粒鐘唔郁。救法：`curl -L -C - --retry 30 --speed-limit 20000 --speed-time 45` resume 落本地夾再 `--model <本地夾>`；或者**熄 VPN 全速落**（HF **唔** geo-block，VPN 只 YouTube 要）。
- **★ 0 token 手法**：轉錄係純本地 compute（Neural Engine），唔食 Claude token；用 shell `cat >> file` 直寫逐字稿，**唔好 Read 全文入 context**（20 分鐘片 ≈ 3–6k token）。
- **★ 重複幻覺**：無字幕中文片常有連環同詞（如「傳的傳的…」）→ `perl -Mutf8 -CSD -0777 -i -pe 's/(詞){6,}/…〔略〕/g'` trim（**改 CJK 嘅 perl 必加 `-Mutf8`** 先 match 到）。
- **冇 ffmpeg 會報錯**（解碼音訊靠佢）。
- 行喺**本機 IP**：YouTube geo-block 時 yt-dlp 抓唔到音訊 → 要先轉 VPN server（本次無撞到 geo，主要係 bot-wall + model 下載慢）。
- model 越大越準越慢；`turbo` 係速度/質素平衡，細機/慢網用 `whisper-large-v3-turbo-q4`（比 `whisper-small` 細又準）。
- STT 出嚟係**機器稿、有錯**：存入 bookmark `## 逐字稿` 要標明「Whisper 自動轉錄、未校對」，唔扮人手字幕。

## Related
- [[yt-dlp]]（抓音訊 / 抓現成字幕）・[[Software]] hub
