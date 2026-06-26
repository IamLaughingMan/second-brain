---
type: source
para: resource
domain: obsidian-ai
title: "jdhwilkins — AI-Powered Task System with Obsidian + Claude Code"
status: active
created: 2026-06-26
updated: 2026-06-26
tags:
  - source
  - obsidian
  - ai
  - task-system
  - pattern-a
---

# jdhwilkins — AI-Powered Task System with Obsidian + Claude Code

## Source
- **Author / Publication**：jdhwilkins blog (`jdhwilkins.com`)
- **Type**：Build walkthrough (specific use case: task system)
- **Bookmark**：[[jdhwilkins — AI Task System with Obsidian]]
- **Distinguishing**：唔係 generic「Claude + Obsidian setup」guide，係 **specific task system implementation**

## Core thesis
用 **2 custom Claude skill** 整一個 Obsidian task system：
1. `obsidian-cli` skill —— route 所有 vault ops through Obsidian's CLI（防 broken link、查 existing index）
2. `todo-vault` skill atop CLI —— 定 task system 嘅 schema 同 note type

**「The skill has a fixed instruction set, while the vault acts as a mutable data layer.」** —— Skill = code / convention，vault = data，兩者明確分離。

## Key claims / takeaways

1. **6 note types** 嘅 task system：
   - Tasks
   - Reminders
   - Repeated tasks
   - Habits
   - Events
   - Notes（generic）

2. **Archive convention**：completed tasks/reminders/events → `old/` subfolder；habits + recurring tasks 永遠**唔 archive**（resurface on schedule、track streaks）

3. **Daily notes**：`Daily/YYYY/Month-Name/<date>.md` （nested year/month folder）

4. **「Skill atop CLI」pattern**：
   - 唔直接 file access → 經 `obsidian-cli` 行 vault ops
   - 好處：避免 broken link（CLI 識 Obsidian wikilink resolution）、query existing index 比 grep 快
   - 啟示：所有 vault automation 應該 prefer Obsidian-aware ops over raw file IO

5. **Metadata > folder hierarchy** principle：
   - 「Folders exist but are less meaningful than they look」
   - 真正 organize 靠 frontmatter
   - 同 kepano「avoid folders for organization」哲學 align

## Pattern correspondence
- **Primary**：[[Vault-as-Everything (Pattern A)]] —— Claude Code 喺 vault 內、skill chain reach 全 vault
- 但 skill 設計（`obsidian-cli` route ops）暗示 future-proof for [[Unified via MCP (Pattern C)]]

## Strength
- **Specific use case** —— 唔係 generic「PKM with AI」，係實實在在 task system；可直接 study + adapt
- 「skill atop CLI」pattern 係 architectural insight：你 vault 嘅 `obsidian-cli` skill 由 [[Obsidian Skills (kepano)]] 提供，可借 jdhwilkins 思路寫自家 todo skill
- Metadata-first 哲學同 kepano align
- 6 note types + archive convention 細緻、可借鑒

## Limitation
- Task system focus → 對你嚟講可能 over-engineered（你 vault 唔以 task management 為主軸）
- 仍係 Pattern A（vault-as-cwd）
- Skill source code 未公開（要自己 reverse-engineer）

## How it fits my synthesis
- 啟示「**custom skill 而非 starter kit**」可行 path：你可以自己寫一個 `vault-ops` skill 規範你嘅 bookmark pipeline / log dual-write 等
- 「skill atop CLI」啟示：你而家 vault ops 用 `mcp__obsidian-vault__*`（user-level MCP），可以 wrap 一個 user-skill 統一接口
- 「metadata > folder」原則支持你 vault 嘅 `.base` view-driven approach

## My evaluation
- **Medium-high signal** —— 唔係 generic guide，但 architectural pattern 借鑒價值高
- **值得 reference**：「skill atop CLI/MCP」design pattern、6 note types schema
- **唔直接 implement**：你冇 task system needs

## Bookmark
- [[jdhwilkins — AI Task System with Obsidian]] — full archive

## Related
- Concept: [[Vault-as-Everything (Pattern A)]] (但 skill 設計 future-proof for C)
- Entity: [[Obsidian Skills (kepano)]] (`obsidian-cli` 來源)
- Sibling source: [[mindstudio AI Second Brain Guide]] (more generic Pattern A)
- Hub: [[Obsidian]]
