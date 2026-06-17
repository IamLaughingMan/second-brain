---
type: bookmark
para: resource
domain: ai-tools
title: "ccusage"
url: "https://github.com/ccusage/ccusage"
status: active
created: 2026-06-17
updated: 2026-06-17
related:
  - "[[usage (menu bar 用量工具)]]"
  - "[[Claude Code History Viewer]]"
tags:
  - bookmark
  - found-by-claude
  - ai-tools
  - claude-code
  - usage-tracking
  - cli
---

# ccusage

- URL: https://github.com/ccusage/ccusage
- Saved date: 2026-06-17
- Topic: 終端機 token 用量 / 成本分析 CLI（多 coding-agent）
- Status: active（**未安裝**——記低作 menu-bar `usage` 嘅終端替代 / 對照）

## Why I saved this

之前傾用量工具時提到嘅熱門替代品。佢係 CLI（npx／bunx 即跑、唔使 global install），同 menu bar `usage` 互補：一個常駐 menu bar，一個臨時喺終端拉 report。記低方便日後比較揀邊個。

## Summary

- **係咩**：terminal 工具，分析多個 coding-agent CLI（Claude Code、GitHub Copilot 等）嘅 token 用量同成本。
- **報表**：daily / weekly / monthly / session，含 model tracking、cost breakdown、按日期或 project filter。
- **作者／License**：`@ryoppippi`（repo 現為 `ccusage/ccusage` org）・ MIT ・ 主語言 Rust（89.7%）。
- **Stars**：~16.3k（截至 2026-06-17）。

## Key Takeaways

- 安裝：`npx ccusage@latest`、`bunx ccusage`、或 `nix run github:ccusage/ccusage`——免 global install。
- 同 `usage` app 一樣讀本機 data，唔使 API。
- 適合想要可 scripting / CI 拉數嘅情境。

## My Notes

（待補：若想試，`npx ccusage@latest` 即跑，同 menu bar `usage` 對照睇邊個順手。）

## Related
- [[usage (menu bar 用量工具)]]
- [[Claude Code History Viewer]]
- [[Bookmarks]]
