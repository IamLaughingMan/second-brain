---
type: concept
para: resource
domain: obsidian-ai
title: "Unified via MCP (Pattern C)"
status: developing
created: 2026-06-26
updated: 2026-06-26
tags:
  - concept
  - obsidian
  - ai
  - mcp
  - claude-obsidian-workflow
---

# Unified via MCP (Pattern C)

## Definition
**Claude Code 喺 repo folder run（同 Pattern B 一樣）**，但 Obsidian vault 入面 run 緊一個 **MCP（Model Context Protocol）server**（typically Obsidian plugin 形式），令 Claude／其他 MCP client 從任何 cwd 都可以 query／read／write vault content。等於 Pattern B 嘅 separation + Pattern A 嘅 vault context access，兩邊好處夾埋。

## How it works

```
~/code/myproj/                         ← Claude Code cwd（同 B）
├── CLAUDE.md                           ← reference 「vault available via MCP」
├── src/
└── ...

~/AI/Claude/second-brain/             ← vault
├── .obsidian/plugins/
│   ├── obsidian-claude-code-mcp/      ← iansinnott plugin，listens WebSocket :22360
│   └── obsidian-mcp-tools/             ← jacksteamdev plugin，加 semantic search + Templater
└── ... (vault content)
```

Claude 透過 MCP 拎 vault：
```
# 喺 ~/code/myproj/ 入面
claude
> 「揾 vault 入面所有同 NMN 有關 decision」
# Claude 經 MCP server 查 vault、return matched notes，唔需要 cd into vault
```

## MCP server 選擇（2026-06 為止）

| Plugin / Server | 功能 | 來源 |
|---|---|---|
| **[[iansinnott obsidian-claude-code-mcp]]** | Vault WebSocket 服務器（:22360）；Claude Code discover by WebSocket | github.com/iansinnott/obsidian-claude-code-mcp |
| **[[jacksteamdev obsidian-mcp-tools]]** | Semantic search + custom Templater prompts → 任何 MCP client | github.com/jacksteamdev/obsidian-mcp-tools |
| **Obsidian Skills (kepano, 35.9k★)** | 不算 MCP，但係 official Skill kit 教 agent 點 work with Obsidian markdown / Bases / Canvas / CLI / Defuddle；可同 MCP 並用 | 官方 by kepano |
| **`obsidian-vault` MCP server**（你裝咗） | `mcp__obsidian-vault__*` tools，read/write/search vault；user-level config | 你已經喺 `~/.claude/settings.json` 設咗 |

## Pros

- **Code git 純淨**（同 B 一樣）
- **Vault content 喺 code session 即時可 reach**（解決 B 嘅最大痛點：context 要 manual paste）
- **MCP 跨 client**：唔 lock-in Claude Code；Cursor、Codex、其他 MCP client 都 work（per [[AGENTS]] convention）
- **Semantic search**（jacksteamdev tools）令 vault 變 query-able knowledge base、唔淨係 file tree
- **Vault 不需被 cd into** —— `~/AI/Claude/second-brain` 永遠 read by MCP，唔影響你 Code 嘅 working dir

## Cons

- **Setup 最複雜**：要裝 plugin、開 Obsidian、確認 WebSocket port 通、Claude config 加 MCP server entry
- **Plugin dependency** —— Obsidian update 後 plugin 可能 break；third-party plugin 可能 abandoned
- **WebSocket 偶有 disconnect** —— Obsidian 唔係 always-on（如果 close 咗 Obsidian，MCP 就 down）
- **Permission boundary 模糊** —— MCP server 預設權限可能太大；要 vet
- **Privacy** —— MCP server 暴露 vault 內容俾 Claude，雖然係 local，但需要明 plugin code in case 將來變 cloud-relay
- **Debugging 多一層**：問題唔 work 時要 check plugin log + MCP log + Claude log
- **Obsidian Skills（kepano）≠ MCP**：易混淆；Skills 係 教 agent 點 work with files，MCP 係 server protocol。可以兩個一齊用

## When to use

✅ Pattern B 已穩定，再加 vault context access  
✅ 多 project 平行、想避免 context-switch open vault Code session  
✅ Power user 願意 maintain plugin setup  
✅ 需要 semantic search vault（vault 大、grep 唔夠）

❌ Setup 時間有限／新手  
❌ Project 一次性／short-lived  
❌ Vault 細／grep + wikilinks 夠用

## Real-world examples

| 項目 | 備註 |
|---|---|
| [[starmorph integration guide]] | Strategy 3 用 MCP；同 Strategy 1（B）相比，明寫「最 flexible 但 setup cost 高」 |
| [[Theo Stowell parazettel]] | 用「Obsidian-mcp plugin」+「Claude Code community plugin」雙 layer，自家 vault + 自家 website repo |
| [[SMU Library Claude Desktop + Obsidian MCP]] | 學術機構推 MCP path：Claude Desktop（唔係 Code）+ Obsidian MCP plugin = no-Code knowledge query |
| **你而家 setup** | `mcp__obsidian-vault__*` user-level MCP server（read/write/search vault）已裝；可以從任何 cwd reach vault。基本上你已經有 Pattern C 嘅基礎 layer |

## Setup outline

```bash
# Step 1: 喺 Obsidian 裝 MCP plugin
#   Settings → Community plugins → search "Claude Code MCP" or "MCP Tools"
#   Enable

# Step 2: 喺 Claude Code config 加 MCP server entry
#   ~/.claude/settings.json 或 vault .claude/settings.json
{
  "mcpServers": {
    "obsidian-vault": {
      "type": "stdio",
      "command": "...",
      "args": [...]
    }
  }
}

# Step 3: 重啟 Claude Code session（settings load 喺 session start）

# Step 4: 用 mcp__obsidian-* tools 從 code session reach vault
```

## Hybrid 觀察
- Pattern B + Pattern C 通常一齊用：Pattern B 做 file/git separation，Pattern C 做 cross-context query
- 你已經行緊 hybrid：`mcp__obsidian-vault__*` MCP 加 NMN Model B
- 唔需要 100% 揀一個 pattern

## Comparison cross-reference
- [[Vault-as-Everything (Pattern A)]] —— 用 vault-as-cwd 換 frictionless
- [[Linked Repo + Vault (Pattern B)]] —— Pattern C 嘅 underlying file 結構
- [[Claude + Obsidian Workflow Pattern Comparison]] —— 全 dimension matrix
- [[Claude + Obsidian Project Workflow]] —— synthesis
