---
type: meta
title: "Skills Catalog"
created: 2026-06-16
updated: 2026-06-16
tags:
  - meta
  - skills
---

# Skills Catalog

呢度係**目錄頁**，列出本 vault 可用嘅 Claude Code skills。**實際 skill 檔案**喺其他位置：

## 路徑分工

| Skill 來源 | 物理位置 | 點 load |
|-----------|---------|--------|
| **Plugin skills**（你而家用嘅 claude-obsidian） | `~/.claude/plugins/cache/agricidaniel-claude-obsidian/claude-obsidian/<ver>/skills/` | 由 plugin 自動註冊 |
| **Project-level 自製 skills** | `.claude/skills/`（vault root 隱藏） | Claude Code spec 寫死 |
| **User-level skills** | `~/.claude/skills/` | Claude Code spec 寫死 |

**為何唔搬入 `99 - Meta/skills/`：** Claude Code 嘅 skill 載入路徑寫死喺 `.claude/skills/` 同 `~/.claude/skills/`。要 vault-native 需要 symlink，現階段（零自製 skill）唔抵嘅 complexity。將來真係要時可升級 K3（reverse symlink）。

## 而家 plugin 提供嘅 skills（claude-obsidian v1.9.2）

- `claude-obsidian:autoresearch` — 自主研究迴圈
- `claude-obsidian:canvas` — Obsidian canvas 操作
- `claude-obsidian:defuddle` — URL → 乾淨 Markdown
- `claude-obsidian:obsidian-bases` — `.base` 檔操作
- `claude-obsidian:obsidian-markdown` — Obsidian 語法
- `claude-obsidian:save` — 對話存檔
- `claude-obsidian:think` — 10 原則思考迴圈
- `claude-obsidian:wiki` — vault bootstrap
- `claude-obsidian:wiki-cli` — Obsidian CLI 整合
- `claude-obsidian:wiki-fold` — log rollup
- `claude-obsidian:wiki-ingest` — source ingestion
- `claude-obsidian:wiki-lint` — vault 健檢
- `claude-obsidian:wiki-mode` — methodology mode（LYT/PARA/Zettel/Generic）
- `claude-obsidian:wiki-query` — vault 查詢
- `claude-obsidian:wiki-retrieve` — hybrid retrieval（BM25+rerank）

## 自製 skill 點開始

```bash
mkdir -p .claude/skills/my-skill
# 跟 Anthropic spec 寫 SKILL.md
```

詳見：[Claude Code skills docs](https://code.claude.com/docs/en/skills)。
