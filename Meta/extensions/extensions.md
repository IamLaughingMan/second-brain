---
type: moc
title: "Extensions"
para: resource
status: active
created: 2026-06-17
updated: 2026-06-19
tags:
  - moc
  - extensions
  - meta
---

# Extensions

統稱「擴充」—— Claude Code 同 Obsidian 嘅 **skills / plugins / hooks**（將來可加 MCP servers、statusLine 等）。呢度係 hub 目錄頁，**catalog only**：真實 code／config 嘅物理位置寫死喺各 tool spec，唔搬入 vault。

## 三類擴充（hub）

- [[skills]] — agent skills（Anthropic spec）：plugin-bundled / project-level（`.claude/skills/`）/ user-level（`~/.claude/skills/`）
- [[plugins]] — Obsidian plugins（`.obsidian/plugins/`）+ Claude Code plugins（`~/.claude/plugins/`）
- [[hooks]] — Claude Code hooks（`*/settings.json`：PostToolUse / UserPromptSubmit / Stop / statusLine 等）

## 規矩

- **唔搬真身入 vault**：每類嘅物理載入路徑都由 tool spec 寫死（例 Claude Code 嘅 `.claude/skills/`），呢個 folder 只係 catalog／文檔。
- **新增／更新／移除一個 extension** → 同時 update 對應嘅 catalog 頁 + append `wiki/log.md`（HKT）+ 鏡射全局 CSV（雙 log 規矩）。
- **Meta/ 喺 auto-commit hook scope 外** → 改完手動 `git commit`。
- **Source-of-truth 順序**（睇邊個 layer 寫過呢樣嘢）：parent `~/AI/Claude/CLAUDE.md` → vault `CLAUDE.md` → 呢度 catalog → memory。
