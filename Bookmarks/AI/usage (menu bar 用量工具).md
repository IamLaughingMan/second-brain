---
type: bookmark
para: resource
domain: ai-tools
title: "usage (menu bar 用量工具)"
url: "https://github.com/aqua5230/usage"
status: active
created: 2026-06-17
updated: 2026-06-17
related:
  - "[[ccusage]]"
  - "[[Claude Code History Viewer]]"
tags:
  - bookmark
  - ai-tools
  - claude-code
  - usage-tracking
  - macos
---

# usage (menu bar 用量工具)

- URL: https://github.com/aqua5230/usage
- Saved date: 2026-06-17
- Topic: macOS menu bar 顯示 Claude Code / Codex 用量（繁中工具）
- Status: active（**已安裝喺本機** `/Applications/Usage.app`，bundle `com.lollapalooza.usage`）

## Why I saved this

呢個就係我裝咗喺 menu bar 嗰個用量計量工具，記低官方 repo 方便日後更新／睇 changelog。佢純讀本機 log file，唔 call API、唔掂 keychain，私隱 friendly。

## Summary

- **係咩**：macOS menu bar app，slogan「Your quota, where your eyes already are」——監察 Claude Code 同 Codex 用量，避免 session 中途突然 cut off。
- **點攞數據**：**只讀本機 log file**，從不 call API 或讀 keychain。
- **作者／License**：`aqua5230` ・ AGPL-3.0 ・ 主語言 Python（75.4%）。
- **Stars**：~220（截至 2026-06-17）・**最新 release**：v0.20.2（2026-06-16）。

## Key Takeaways

- 顯示 session / weekly / per-project 用量分項，附 color-coded 警示。
- 額外功能：自動 progress resumption、token-waste 健檢、HTML cost report、10 個 UI theme、5 種語言。
- 本機整合：statusLine hook `~/.claude/usage-statusline.py` 接 Claude Code 嘅 session JSON → 寫 `~/.claude/usage-status.json`；menubar app 反向讀呢個檔顯示。
- 亦提供終端 TUI。

## My Notes

（待補）

## Related
- [[ccusage]]
- [[Claude Code History Viewer]]
- [[Bookmarks]]
