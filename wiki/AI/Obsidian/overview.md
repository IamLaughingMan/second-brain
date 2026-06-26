---
type: overview
para: resource
domain: obsidian-ai
title: "Obsidian × AI Integration — Overview"
status: developing
created: 2026-06-26
updated: 2026-06-26
tags:
  - overview
  - obsidian
  - ai
---

# Obsidian × AI Integration — Overview

呢個 sub-area 整理「Claude Code（同其他 agent／MCP client）點同 Obsidian vault 整合做 project workflow」嘅三大主流 pattern + 大神 + 社群實踐。**核心問題**：你 Obsidian vault 已經係 PKM（個人知識管理 / Personal Knowledge Management），新開 code／research project 時 Claude 點同 vault 嘅 knowledge 配合，又**唔好** mix 到 personal note + code git history。

## Type 分佈（2026-06-26 起步，update 同日）

| Type | 數量 | 備註 |
|---|---|---|
| concept | 3 | Pattern A / B / C，三個 mainstream pattern |
| comparison (analyses) | 1 | 全 dimension matrix + decision tree |
| synthesis | 1 | Practical 決策 + Pattern B 詳細 recipe |
| **source** | **5** | starmorph / parazettel / whytryai / mindstudio / jdhwilkins —— 蒸餾 summary，link 返 bookmark 攞 full content |
| **entity** | **5** | ballred / kepano-obsidian / Obsidian Skills / jacksteamdev / iansinnott —— key tools / repos / projects |

**5/5 types 都 ≥1 頁，現已過原 trigger threshold（≥3 types × ≥2 頁）並超出**：entity 5 / source 5 / concept 3、analyses 1 / synthesis 1。
初版（2026-06-26 早段）只有 concept/analyses/synthesis 3 types；同日 user 要求補 sources + entities，遂跑全 5-type Karpathy typed-folder。Bookmark 12 條保留喺 `Bookmarks/AI/Claude Code/Obsidian Integration/` 做 full-content archive layer，wiki entity/source 做蒸餾 layer，per [[project-bookmark-raw-wiki-bridge]] Layer 1 cite-without-promote。

## 主軸（三條結論）

1. **starter-kit 受眾用 Pattern A 為主**（ballred/obsidian-claude-pkm 1.5k★ 為首），原因係「一個 install 全齊」 frictionless；但 Pattern A 違反 kepano「avoid mixing personal + work in same vault」原則，code project 入 vault 會 contaminate git。

2. **講究 separation 嘅 power user 行 Pattern B**（starmorph 認 "simplest" for active coding；你 NMN 已驗證；Theo Stowell 都行呢個）。Trade-off：兩 pointer 要 sync，但 vault 純淨。

3. **MCP 路線（Pattern C）**最 flexible，jacksteamdev/obsidian-mcp-tools + iansinnott/obsidian-claude-code-mcp 提供 vault-side 嘅 MCP server，over WebSocket :22360。Setup 較重，但 vault 完全唔需要 Code 入面 cd into。

## 大神 view

**kepano (Steph Ango, Obsidian CEO)** principles：
- 「Avoid splitting content into multiple vaults」（少做 vault 拆分）
- 「Avoid folders for organization」（properties + Bases 行先）
- 但**佢自己**：published site (Hugo) 用獨立 vault → 即係 scope 改變嗰陣，破自己規則係 OK
- 出咗官方 **Obsidian Skills**（kepano-built，35.9k★）= `obsidian-markdown` / `obsidian-bases` / `json-canvas` / `obsidian-cli` / `defuddle`，你已裝（per `Meta/extensions/skills.md`）

**Andrej Karpathy（你 vault 主軸來源）** view：
- LLM 當 compiler、人做 curation
- 適用喺 Pattern A 嘅 vault 內 compounding，但同 code project 嘅 git workflow 兩個 concern

**Andy Matuschak（evergreen notes）** 影響：
- 同 Pattern B 嘅「agents read, humans write」原則 align —— vault 內容由人沉澱、AI 唔應該直接 populate

## Gap / 未做

- ~~**Sources 0 頁**~~ —— 2026-06-26 同日補咗 5 篇蒸餾 source page；剩 stephango.com vault / educalvolopez Obsidian Agents / dev.to stevengonsalvez Obsidian Skills review 3 篇 bookmark 暫無對應 wiki source（lower signal、可日後補）
- ~~**Entities 0 頁**~~ —— 同日補咗 5 個 entity page；剩 Theo Stowell（人）/ Steph Ango（人）等個別人物 entity 未起，因 covered by parent kepano-obsidian / parazettel source
- **Multi-AI integration（Codex/Cursor/Gemini）**：而家 focus Claude；其他 AI agent 嘅 vault integration 未 cover，可以開 [[Codex × Obsidian Integration]] 等 sibling concept page
- **Plugin 開發 angle**：Obsidian plugin development by AI（agent-assisted plugin coding）冇 covered，獨立 topic
- **Bookmark Layer-2 promote**：12 條 bookmark 暫停喺 Layer 1（cite without raw/）；如果某 article 變成持續引用嘅 source-of-truth 就做 Layer-2（defuddle → `raw/articles/` → wiki source page）

## 連同你 vault 嘅 prior art

| Vault 已有 | 對應呢個 sub-area | Pattern |
|---|---|---|
| `Claude history/` Stop hook | 自動 mirror conversations 入 vault（per-turn） | Hybrid A（vault 內動作）+ separate state file at `~/.claude/state/` |
| Vault 自身 `.claude/settings.json` PostToolUse auto-commit | wiki/raw 改動自動 commit | Pattern A 嘅典型 |
| NMN project | External repo + vault `Projects/NMN (project).md` 用 `code_path:` 互指 + `Business/NMN/` 知識層 | **Pattern B 純粹實作** |
| `Recording Claude Conversations in Obsidian` | Methodology 文（root flat、`domain: pkm`） | Methodology research，未必算 pattern |

→ 你 vault 已經係**多 pattern 並存**。新開 project 跟邊個 pattern，視乎 project 性質。
