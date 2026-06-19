---
type: moc
title: "Software"
para: resource
status: active
created: 2026-06-19
updated: 2026-06-19
tags:
  - moc
  - software
  - meta
---

# Software

我裝（或 Claude 幫手裝）嘅**系統軟件／CLI／macOS app／套件**目錄。**Catalog only** —— 真身裝喺系統（brew / pip / app），呢度只係人類可讀嘅當前狀態索引。

> [!info] 同 [[extensions]] 點分
> `extensions/` = **Claude Code／Obsidian 嘅 skills / plugins / hooks / [[mcp\|MCP servers]]**（喺 agent／app 內載入）。
> `Software/`（呢度）= **獨立系統軟件**（brew/pip CLI、macOS GUI app、套件），喺 shell／OS 層執行，唔係 agent 擴充。
> 兩邊都唔搬真身入 vault，只做 catalog。

> [!info] 同 activity CSV 點分
> `~/AI/Claude/General/claude-activity-log.csv` = **append-only 事件流**（每個 install 有 start + success row，係不可變歷史）。
> 呢個 catalog = **當前狀態快照**（裝咗啲乜、用嚟做咩、狀態）。新裝一個工具 → 兩邊都寫（CSV 記事件、呢度記狀態）。

## 詞彙

- **類型**：`CLI`（命令列）・`app`（macOS GUI app）。（`MCP server` / `plugin` / `hook` / `skill` 唔歸呢度 → [[extensions]]。）
- **裝法（install_method）**：`brew`（formula CLI）・`brew-cask`（GUI app，`brew install --cask`）・`npm -g`・`pip`・`App Store`・`.dmg/manual`（直接下載 .dmg/.app）。
- **狀態**：`使用中`・`候選`（評估過未採用）・`已移除`。
- **裝者**：`我`（使用者自己）／`Claude 幫手`。backfill 嘅舊 row CSV 未逐筆記 → 留 `—`（未明）。

## 清單

> 2026-06-19 backfill 自 `claude-activity-log.csv` 並逐個核實仍在（`which` / `/Applications`）。

### CLI 命令列

| 工具 | 版本 | 裝法 | 路徑 | 日期 | 裝者 | 用途 | 狀態 |
|------|------|------|------|------|------|------|------|
| [[yt-dlp]] | 2026.06.09 | brew | `/opt/homebrew/bin/yt-dlp` | 2026-06-19 | Claude 幫手 | YouTube metadata + 字幕抓取 | 使用中 |
| node（帶 npm/npx） | node v24.16.0・npm/npx 11.13.0 | .pkg/manual | `/usr/local/bin/node`（`npm`/`npx` 同位） | —（既有） | — | JS runtime；`npx` 跑 npm-global 嘅 MCP/CLI（[[mcp\|obsidian-vault]] mcpvault、filesystem server、defuddle…） | 使用中 |
| uv（帶 uvx） | 0.11.19 | brew | `/opt/homebrew/bin/uv`、`uvx` | 2026-06-04 | — | Python pkg/工具 runner；`uvx` 跑 MCP [[mcp\|fetch]]（mcp-server-fetch） | 使用中 |
| rtk (RTK) | 0.42.1 | brew | `/opt/homebrew/bin/rtk` | 2026-06-05 | — | token 節省 proxy（PreToolUse hook 用） | 使用中 |
| defuddle | 0.19.0 | npm -g | `~/.npm-global/bin/defuddle` | 2026-06-18 | — | URL→乾淨 markdown（bookmark 全文抽取） | 使用中 |
| claude-auto-retry | 0.2.2 | npm -g | `~/.npm-global/…/claude-auto-retry` | 2026-06-06 | — | Claude Code auto-retry（zshrc wrapper） | 使用中 |
| claude-conversation-extractor | 1.1.2 | pip | `~/opt/anaconda3/bin/claude-extract` | 2026-06-04 | — | 抽取/搜尋 Claude 對話（claude-extract/search/logs） | 使用中 |
| happy (Happy Coder) | 1.1.9 | npm -g | `/usr/local/lib/node_modules/happy-coder` | 2026-05-26 | — | Happy harness CLI（呢個 session 跑緊；zsh function wrapper） | 使用中 |

> `uvx` 由 `uv` 提供、`npx` 由 `node`（npm）提供 —— 兩個係 **runner，唔係獨立 install**，故併入母工具 row。`npm -g` 嘅工具（defuddle / claude-auto-retry / happy）全部靠上面個 `node`。

### macOS app（GUI）

| App | 版本 | 裝法 | 路徑 | 日期 | 裝者 | 用途 | 狀態 |
|-----|------|------|------|------|------|------|------|
| Obsidian | 1.12.7 | brew-cask | `/Applications/Obsidian.app` | 2026-06-06 | — | 本 vault 嘅 Obsidian app | 使用中 |
| cmux | 0.64.10 | .dmg/manual | `/Applications/cmux.app` | 2026-06-04 | — | terminal multiplexer，跑 Claude Code session | 使用中 |
| Amphetamine Enhancer | — | .dmg/manual | `/Applications/Amphetamine Enhancer.app` | 2026-06-03 | — | Amphetamine（防瞓）增強 | 使用中 |

## CSV 內唔歸 Software/ 嘅 install（記低去向，免重覆撈）

- **MCP Filesystem / MCP Fetch**（2026-06-04）→ 屬 **MCP server**，歸 [[mcp]]（已建；scope 落 `~/AI/Claude/General`）。底層 `uvx`（fetch 依賴）就喺本清單。
- **claude-obsidian plugin**（2026-06-08，已移除/永久 ban）→ [[plugins]] §歷史。
- **Karpathy CLAUDE.md / Raymond Hou Starter Kit**（2026-06-04）→ config / reference，非工具。

## 規矩

- **table row mandatory**；**工具頁 optional** —— 有用法／gotcha／接 vault pipeline 先開（如 [[yt-dlp]]），純粹一行記低嘅唔使開頁。
- **新增／更新／移除一個工具** → ① append activity CSV（install/uninstall start+success row）② update 呢個清單（+ 工具頁，如需）③ append `wiki/log.md`（HKT）④ 手動 commit（`Meta/` 喺 auto-commit hook scope 外）。
- 工具若同某 bookmark 對應（如評估時 bookmark 過 repo），互相 wikilink。

## 相關
- [[extensions]] —— Claude/Obsidian 擴充（skills/plugins/hooks）
- [[Bookmarks]] —— 工具嘅 URL 指標／評估全文
