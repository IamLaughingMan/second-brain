---
type: meta
title: "Skills"
para: resource
status: active
created: 2026-06-16
updated: 2026-06-17
tags:
  - meta
  - extensions
  - skills
---

# Skills

Catalog 頁。**Skill 真身唔住喺 vault** —— Claude Code spec 寫死載入路徑。Hub：[[extensions]]。

## 三層載入路徑

| 來源 | 物理位置 | 點 load |
|-----------|---------|--------|
| **Plugin-bundled skills** | `~/.claude/plugins/cache/<marketplace>/<plugin>/<ver>/skills/` | 安裝 plugin 後自動註冊 |
| **Project-level skills**（vault 自製） | `.claude/skills/`（vault root 隱藏） | Claude Code spec 寫死 |
| **User-level skills** | `~/.claude/skills/` | Claude Code spec 寫死 |

## 而家裝咗嘅 skills

### Plugin-bundled（kepano `obsidian-skills` v1.0.1，由 Claude Code plugin 提供）

- `obsidian:defuddle` — URL → 乾淨 Markdown（ingest 前清雜訊、省 token）
- `obsidian:json-canvas` — `.canvas`（nodes / edges / groups）
- `obsidian:obsidian-bases` — `.base`（views / filters / formulas / summaries）
- `obsidian:obsidian-cli` — Obsidian CLI 操作（含 plugin/theme 開發）
- `obsidian:obsidian-markdown` — Obsidian Flavored Markdown（wikilinks / embeds / callouts / properties）

Plugin 來源：[[plugins]] § Claude Code plugins。

### Project-level（`.claude/skills/`）

（暫時零自製 skill。將來自製就喺呢度列。）

### User-level（`~/.claude/skills/`）

（暫時無 user-level skill。）

## Add 自製 skill

```bash
mkdir -p .claude/skills/<skill-name>
# 跟 Anthropic spec 寫 SKILL.md
```

文檔：https://code.claude.com/docs/en/skills

## 歷史

- 2026-06-16：本 vault 曾用 `AgriciDaniel/claude-obsidian` plugin（v1.9.2，bundle 15 個 skill 含 `wiki/autoresearch/save/think/canvas/wiki-ingest/wiki-lint/...`）。同日移除，所有功能改用：① kepano `obsidian-skills`（5 skill）+ ② 本 vault 嘅 native hook + Claude 手動執行 ingest／save。見 memory `[[feedback-no-claude-obsidian-plugin]]`。
