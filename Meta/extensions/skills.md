---
type: meta
title: "Skills"
para: resource
status: active
created: 2026-06-16
updated: 2026-06-19
tags:
  - meta
  - extensions
  - skills
---

# Skills

Catalog 頁。**Skill／command 真身唔住喺 vault** —— 全部由 Claude Code spec 寫死載入路徑。Hub：[[extensions]]。

> [!info] 用語注意
> session-start 嘅「user-invocable skills」list 入面，**部分技術上係 slash commands**（`commands/*.md`），部分先係真 skills（`skills/<name>/SKILL.md`）。對使用者嚟講都係「打 `/<name>` 就用到」，所以本 catalog **依用途分類**（一般 vs Obsidian），唔強行區分 skill／command 兩種 fs 容器。

## 分類軸 1：依用途

### 🟢 一般 Claude skills（General，任何 project 都用得）

session-start 出現、**非** `obsidian:` namespace 嘅都歸呢度。物理上有兩個來源：

#### 1a. Built-in Claude Code（binary 內，無 fs path）

`deep-research`、`update-config`、`keybindings-help`、`verify`、`code-review`、`simplify`、`fewer-permission-prompts`、`loop`、`schedule`、`claude-api`、`run`、`init`、`review`、`security-review`

#### 1b. User-level slash commands（`~/.claude/commands/`，4 個）

- `optimize` — `Optimize: $ARGUMENTS`
- `review-pr` — review changes on current branch vs main
- `security-audit` — security audit of branch changes
- `write-tests` — write tests for `$ARGUMENTS`

### 🟦 Obsidian Claude skills（Obsidian-specific，淨係 vault 工作有用）

由 plugin `obsidian@obsidian-skills`（kepano，~35k★，MIT）提供，物理位置 `~/.claude/plugins/cache/obsidian-skills/obsidian/1.0.1/skills/`。5 個全部用 `obsidian:` namespace：

- `obsidian:defuddle` — URL → 乾淨 Markdown（ingest 前清雜訊、省 token）
- `obsidian:json-canvas` — `.canvas`（nodes / edges / groups）
- `obsidian:obsidian-bases` — `.base`（views / filters / formulas / summaries）
- `obsidian:obsidian-cli` — Obsidian CLI 操作（含 plugin/theme 開發）
- `obsidian:obsidian-markdown` — Obsidian Flavored Markdown（wikilinks / embeds / callouts / properties）

Plugin 來源：[[plugins]] § Claude Code plugins。

## 分類軸 2：依物理載入路徑

| 來源 | 物理位置 | Load 機制 | 而家有幾多 |
|---|---|---|---|
| **Built-in Claude Code** | binary 內，無 fs path | Claude Code 啟動時內建 | 14（用途係 general） |
| **Plugin-bundled skills** | `~/.claude/plugins/cache/<marketplace>/<plugin>/<ver>/skills/` | enabled plugin 自動註冊 | 5（用途係 obsidian-specific） |
| **User-level commands** | `~/.claude/commands/<name>.md` | Claude Code spec 寫死 | 4（用途係 general） |
| **User-level skills** | `~/.claude/skills/<name>/SKILL.md` | Claude Code spec 寫死 | 0 |
| **Project-level commands** | `<vault>/.claude/commands/<name>.md` | Claude Code spec 寫死 | 0 |
| **Project-level skills**（vault 自製） | `<vault>/.claude/skills/<name>/SKILL.md` | Claude Code spec 寫死 | 0 |

## Add 自製

### Project-level（vault 內用）

```bash
# Skill（複雜邏輯、可長文檔）
mkdir -p .claude/skills/<skill-name>
# 跟 Anthropic spec 寫 SKILL.md

# Command（簡單 slash command）
echo "Your task: $ARGUMENTS" > .claude/commands/<name>.md
```

文檔：https://code.claude.com/docs/en/skills

### Add Claude Code plugin（會帶 skill）

User-level enable：改 `~/.claude/settings.json` 嘅 `enabledPlugins`。
Vault-level enable：改 `<vault>/.claude/settings.json` 嘅 `enabledPlugins`。

## 歷史

- 2026-06-16：本 vault 曾用 `AgriciDaniel/claude-obsidian` plugin（v1.9.2，bundle 15 個 skill 含 `wiki/autoresearch/save/think/canvas/wiki-ingest/wiki-lint/...`）。同日移除，所有功能改用：① kepano `obsidian-skills`（5 skill）+ ② 本 vault 嘅 native hook + Claude 手動執行 ingest／save。**永久 ban**：見 memory `[[feedback-no-claude-obsidian-plugin]]`。
