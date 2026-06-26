---
type: entity
para: resource
domain: obsidian-ai
title: "jacksteamdev/obsidian-mcp-tools"
status: active
created: 2026-06-26
updated: 2026-06-26
tags:
  - entity
  - obsidian
  - mcp
  - plugin
  - pattern-c
---

# jacksteamdev/obsidian-mcp-tools

## What it is
**Obsidian community plugin** 提供 MCP (Model Context Protocol) server，俾任何 MCP client（Claude Code、Cursor、Codex、Claude Desktop）從外部 cwd query／read／write Obsidian vault content。重點 feature 係 **semantic search** 同 **custom Templater prompts**。係 [[Unified via MCP (Pattern C)]] 嘅核心 building block。

## Pattern alignment
- **Primary**：[[Unified via MCP (Pattern C)]] — vault-side MCP server，俾 code session 跨 cwd reach vault
- **Augments**：[[Linked Repo + Vault (Pattern B)]] — Pattern B 嘅最大痛點係 Claude 喺 repo session 唔見 vault context；裝呢個就解決

## Key facts
- **Repo**：`jacksteamdev/obsidian-mcp-tools` on GitHub
- **Type**：Obsidian community plugin（喺 Obsidian Settings → Community plugins install）
- **Provides**：MCP server in Obsidian (over WebSocket port 22360, similar to iansinnott 嘅 plugin)
- **Distinguishing feature**：**Semantic search** vault notes（vs grep / wikilink，semantic 用 embedding 搵概念相近，唔限關鍵字）
- **Custom Templater prompts**：agent 可以喺 vault context 入面 trigger Templater
- **Client compatibility**：MCP protocol-agnostic（任何 MCP client）

## Why it matters
- **解 Pattern B 嘅 vault-context bottleneck**：你 code session 唔再需要 cd vault 或者 manual `cat` 個 decision log
- **Semantic search > grep**：vault 大（500+ notes）時，grep 唔夠精準；semantic 搵到「同概念但唔同 wording」嘅 note
- **Templater integration**：agent 可以自動 trigger 你 vault 嘅 template（如「create new project (project)」），減少手動步驟
- **MCP protocol-agnostic**：你日後試 Codex/Cursor 都 work，唔 lock-in Claude

## Limitation
- **Plugin dependency**：Obsidian update / plugin abandoned 時可能 break
- **Obsidian must be running** —— 如果你 quit Obsidian、MCP server down、agent reach 唔到 vault
- **Setup 較複雜**：要 ① 裝 plugin ② 喺 Claude config 加 MCP server entry ③ 重啟 Claude session (settings load at start)
- **Permission boundary 要 vet**：default 可能太大、agent 可以全 vault read/write；要 review plugin code
- **Embedding 質素 vary**：semantic search 結果視乎 plugin 用嘅 model

## 對你嚟講
- **你而家有同類嘅 `mcp__obsidian-vault__*` user-level MCP server**（read/write/search vault）—— 但係**唔係 semantic search**，係 keyword-based
- 加 jacksteamdev plugin **可獲得**：(1) semantic search 升級；(2) Templater 自動化
- **唔加都 OK**：你 vault 而家規模、grep + wikilinks 仲夠快；當 vault 過 500+ note 才有 net benefit
- **如要試**：搵閒時 install + 試一星期，量度 search 速度 vs `mcp__obsidian-vault__*`

## Comparison vs sibling MCP plugin
- **[[iansinnott obsidian-claude-code-mcp]]** — 純 Claude Code-targeted, simpler；jacksteamdev tools 更通用 + 多 features (semantic, Templater)
- 可以同時裝（兩個 MCP server，各自 port），但通常揀一個

## Source bookmark
- [[jacksteamdev obsidian-mcp-tools — MCP Server]] — full archive

## Related
- Sibling entity: [[iansinnott obsidian-claude-code-mcp]]
- Companion entity: [[Obsidian Skills (kepano)]] — Skills 教 agent 點處理 vault content；MCP 俾 agent 拎到 content
- Pattern: [[Unified via MCP (Pattern C)]]
- Hub: [[Obsidian]]
