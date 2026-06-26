---
type: source
para: resource
domain: obsidian-ai
title: "parazettel (Theo Stowell) — Claude Code x Obsidian"
status: active
created: 2026-06-26
updated: 2026-06-26
tags:
  - source
  - obsidian
  - ai
  - practitioner
---

# parazettel (Theo Stowell) — Claude Code x Obsidian

## Source
- **Author / Publication**：Theo Stowell — PARAZETTEL.com 創始人
- **Type**：Long-form practitioner article
- **URL**：`parazettel.com/articles/obsidian-x-claude-code/`
- **Bookmark**：[[parazettel — Claude Code x Obsidian (Theo Stowell)]]

## Core thesis
**單一 personal vault + 獨立 website (Hugo) repo** 嘅實際 PKM setup；用 Claude Code 自動化「boring 嘢」 + 做 decision sounding board。實踐**Pattern B + C hybrid**（vault 經 Obsidian-mcp plugin reach；website repo 經 Claude Code direct）。

## Key claims / takeaways

1. **Single vault 哲學**（同 kepano align）：
   - 維持一個 personal vault 做 PKM
   - **建議反對** maintaining multiple vault（除非 publish scope）
   - Website 用獨立 Hugo repo（呢個係 scope-based exception，同 kepano 一樣）

2. **Pattern B + C hybrid 實踐**：
   - Claude Code 喺 Hugo repo 處理 HTML/CSS modifications（Pattern B）
   - 同時 Obsidian-mcp plugin + Claude Code community plugin = vault access（Pattern C）
   - 兩個 layer 一齊用、唔互斥

3. **AI 喺 PKM 嘅務實角度**：
   - 「I'm most interested in using Claude Code to automate the boring things」
   - 具體：template creation、metadata maintenance
   - 用 Claude 做 decision sounding board，escape「infinite loops of thinking」（solo entrepreneur context）

4. **Privacy 立場**：
   - Acknowledges concerns
   - 揀 Anthropic over competitors（reputation calculation）
   - 仍係 personal risk choice

5. **未完整 documented**：
   - 作者承認自己 conventions 仲未 fully document
   - 引用 community「create claude.md files within vaults」做法

## Pattern correspondence
- 同時實踐 [[Linked Repo + Vault (Pattern B)]] + [[Unified via MCP (Pattern C)]] hybrid
- 唔係 [[Vault-as-Everything (Pattern A)]]（自覺分層）

## Strength
- **真實 practitioner setup**（非純 theoretical / starter kit promo）
- 哲學同 kepano align（scope-based vault split）
- 務實角度：「automate boring things」唔係「revolutionize PKM」 — 真實期待
- 描述咗 privacy decision rationale，唔係 ignore

## Limitation
- Setup detail 未夠 complete（作者自己承認）
- 屬 solo entrepreneur context，未必直接 transfer 去合作 / 企業 setting
- 偏 high-level、缺 step-by-step
- Hugo-specific（如果你唔 publish 個 website 就 less relevant）

## How it fits my synthesis
- **支持 Pattern B + C 可以 hybrid**（[[Claude + Obsidian Project Workflow]] §6 "何時 hybrid (A + B)" 對應呢個邏輯）
- 「scope-based vault split」嘅 practitioner 例子 —— 同 kepano published site exception 一致
- **「automate boring things」**啟示：你 vault 嘅 auto-commit、Stop hook、bookmark pipeline 都係 automation 同類

## My evaluation
- **Medium signal** —— practitioner perspective 有用，但 setup detail 較弱
- **值得 reference**：哲學立場 + privacy decision
- **唔值得直接 copy**：Hugo-specific、solo context

## Bookmark
- [[parazettel — Claude Code x Obsidian (Theo Stowell)]] — full archive

## Related
- Concept: [[Linked Repo + Vault (Pattern B)]] + [[Unified via MCP (Pattern C)]]
- Entity: [[kepano-obsidian]] (philosophy alignment)
- Synthesis: [[Claude + Obsidian Project Workflow]] §6 hybrid
- Source: [[stephango.com vault]] (kepano writeup, philosophy origin)
- Hub: [[Obsidian]]
