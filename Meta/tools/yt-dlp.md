---
type: tool
title: "yt-dlp"
para: resource
status: active
tool_status: 使用中
version: "2026.06.09"
install_method: "brew install yt-dlp"
install_path: "/opt/homebrew/bin/yt-dlp"
installed: 2026-06-19
installed_by: "Claude 幫手"
created: 2026-06-19
updated: 2026-06-19
tags:
  - tool
  - cli
  - youtube
  - yt-dlp
---

# yt-dlp

- 類型：brew CLI（系統工具，非 Claude/Obsidian 擴充）
- 版本：`2026.06.09` ・ 路徑：`/opt/homebrew/bin/yt-dlp`
- 裝法：`brew install yt-dlp`（連 12 deps，含 `python@3.14`）
- 裝者／日期：Claude 幫手 ・ 2026-06-19 HKT
- 狀態：**使用中**

## 係咩

YouTube（及上千個站）嘅下載／抽取 CLI，youtube-dl 嘅活躍 fork。本 vault 用嚟**記錄 YouTube 內容**（metadata + 字幕逐字稿），因為 `WebFetch`/`defuddle` 抓唔到 YouTube 字幕（JS + 另一條字幕 API）。

## 點用（本 vault 常用）

**抓 metadata**（標題／頻道／日期／時長／描述）：
```bash
yt-dlp --skip-download --write-info-json --write-description <URL>
```

**抓字幕／逐字稿**（有人手字幕用人手、冇就 auto-caption）：
```bash
yt-dlp --skip-download --write-auto-sub --write-sub \
  --sub-lang "en,zh-Hant,zh-Hans" --convert-subs srt <URL>
```

**冇字幕嘅片**（talk/vlog）→ 抽音再本地 Whisper 轉錄（**需另裝 `ffmpeg` + whisper**）：
```bash
yt-dlp -x --audio-format mp3 <URL>   # 然後餵 Whisper
```

## Gotcha

- **`ffmpeg` 未裝** —— 純抓字幕／info-json **唔需要**；只有 merge 影音、轉檔、抽音（`-x`）先要 `brew install ffmpeg`。
- Bash 有網絡（實測 YouTube 200）⇒ Claude 可自行跑，毋須開終端。
- yt-dlp 更新快，YouTube 一改格式舊版易壞 → 偶爾 `brew upgrade yt-dlp`。

## 接 vault pipeline

```
YouTube URL --[yt-dlp 字幕]--> raw/transcripts/<slug>.md（不可變 source）--[ingest]--> wiki/<domain>/sources/
                          \--> 或塞入 YouTube bookmark 嘅 ## Full Content (archived)
```

## 相關
- [[tools]] —— 工具 catalog hub
- [[ccusage]] —— 另一個 coding-agent CLI（bookmark 過、未裝）
