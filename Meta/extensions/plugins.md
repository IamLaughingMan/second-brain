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
- **enable 喺 user-level = 刻意決定（唔好當 drift 改返 vault-level）**：實際 enable 喺 **user-level**（`~/.claude/settings.json`），vault `.claude/settings.json` 冇 `enabledPlugins`。理由（2026-06-19 使用者確認）：開**其他 project 時都可能要用 obsidian**（記筆記／操作本 vault），所以 5 個 obsidian skill 要喺**任何 project** 都 load 到。⇒ 保持 user-level，**唔搬去 vault-level**。

## 歷史

- 2026-06-16：曾安裝 `AgriciDaniel/claude-obsidian` plugin（v1.9.2），同日移除。功能改由 ① kepano `obsidian-skills`（skills 層）+ ② vault native PostToolUse hook（auto-commit 層）取代。**永久 ban**：見 memory `[[feedback-no-claude-obsidian-plugin]]`。
