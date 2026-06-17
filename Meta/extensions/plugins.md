---
type: meta
title: "Plugins"
para: resource
status: active
created: 2026-06-17
updated: 2026-06-17
tags:
  - meta
  - extensions
  - plugins
---

# Plugins

Catalog 頁。Hub：[[extensions]]。

## 兩個 plugin 系統

| 系統 | 物理位置 | enable 喺邊 |
|---|---|---|
| **Obsidian core plugins** | Obsidian app 內建 | `.obsidian/core-plugins.json` |
| **Obsidian community plugins** | `.obsidian/plugins/<id>/` | `.obsidian/community-plugins.json` |
| **Claude Code plugins** | `~/.claude/plugins/cache/<marketplace>/<plugin>/<ver>/` | `.claude/settings.json` 嘅 `enabledPlugins`（vault-level）或 `~/.claude/settings.json`（user-level） |

## 而家裝咗

### Obsidian core plugins（已 enable）

`file-explorer`、`global-search`、`switcher`、`graph`、`backlink`、`canvas`、`outgoing-link`、`tag-pane`、`properties`、`page-preview`、`bookmarks`（**原生星星面板**，本 vault **唔用** —— bookmark 走 `Bookmarks/` folder + frontmatter + `.base`，見 [[Bookmarks]]）。

### Obsidian community plugins

（暫時零安裝。）

### Claude Code plugins（vault-level，`.claude/settings.json`）

- **`obsidian@obsidian-skills`**（kepano / Steph Ango，~35k★，MIT）—— 提供 5 個 obsidian skill（見 [[skills]]）+ obsidian-cli 整合。Repo：https://github.com/kepano/obsidian-skills

## 歷史

- 2026-06-16：曾安裝 `AgriciDaniel/claude-obsidian` plugin（v1.9.2），同日移除。功能改由 ① kepano `obsidian-skills`（skills 層）+ ② vault native PostToolUse hook（auto-commit 層）取代。**永久 ban**：見 memory `[[feedback-no-claude-obsidian-plugin]]`。
