---
type: entity
para: resource
domain: obsidian-ai
title: "ballred/obsidian-claude-pkm"
status: active
created: 2026-06-26
updated: 2026-06-26
tags:
  - entity
  - obsidian
  - ai
  - starter-kit
  - pattern-a
---

# ballred/obsidian-claude-pkm

## What it is
GitHub starter kit（1.5k★）整合 Obsidian + Claude Code，定位係「**execution system**」—— 將 3-year vision → yearly → monthly → weekly → daily 嘅 goal-tracking 完整 chain，由 4 個 specialized AI agent + 10 個 slash command 自動化。係 [[Vault-as-Everything (Pattern A)]] 嘅代表實作。

## Pattern alignment
- **Primary**：[[Vault-as-Everything (Pattern A)]] — Claude Code run in `cd ~/vault`
- Vault 自帶 `.claude/` 完整 setup（commands、skills、agents、hooks、rules、output-styles、settings.json）
- Project files 入 vault `Projects/` folder，每 project 有自己 `CLAUDE.md`

## Key facts
- **Repo**：`ballred/obsidian-claude-pkm` on GitHub
- **Stars**：1.5k★
- **Pitch**：「Not another PKM starter kit. This is an execution system that connects your 3-year vision to what you do today」
- **Vault 結構**：CLAUDE.md / Daily Notes / Goals (3-year / yearly / monthly) / Projects / Templates / Archives / Inbox
- **`.claude/` 結構**：agents (4 個 with memory)、skills (10 個 slash command)、hooks、rules、output-styles (含 Productivity Coach mode)
- **Included slash commands**：`/daily`、`/weekly`、`/monthly`、`/project`、`/review`、`/push`、`/onboard`、`/adopt`、`/upgrade`
- **License**：(check repo)

## Why it matters
- **最高 star 嘅 starter kit** 之一，代表 Pattern A 嘅主流社群實踐
- 4 agents + 10 skills 嘅 setup 比一般 vault template 完整好多
- Productivity Coach output style 係 unique — 唔淨係 PKM、係 accountability system
- 適合**新手第一次試** Claude + Obsidian → 一個 install 即用

## Limitation / 唔啱用情境
- Mix code project file + personal vault（違反 kepano「avoid mixing scopes」原則）
- Vault git 會含 code commit、污染 history
- AI 操作邊界模糊：Claude 寫 code 時都見到日記／private context
- 唔啱 商業 project / 含 sensitive data / 多人合作
- 唔啱已有獨立 repo workflow 嘅 power user — 應該行 [[Linked Repo + Vault (Pattern B)]]

## My take
- 對你嚟講**唔建議裝**：你 vault 已經自有 setup（auto-commit hook、Claude history Stop hook、obsidian-skills、obsidian-vault MCP），而且 NMN 已實踐 Pattern B；裝呢個會 conflict
- **值得 reference 嘅做法**：佢嘅 Goals 3-tier 結構（3yr → yearly → monthly）或者可借鑒入你 [[Projects]] hub；佢嘅 weekly review 模式可以 adopt 落你 `wiki/log.md` 流程
- **唔好直接 fork**：佢設計 assumes empty vault + Pattern A，硬套你已有 setup 會撞

## Source bookmark
- [[ballred obsidian-claude-pkm — Starter Kit (1.5k★)]] — full archive + SETUP_GUIDE.md 細節

## Related
- Pattern: [[Vault-as-Everything (Pattern A)]]
- Comparison: [[Claude + Obsidian Workflow Pattern Comparison]]
- Synthesis: [[Claude + Obsidian Project Workflow]]
- Hub: [[Obsidian]]
