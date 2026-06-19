---
type: meta
title: "Plugins"
para: resource
status: active
created: 2026-06-17
updated: 2026-06-19
tags:
  - meta
  - extensions
  - plugins
---

# Plugins

Catalog 頁。Hub：[[extensions]]。

> [!note] 狀態詞彙（catalog 通用）
> `使用中`（已 enable，落「而家裝咗」）・`候選`（評估過、刻意未採用、啱用先採，落「候選」）・`已移除`（裝過又移除／ban，落「歷史」）。

## 兩個 plugin 系統

| 系統                             | 物理位置                                                    | enable 喺邊                                                                                      |
| ------------------------------ | ------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| **Obsidian core plugins**      | Obsidian app 內建                                         | `.obsidian/core-plugins.json`                                                                  |
| **Obsidian community plugins** | `.obsidian/plugins/<id>/`                               | `.obsidian/community-plugins.json`                                                             |
| **Claude Code plugins**        | `~/.claude/plugins/cache/<marketplace>/<plugin>/<ver>/` | `.claude/settings.json` 嘅 `enabledPlugins`（vault-level）或 `~/.claude/settings.json`（user-level） |

## 而家裝咗

### Obsidian core plugins（已 enable，2026-06-19 對 fs reconcile 過共 21 個）

`file-explorer`、`global-search`、`switcher`、`graph`、`backlink`、`canvas`、`outgoing-link`、`tag-pane`、`properties`、`page-preview`、`daily-notes`、`templates`、`note-composer`、`command-palette`、`editor-status`、`outline`、`word-count`、`file-recovery`、`sync`、`bases`、`bookmarks`。

- **`bases`** —— 驅動全 vault `.base` 動態 view（如 `Bookmarks.base`、`PARA.base`、各 domain hub `.base`），**關鍵 plugin**。
- **`bookmarks`**（**原生星星面板**）—— 本 vault **唔用** —— bookmark 走 `Bookmarks/` folder + frontmatter + `.base`，見 [[Bookmarks]]。
- 已 disable（fs 確認 false）：`footnotes`、`slash-command`、`markdown-importer`、`zk-prefixer`、`random-note`、`slides`、`audio-recorder`、`workspaces`、`publish`、`webviewer`。

### Obsidian community plugins

（暫時零安裝。）

### Claude Code plugins（**user-level**，`~/.claude/settings.json` 嘅 `enabledPlugins`）

- **`obsidian@obsidian-skills`**（kepano / Steph Ango，~35k★，MIT）—— 提供 5 個 obsidian skill（見 [[skills]]）+ obsidian-cli 整合。cache：`~/.claude/plugins/cache/obsidian-skills/obsidian/1.0.1/`。Repo：https://github.com/kepano/obsidian-skills
- **`obsidian-visual-skills@axton-obsidian-visual-skills`**（Axton Liu / 回到Axton，~3k★，MIT，**2026-06-19 裝**）—— 提供 3 個視覺 skill：`obsidian-canvas-creator` / `mermaid-visualizer` / `excalidraw-diagram`（文字→圖，見 [[skills]]）。cache：`~/.claude/plugins/cache/axton-obsidian-visual-skills/obsidian-visual-skills/<sha>/`。Repo：https://github.com/axtonliu/axton-obsidian-visual-skills。⚠️ `excalidraw-diagram` 用 output 需另裝 Obsidian Excalidraw 社群插件。
- **enable 喺 user-level = 刻意決定（唔好當 drift 改返 vault-level）**：兩個 plugin 都 enable 喺 **user-level**（`~/.claude/settings.json` 嘅 `enabledPlugins`），vault `.claude/settings.json` 冇。理由（2026-06-19 使用者確認）：開**其他 project 時都可能要用 obsidian**（記筆記／操作本 vault），所以呢啲 obsidian skill 要喺**任何 project** 都 load 到。⇒ 保持 user-level，**唔搬去 vault-level**。安裝經 `/plugin` TUI（user scope）→ marketplace add + install + reload，CLI 無 TTY 跑唔到。

## 候選（評估過・未採用）

- **`obra/superpowers`**（Claude Code plugin・Jesse Vincent / Prime Radiant・MIT）—— **狀態：候選**（2026-06-19 評估完、刻意擱置）。14 skill + session-start hook，強制 brainstorm→design→plan→**TDD**→code-review→finish-branch 開發方法論。**評估結論**：無硬技術碰撞（skill `superpowers:` namespaced、SessionStart event 未被佔用），但同 built-in `code-review`/`verify` + user command `write-tests`/`security-audit` **功能重疊**；主風險＝SessionStart **每 session 注入** opinionated 重流程，競爭 `~/.claude/CLAUDE.md`「Simplicity／Surgical」+ vault session-start 協定。對 vault 筆記工作無關、值喺 **code project**。
  - **採用條件**：若試 → **per-project enable**（嗰個 code repo 嘅 `.claude/settings.json`），**唔好** user-level（避免污染每個 vault session）。
  - **跨 project 提醒已設**：`~/AI/Claude/CLAUDE.md` 嘅「候選工具提醒」段 —— 將來 code project 啱用先輕提，唔硬推、非筆記工作唔提。
  - **詳評＋全文**：bookmark `[[Superpowers (obra)]]`（`Bookmarks/AI/Claude Code/Tools/`）。安裝指令：`/plugin install superpowers@claude-plugins-official`。

## 歷史

- 2026-06-16：曾安裝 `AgriciDaniel/claude-obsidian` plugin（v1.9.2），同日移除。功能改由 ① kepano `obsidian-skills`（skills 層）+ ② vault native PostToolUse hook（auto-commit 層）取代。**永久 ban**：見 memory `[[feedback-no-claude-obsidian-plugin]]`。
