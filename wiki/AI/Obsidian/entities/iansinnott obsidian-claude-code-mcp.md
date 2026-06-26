---
type: entity
para: resource
domain: obsidian-ai
title: "iansinnott/obsidian-claude-code-mcp"
status: active
created: 2026-06-26
updated: 2026-06-26
tags:
  - entity
  - obsidian
  - mcp
  - plugin
  - pattern-c
  - claude-code
---

# iansinnott/obsidian-claude-code-mcp

## What it is
**Obsidian community plugin** 專為 Claude Code 設計嘅 MCP bridge —— 喺 vault 內 run 一個 WebSocket server (port 22360)，等 Claude Code 從任何 cwd 透過 discovery mechanism 自動 reach 到 vault content。比 [[jacksteamdev obsidian-mcp-tools]] simpler、Claude-Code-targeted。

## Pattern alignment
- **Primary**：[[Unified via MCP (Pattern C)]] — vault-side WebSocket MCP server
- **Specifically optimized for Claude Code**（jacksteamdev 嘅 obsidian-mcp-tools 係 client-agnostic、呢個係 Claude-first）

## Key facts
- **Repo**：`iansinnott/obsidian-claude-code-mcp` on GitHub
- **Type**：Obsidian community plugin
- **Protocol**：WebSocket :22360（同 jacksteamdev 一樣 port——可能會 conflict 如果兩個一齊裝）
- **Discovery**：Claude Code 自動 discover by WebSocket scan / config entry
- **Reference 自**：starmorph integration guide Strategy 3（[[starmorph integration guide]]）
- **Author**：Ian Sinnott

## Why it matters
- **Pattern C 最直接嘅 Claude Code path**：starmorph blog 明文推 呢個 plugin 做 Strategy 3 嘅核心
- **Simpler 過 jacksteamdev**：純 vault bridge，無 semantic search / Templater 等 extra；setup 較快
- **WebSocket** 對比 stdio／HTTP MCP transport，**支援 long-lived connection**，agent 同 vault 嘅 round-trip 較 efficient

## Limitation
- **Claude-Code-specific**：對其他 MCP client（Cursor、Codex）兼容性未必有 jacksteamdev 高
- **Port collision** ：22360 同 jacksteamdev tools 一樣 port，兩個唔好同時裝（or 改 config port）
- **Feature 比 jacksteamdev 少**：無 semantic search、無 Templater integration
- **Maintenance velocity 未知**：要 check repo 最近 commit 活躍度

## When to choose this over jacksteamdev/obsidian-mcp-tools

| 揀 | 用 iansinnott | 用 jacksteamdev |
|---|---|---|
| Setup 速度 | ✅ 簡單 | 較複雜 |
| Pure Claude Code | ✅ 直接 | OK |
| 需要 semantic search | ❌ 冇 | ✅ 有 |
| Multi-client (Cursor / Codex) | 較 risky | ✅ 純 MCP |
| Vault 大 (500+ note) | 適合 simple bridge | ✅ semantic search 有 net benefit |

## My take
- **starter Pattern C choice**：如果你想試 MCP 但唔想複雜，先 iansinnott
- 如果你發現 vault 大 + 需要 semantic search → 升 jacksteamdev
- **你而家有 `mcp__obsidian-vault__*` user-level MCP** 已經 cover 基本 read/write/search，呢兩個 Obsidian 內 plugin 係加強層
- **真試嘅成本**：~30 分鐘 setup + 1 週試用、量度 vs 現狀

## Source bookmark
- [[iansinnott obsidian-claude-code-mcp — WebSocket Bridge]] — full repo archive
- [[starmorph — Obsidian + Claude Code Integration Guide]] — 推薦來源（Strategy 3）

## Related
- Sibling entity: [[jacksteamdev obsidian-mcp-tools]]
- Concept: [[Unified via MCP (Pattern C)]]
- Source: [[starmorph integration guide]]
- Hub: [[Obsidian]]
