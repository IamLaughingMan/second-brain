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

## Related external
- 你嘅 vault 本身 = Pattern A + B 混合實作（[[Recording Claude Conversations in Obsidian]] 屬呢類）
- NMN project = Pattern B 純粹實作（external repo + `Projects/NMN (project).md` + `Business/NMN/`）

## 規矩
- 暫未到 typed-folder 原 trigger（≥3 types × ≥2 頁）—— user 明示要 typed structure，override；synthesis/concepts/analyses 各 ≥1 頁先建夾，entities/sources 未起（用 bookmarks 代）
- 命名沿用「`<Pattern Name>` 全 vault unique」原則
