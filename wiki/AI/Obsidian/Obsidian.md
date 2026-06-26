---
type: moc
para: area
domain: obsidian-ai
title: "Obsidian × AI Integration"
status: developing
created: 2026-06-26
updated: 2026-06-26
tags:
  - moc
  - obsidian
  - ai
---

# Obsidian × AI Integration

Claude Code、agents、MCP 同 Obsidian vault 嘅整合 pattern 研究 hub。屬 [[AI]] 子領域，典型 typed-folder layout（`concepts/`、`analyses/`、`synthesis/`），sources/entities 暫用 `Bookmarks/AI/Claude Code/Obsidian Integration/` 提供（per [[project-bookmark-raw-wiki-bridge]] Layer 1，唔重複造 wiki source）。

## Overview
- [[AI/Obsidian/overview|overview]] —— sub-area 嘅 catalog-narrative（type 分佈 + gap）

## Dynamic view
- `Obsidian.base` —— `.base` view（filter `domain: obsidian-ai`，path-independent；per [[project-obsidian-base-syntax-gotchas]] 用 structured `groupBy`）

## Concepts（3 個 mainstream pattern）
- [[Vault-as-Everything (Pattern A)]] —— Claude Code 直接喺 vault folder run；starter-kit 最多 star，但 mix code + personal
- [[Linked Repo + Vault (Pattern B)]] —— Code 喺 repo run、vault 分開；`code_path:` 雙向 pointer；你 NMN 用緊呢個
- [[Unified via MCP (Pattern C)]] —— MCP server bridge vault；最 flexible 最高 setup 成本

## Analyses
- [[Claude + Obsidian Workflow Pattern Comparison]] —— 三 pattern 全 dimension matrix + decision tree

## Synthesis
- [[Claude + Obsidian Project Workflow]] —— 揀 pattern 嘅 practical 決策 + Pattern B 詳細 recipe（recommended for code projects）

## Entities（key tools / repos / projects）
- [[ballred-obsidian-claude-pkm]] —— Pattern A starter kit (1.5k★)，4 agents + 10 slash commands
- [[kepano-obsidian]] —— 大神 vault template (kepano = Obsidian CEO)，minimal folder + properties-over-folders
- [[Obsidian Skills (kepano)]] —— 官方 agent skill kit (35.9k★)；你已裝；obsidian-markdown / bases / cli / canvas / defuddle
- [[jacksteamdev obsidian-mcp-tools]] —— Pattern C MCP server plugin (semantic search + Templater)
- [[iansinnott obsidian-claude-code-mcp]] —— Pattern C 純 Claude-Code MCP bridge (WebSocket :22360, simpler)

## Sources（long-form articles / guides）
- [[starmorph integration guide]] —— 3 strategies framework（呢個 vault A/B/C concept 嘅來源）
- [[parazettel Theo Stowell]] —— B + C hybrid practitioner，single vault + Hugo repo
- [[whytryai Build Second Brain]] —— Pattern A vault-as-subfolder variant，interview-driven setup
- [[mindstudio AI Second Brain Guide]] —— Pattern A 7-folder + CLAUDE.md 5-component template
- [[jdhwilkins AI Task System]] —— Pattern A 嘅 custom-skill task system，skill atop CLI pattern

## Related external
- 你嘅 vault 本身 = Pattern A + B 混合實作（[[Recording Claude Conversations in Obsidian]] 屬呢類）
- NMN project = Pattern B 純粹實作（external repo + `Projects/NMN (project).md` + `Business/NMN/`）

## 規矩
- 原 typed-folder trigger（≥3 types × ≥2 頁）未到、但 user 明示要 typed structure → override；**5 個 type 全部至少 ≥1 頁**：synthesis (1) / analyses (1) / concepts (3) / entities (5) / sources (5)
- entities + sources 唔重複 bookmark 全文 archive；page = 蒸餾 summary + link 返 [[<bookmark>]] 攞 full content（[[project-bookmark-raw-wiki-bridge]] Layer 1）
- 命名沿用「全 vault unique」原則；唔同 type 嘅 page 用唔同 stem 區分（如 entity `kepano-obsidian` vs source `stephango.com vault`）
