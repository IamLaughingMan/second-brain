---
type: source
para: resource
domain: obsidian-ai
title: "starmorph — Obsidian + Claude Code Complete Integration Guide"
status: active
created: 2026-06-26
updated: 2026-06-26
tags:
  - source
  - obsidian
  - ai
  - long-form-guide
---

# starmorph — Obsidian + Claude Code Complete Integration Guide

## Source
- **Author / Publication**：starmorph blog (`blog.starmorph.com`)
- **Type**：Long-form integration guide (blog post)
- **URL**：defanged 喺 bookmark（AV false positive trigger，per [[project-av-quarantines-flagged-urls]]）
- **Bookmark**：[[starmorph — Obsidian + Claude Code Integration Guide]]
- **Date**：(check bookmark, ~2024-2025 era)

## Core thesis
Claude Code 同 Obsidian vault 嘅整合**唔係單一 path**，可分 **3 strategies**（直接對應呢個 vault 嘅 Pattern A/B/C）。**Strategy 1 (symlinks variant of Pattern B) 係 "simplest" for active coding**。最重要嘅哲學原則：**「Agents read, humans write」** —— vault 內容應由人沉澱，AI 唔好 auto-populate。

## Key claims / takeaways

1. **3 strategies 分類**（最直接 backing 呢個 vault 嘅 A/B/C concept）：
   - Strategy 1 = symlinks（Pattern B variant）—— Claude Code 喺 repo run + symlink 入 vault；**作者明寫「simplest」**
   - Strategy 2 = vault as cwd（Pattern A）—— Claude Code run 喺 vault folder
   - Strategy 3 = MCP（Pattern C）—— vault 內 MCP plugin bridge

2. **「Agents read, humans write」原則**：
   - Vault 內容由你沉澱（curation by human）
   - Claude 讀 context、唔應該 generate output 直接污染 vault
   - 違反呢個原則 → Pattern A 嘅核心 risk

3. **CLAUDE.md frontmatter 約定**：每個 `CLAUDE.md` 加 metadata
   ```yaml
   type: claude-config
   project: my-app
   stack: [nextjs, tailwind, supabase]
   status: active
   ```

4. **MCP 路線靠 `iansinnott/obsidian-claude-code-mcp` plugin**（WebSocket :22360）

5. **Claude 嘅 plan/memory 應留喺 `~/.claude/` 同 vault knowledge 分開**，唔好 mix

## Pattern correspondence
- 直接 backing：[[Vault-as-Everything (Pattern A)]] / [[Linked Repo + Vault (Pattern B)]] / [[Unified via MCP (Pattern C)]]
- 明確推薦：Strategy 1 (B) 作為 active coding 起點

## Strength
- **第一個明確分 3 strategies 嘅 long-form source**（呢個 vault 嘅 A/B/C concept 直接從佢嚟）
- 推薦 explicit + 有理由（唔淨係列 options）
- 強調哲學原則（agents read humans write）—— 唔淨係 setup tutorial

## Limitation
- 作者主要 tech blogger、唔係 PKM 大神（vs kepano、Matuschak）
- 部分細節（symlinks 點設、CLAUDE.md 點寫）未夠 step-by-step；要自己補
- 唔 cover 商業／sensitive data scenarios
- AV false positive 觸發（starmorph.com domain）—— 引用要 defang URL

## How it fits my synthesis
- [[Claude + Obsidian Project Workflow]] §2 Decision framework 直接 build on starmorph 嘅 3-strategy 分類
- [[Claude + Obsidian Workflow Pattern Comparison]] matrix 嘅 dimension（separation、setup 難度、kepano alignment）部分 inspired by starmorph 嘅 discussion
- Pattern B recommendation 嘅 「starmorph 認 simplest」backing 直接 quote 自呢個 source

## My evaluation
- **High signal** —— 12 條 source 入面對 pattern 分類最 clear
- **Bookmark 必留**（已 defang URL pointer-only 形式）
- **Trust level**：tech blog（中），但 3-strategy 分類 framework 自洽，可信

## Bookmark
- [[starmorph — Obsidian + Claude Code Integration Guide]] — pointer-only + defanged URL (AV false positive)

## Related
- Concept: [[Linked Repo + Vault (Pattern B)]] (推薦 path)
- Concept: [[Unified via MCP (Pattern C)]] (Strategy 3)
- Entity: [[iansinnott obsidian-claude-code-mcp]] (Strategy 3 嘅 MCP plugin)
- Synthesis: [[Claude + Obsidian Project Workflow]]
- AV gotcha: [[project-av-quarantines-flagged-urls]]
- Hub: [[Obsidian]]
