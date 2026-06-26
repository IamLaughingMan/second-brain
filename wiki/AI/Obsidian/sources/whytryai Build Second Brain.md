---
type: source
para: resource
domain: obsidian-ai
title: "whytryai — Build Your Second Brain with Claude Code + Obsidian"
status: active
created: 2026-06-26
updated: 2026-06-26
tags:
  - source
  - obsidian
  - ai
  - pattern-a
---

# whytryai — Build Your Second Brain with Claude Code + Obsidian

## Source
- **Author / Publication**：whytryai blog (`whytryai.com/p/claude-code-obsidian`)
- **Type**：Setup walkthrough article
- **Bookmark**：[[whytryai — Build Your Second Brain Claude Code + Obsidian]]
- **Note**：Partially paywalled — 「optional extras」、project file structure、CLAUDE.md specs、MCP setup details 喺 paywall 後

## Core thesis
**Obsidian vault 放入 Claude Code working directory subfolder**（vault-as-subfolder variant of Pattern A）。「Your entire working folder _is_ the context」—— 全 vault 即 context；唔需要 manual paste。建議用 Claude Code interview 你 needs、再自動 propose + execute vault structure。

## Key claims / takeaways

1. **Architectural decision**：vault = Claude Code working dir 嘅 subfolder
   - Claude Code 即時 access 全 vault 嘅 content
   - 「Your entire working folder _is_ the context」

2. **「Interview first, structure later」approach**：
   - 唔 prescribe rigid framework
   - 推薦俾 Claude Code interview 你嘅 goal + preference
   - 然後 Claude propose 客製化 folder structure + execute
   - 避免「manual administrative burden」

3. **Obsidian 配 LLM workflow 嘅 3 個 advantage**：
   - Local file storage（唔 cloud-locked）
   - Markdown format compatibility
   - Built-in wikilink system Claude 可程式化操作

4. **Setup style**：「interview-driven」instead of「starter kit」

## Pattern correspondence
- **Primary**：[[Vault-as-Everything (Pattern A)]]（vault-as-subfolder variant）
- 唔同 typical Pattern A 嘅地方：作者強調 interview-driven setup（vs ballred「fork starter kit」）

## Strength
- **「Interview-driven」approach 係 unique**（vs starter kit 派）—— 適合 user 唔想被預設 structure 框住
- 強調 Obsidian 嘅 LLM-friendly 特性（markdown + wikilink + local file）—— first principle 角度
- 點出 Pattern A 嘅 key insight：「entire folder = context」

## Limitation
- **Paywall 後嘅 detail（CLAUDE.md specs、MCP setup）attainable 唔到**
- 同其他 Pattern A 一樣 嘅 cons：mix code + personal vault
- 「interview-driven」對新手友善、但對已有 vault 嘅 user 反而要 retrofit
- Single-vault 哲學 implicit、唔 discuss multi-vault scenarios

## How it fits my synthesis
- 補強 [[Vault-as-Everything (Pattern A)]] 嘅 concept page —— vault-as-subfolder 係 Pattern A 嘅 sub-variant
- 「interview-driven setup」啟示：新 project 開始時，可以叫 Claude interview 你（即係而家用 options 揀 pattern 嘅做法）
- 對你已有 vault 嘅 user 啟示：retrofit Pattern A 唔易、繼續 Pattern B + C hybrid 較合理

## My evaluation
- **Medium signal**：core thesis 清晰，paywall 限制全文 access
- **Bookmark 有 archive**（藏 paywall 段落之前嘅 free content）
- **Trust**：tech blog，OK

## Bookmark
- [[whytryai — Build Your Second Brain Claude Code + Obsidian]] — partial archive

## Related
- Concept: [[Vault-as-Everything (Pattern A)]]
- Sibling source: [[mindstudio AI Second Brain Guide]] (similar Pattern A approach, different structure)
- Hub: [[Obsidian]]
