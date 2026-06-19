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
- **注意（2026-06-19 reconcile 修正）**：實際 enable 喺 **user-level**（`~/.claude/settings.json`），**唔係** vault-level —— vault `.claude/settings.json` 冇 `enabledPlugins`。故此 5 個 obsidian skill 喺**任何 project** 都 load 到，唔淨止本 vault。

## 歷史

- 2026-06-16：曾安裝 `AgriciDaniel/claude-obsidian` plugin（v1.9.2），同日移除。功能改由 ① kepano `obsidian-skills`（skills 層）+ ② vault native PostToolUse hook（auto-commit 層）取代。**永久 ban**：見 memory `[[feedback-no-claude-obsidian-plugin]]`。
