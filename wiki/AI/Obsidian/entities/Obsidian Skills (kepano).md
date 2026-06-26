---
type: entity
para: resource
domain: obsidian-ai
title: "Obsidian Skills (kepano, official)"
status: active
created: 2026-06-26
updated: 2026-06-26
tags:
  - entity
  - obsidian
  - kepano
  - skills
  - claude-code
---

# Obsidian Skills (kepano, official)

## What it is
**Obsidian 官方 Agent Skill 套裝**，由 kepano (Steph Ango, Obsidian CEO) 親手寫，35.9k★。教 AI agent（Claude Code、Codex、其他 MCP client）點正確處理 Obsidian-flavored content。Free + MIT license。**你已經裝咗**（per `Meta/extensions/skills.md` plugin layer）。

## 5 Skills 內容
| Skill | 教 agent 點 work with |
|---|---|
| **obsidian-markdown** | `[[wikilinks]]`、callouts (`> [!note]`)、frontmatter YAML、tags、embeds、Obsidian-flavored Markdown syntax |
| **obsidian-bases** | `.base` 結構（typed properties、filter、sort、view）；agent 可以生 CRM table、sprint tracker、research database |
| **obsidian-cli** | Obsidian command-line interface；route file ops through CLI 避免 broken link |
| **json-canvas** | `.canvas` 嘅 JSON 格式；agent 可建 node/edge/group/spatial layout，Obsidian render 做 interactive whiteboard |
| **defuddle** | Clean markdown extraction from web pages；你嘅 bookmark pipeline 全程靠呢個 |

## Key facts
- **Stars**：35.9k★（全 vault 提及 AI integration 入面最高 star）
- **License**：MIT
- **Author**：kepano / Steph Ango（Obsidian CEO）
- **Distribution**：Obsidian community plugin `obsidian@obsidian-skills`
- **Agent-agnostic**：唔 lock-in Claude Code；任何 MCP-compatible agent 都用得

## Pattern alignment
- **All 3 patterns 都用得到**（A/B/C），因為 Skills 係 capability layer，唔 prescribe vault 結構
- 對 [[Unified via MCP (Pattern C)]] 特別有用：MCP client 透過 obsidian-bases / obsidian-cli skill 直接 query/update vault
- 對 [[Linked Repo + Vault (Pattern B)]] 嘅 vault-side ops 有幫助：你 manual edit vault 時 Claude 借 obsidian-markdown skill 識用對嘅 syntax

## Why it matters
- **大神 backing + 官方身份** = 最高 trust level；唔似 third-party plugin 可能 abandon
- **35.9k★ velocity** 證明 community-validated；唔係 niche tool
- **CEO-built** = 同 Obsidian 內部設計方向 align，未來 Obsidian update 唔會 break
- 教 agent 唔淨係 read/write，**識用 Obsidian 內部結構**（Bases、Canvas、CLI）—— 比 generic markdown 操作 capable

## 對你 vault 嘅實際用途
- **defuddle**：你 bookmark pipeline cleanup 嘅核心（per [[feedback-bookmark-archive-fulltext]]）
- **obsidian-bases**：你 `Bookmarks.base`、`Periodontal Disease.base`、`Obsidian.base` 全部識編
- **obsidian-markdown**：你 vault Karpathy compounding 嘅 `[[wikilink]]` + frontmatter convention 由佢教 agent
- **obsidian-cli**：你 vault 操作經 CLI 有時用（query notes, batch update frontmatter）
- **json-canvas**：暫時冇用緊（你冇 active canvas），但係 capability 喺度

## Limitation
- Skill ≠ MCP server；佢教 agent 點處理 content，但 agent 仲係要喺 vault 入面或者透過 MCP 拎到 vault 先用得到
- 對唔識 plugin install 嘅新手有 setup barrier
- 個別 skill 文檔較簡，需要 agent 自己探索

## My take
- **必裝**（已裝）；vault 嘅 PKM workflow 同 LLM compatibility 嘅 backbone
- **配 jacksteamdev obsidian-mcp-tools 用最好**（Pattern C 全套）：Skills 教 agent 點處理，MCP 俾 agent 拎到 content
- 如果以後 Obsidian update Bases / Canvas 大改，跟 Skills 嘅 update 就好

## Source bookmark
- [[dev.to stevengonsalvez — Obsidian Skills (kepano)]] — 入門 review

## Related
- Companion entity: [[kepano-obsidian]] vault template
- Companion entity: [[jacksteamdev obsidian-mcp-tools]] — MCP layer，complement Skills
- Pattern: 跨 A/B/C 都用得到
- Hub: [[Obsidian]]
