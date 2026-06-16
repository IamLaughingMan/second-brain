---
type: bookmark
para: resource
title: "Ponytail"
url: "https://github.com/DietrichGebert/ponytail"
status: active
created: 2026-06-17
updated: 2026-06-17
related:
  - "[[Karpathy LLM Wiki Pattern]]"
tags:
  - bookmark
  - ai-tools
  - coding-agents
  - yagni
  - prompt-engineering
---

# Ponytail

- URL: https://github.com/DietrichGebert/ponytail
- Saved date: 2026-06-17
- Topic: AI coding-agent ruleset（minimalist coding philosophy）
- Status: active

## Why I saved this

一套俾 AI coding agent 用嘅 ruleset，核心理念係「最好嘅 code 就係你冇寫過嘅 code」。同我自己 `CLAUDE.md` 嘅 **Simplicity First / Surgical Changes** 原則同 [[Karpathy LLM Wiki Pattern]] 嘅 minimalism 思路一脈相承，值得參考點樣將呢套規矩 encode 入 agent。

## Summary

- **係咩**：一個 decision-hierarchy ruleset，注入 AI coding agent，令佢寫 code 前先考慮現成方案。
- **次序**：跳過唔需要嘅 feature（YAGNI）→ 用 standard library → 用 native platform feature → 用已裝 dependency → 寫 one-liner → 最後先寫最少量 custom code。
- **聲稱效果**：比 baseline agent 少 80–94% code、快 3–6×。
- **主語言**：JavaScript（93.3%）。
- **License**：MIT ・ **Stars**：~23.5k（截至 2026-06-17）。

## Key Takeaways

- 三種整合模式：`lite` / `full` / `ultra` / `off`。
- 內置 command：`/ponytail-review`（code review）、repo audit、tech-debt tracking。
- 兼容 13+ agent：Claude Code、Codex、GitHub Copilot CLI、Cursor 等。
- 用 lifecycle hooks + skill-based command system。
- Topics：developer-tools, ai-agents, claude, yagni, llm, prompt-engineering, agent-skills, cursor-rules。

## My Notes

（待補：試下 `lite` 模式落 Claude Code，睇同我現有 CLAUDE.md 規則有冇衝突／互補。）

## Related
- [[Karpathy LLM Wiki Pattern]]
- [[Bookmarks]]
