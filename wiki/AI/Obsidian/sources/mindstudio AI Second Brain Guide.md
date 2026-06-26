---
type: source
para: resource
domain: obsidian-ai
title: "mindstudio — AI Second Brain Guide (Complete)"
status: active
created: 2026-06-26
updated: 2026-06-26
tags:
  - source
  - obsidian
  - ai
  - pattern-a
  - guide
---

# mindstudio — AI Second Brain Guide (Complete)

## Source
- **Author / Publication**：mindstudio.ai blog
- **Type**：Comprehensive setup guide
- **URL**：`mindstudio.ai/blog/build-ai-second-brain-claude-code-obsidian`
- **Bookmark**：[[mindstudio — Build AI Second Brain Guide]]

## Core thesis
Pattern A 嘅典型 7-folder vault structure（Inbox / Projects / Areas / Resources / Archive / **AI** / Templates）+ Claude Code 喺 vault 內 run + CLAUDE.md 5-component 模板。**「The more specific you are about your context, your vault's conventions, and your expectations for each session, the more accurate and useful the agent's outputs will be」** —— 強調 CLAUDE.md specificity 嘅 importance。

## Key claims / takeaways

1. **7-folder vault 結構**：
   - **Inbox**：quick capture + 未 process
   - **Projects**：active project folders
   - **Areas**：ongoing responsibilities (PARA convention)
   - **Resources**：reference material by topic
   - **Archive**：completed work
   - **AI**：agent outputs + session logs（unique addition vs traditional PARA）
   - **Templates**：reusable note templates

2. **Claude Code working dir = vault**：
   - `cd ~/Documents/MyVault && claude`
   - 「Agent 唔需要 separate repository setup」

3. **CLAUDE.md 5 個 component**（必填）：
   - **Personal Context** — role、work type、goals
   - **Vault Structure Guide** — folder description + naming convention
   - **Session Protocol** — startup tasks（read daily notes、check inbox）+ closing tasks（write summary）
   - **Tone & Preferences** — output format expectation
   - **Available Tools** — scripts / capabilities

4. **Frontmatter convention**：`created` / `tags` / `status` / `related` (with wikilinks)

5. **Specificity 原則**：CLAUDE.md 越具體 → agent output 越準

## Pattern correspondence
- **Primary**：[[Vault-as-Everything (Pattern A)]]
- 「AI/」folder 變奏：明示 AI-generated content 同 personal content 分 folder（部分解 Pattern A 嘅 mix 問題）

## Strength
- **CLAUDE.md 5-component 模板最 structured**（vs 其他 source 講籠統）
- 「AI/」folder convention 係解 Pattern A 「Agents read, humans write」原則嘅 implementation
- Session protocol（startup + closing）係 actionable
- 7-folder PARA + AI extension align 你 vault 嘅 `Inbox/`、`Projects/`、`Areas/`、`Bookmarks/`、`Meta/` structure

## Limitation
- 仍然係 Pattern A vault-as-cwd（同其他 cons）
- 「AI/」folder 只係 partial 解 mix problem —— code project 仲係喺 vault git
- 冇 cover 商業 / sensitive data scenario
- Blog post format、無 GitHub repo backing（vs ballred 有 active maintained kit）

## How it fits my synthesis
- 強化 [[Vault-as-Everything (Pattern A)]] 嘅 concept page —— 7-folder + AI subfolder 係 Pattern A 嘅 mature variant
- **CLAUDE.md 5-component template** 可以 inform 你日後寫 project CLAUDE.md（Pattern B 嘅 repo-side CLAUDE.md 或 vault Project (project).md）
- 「AI/」folder 啟示：你 vault 已有 `Claude history/` folder 做 AI conversation archive，等於 mindstudio AI/ folder 概念 —— **你 vault 已 partially 實踐**

## My evaluation
- **High signal** —— CLAUDE.md 5-component 模板實用、可直接 borrow
- **Bookmark 必留**（21.6KB full archive）
- **Trust**：corporate blog (mindstudio.ai)，content 質素高

## Bookmark
- [[mindstudio — Build AI Second Brain Guide]] — full archive

## Related
- Concept: [[Vault-as-Everything (Pattern A)]]
- Sibling source: [[whytryai Build Second Brain]] (similar Pattern A 範疇)
- Sibling source: [[jdhwilkins AI Task System]] (Pattern A 嘅 task-system 變奏)
- Entity: [[ballred-obsidian-claude-pkm]] (starter kit version of Pattern A)
- Synthesis: [[Claude + Obsidian Project Workflow]]
- Hub: [[Obsidian]]
