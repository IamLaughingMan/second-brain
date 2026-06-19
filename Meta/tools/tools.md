---
type: moc
title: "Tools"
para: resource
status: active
created: 2026-06-19
updated: 2026-06-19
tags:
  - moc
  - tools
  - meta
---

# Tools

我裝（或 Claude 幫手裝）嘅**系統工具／CLI／app／套件**目錄。**Catalog only** —— 真身裝喺系統（brew / pip / app），呢度只係人類可讀嘅當前狀態索引。

> [!info] 同 [[extensions]] 點分
> `extensions/` = **Claude Code／Obsidian 嘅 skills / plugins / hooks**（喺 agent／app 內載入）。
> `tools/`（呢度）= **獨立系統工具**（brew/pip CLI、GUI app、套件），喺 shell／OS 層執行，唔係 agent 擴充。
> 兩邊都唔搬真身入 vault，只做 catalog。

> [!info] 同 activity CSV 點分
> `~/AI/Claude/General/claude-activity-log.csv` = **append-only 事件流**（每個 install 有 start + success row，係不可變歷史）。
> 呢個 catalog = **當前狀態快照**（裝咗啲乜、用嚟做咩、狀態）。新裝一個工具 → 兩邊都寫（CSV 記事件、呢度記狀態）。

## 狀態詞彙

`使用中`（裝咗在用）・`候選`（評估過未採用）・`已移除`（裝過又移除）。

## 清單

| 工具 | 類型 | 版本 | 裝法 | 路徑 | 日期(HKT) | 裝者 | 用途 | 狀態 |
|------|------|------|------|------|-----------|------|------|------|
| [[yt-dlp]] | brew CLI | 2026.06.09 | `brew install yt-dlp` | `/opt/homebrew/bin/yt-dlp` | 2026-06-19 | Claude 幫手 | YouTube metadata + 字幕抓取 | 使用中 |

## 規矩

- **新增／更新／移除一個工具** → ① append activity CSV（install/uninstall start+success row）② update 呢個清單 + 開／改對應工具頁 ③ append `wiki/log.md`（HKT）④ 手動 commit（`Meta/` 喺 auto-commit hook scope 外）。
- 每個工具一頁（`Meta/tools/<name>.md`，`type: tool`）放：係咩／點裝／點用／gotcha／接咩 vault pipeline。
- 工具若同某 bookmark 對應（如評估時 bookmark 過 repo），互相 wikilink。

## 相關
- [[extensions]] —— Claude/Obsidian 擴充（skills/plugins/hooks）
- [[Bookmarks]] —— 工具嘅 URL 指標／評估全文
