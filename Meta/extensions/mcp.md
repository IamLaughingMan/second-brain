---
type: meta
title: "MCP servers"
para: resource
status: active
created: 2026-06-19
updated: 2026-06-21
tags:
  - meta
  - extensions
  - mcp
---

# MCP servers

Catalog 頁。Hub：[[extensions]]。MCP（Model Context Protocol）server = 畀 Claude Code 額外 tool 的外部進程。**Catalog only** —— server 真身係外部程式（npx / uvx / harness 注入），呢度只記配置同 scope。

## 兩個 config scope

| Scope | 物理位置 | 生效範圍 |
|---|---|---|
| **User（global）** | `~/.claude.json` 嘅 top-level `mcpServers` | 所有 project／session |
| **Project** | `~/.claude.json` → `projects.<path>.mcpServers`（或 project `.mcp.json`） | 淨係嗰個 project |
| **Harness 注入** | 唔喺 `.claude.json`，由 runtime（如 Happy）開 session 時注入 | 該 harness 嘅 session |

## 而家有（2026-06-20 對 `~/.claude.json` 核實）

| Server | Scope | 定義 | tool 前綴 | 用途 |
|---|---|---|---|---|
| **obsidian-vault** | User（全 project） | `npx -y @bitbonsai/mcpvault@latest <vault path>`（stdio） | `mcp__obsidian-vault__*` | 讀寫本 vault：search_notes / read_note / write_note / get_frontmatter / .base 等 |
| **playwright** | User（全 project） | `npx -y @playwright/mcp@latest --browser chrome`（stdio） | `mcp__playwright__*` | JS-capable 無頭瀏覽器：抓 anti-bot／JS-牆站全文（smzdm／知乎／社媒），defuddle/curl 過唔到嘅 fallback。`--browser chrome` = 借系統 Chrome，免 download Chromium。預設 headed（過 bot 挑戰成功率最高） |
| **filesystem** | **Project：`~/AI/Claude/General` 限定** | `npx -y @modelcontextprotocol/server-filesystem /Users/masterdr`（stdio） | `mcp__filesystem__*` | 檔案系統存取（root `/Users/masterdr`） |
| **fetch** | **Project：`~/AI/Claude/General` 限定** | `/opt/homebrew/bin/uvx mcp-server-fetch`（stdio，需 [[Software\|uv/uvx]]） | `mcp__fetch__*` | 抓網頁內容 |
| **happy** | Harness 注入（Happy session） | 由 Happy runtime 開 session 時注入，唔喺 `.claude.json` | `mcp__happy__*` | Happy 整合（如 `change_title`） |

> [!note] Playwright MCP（2026-06-20 裝）
> 為咗抓 **JS bot-wall 站**（smzdm `probe.js` 挑戰、知乎 login/anti-bot）而裝——`defuddle`/`curl`/`WebFetch` 都唔識執行 JS，只攞到挑戰殼。Playwright 開真瀏覽器執行 JS 過挑戰先攞到 rendered 內容，再餵落 bookmark pipeline（cleanup→s2hk）。**MCP server 開 session 時 spawn → 改完要重啟 Claude Code 先載入。** 首次用會 `npx` 拉 package（已預熱 cache）。

> [!warning] smzdm 實測（2026-06-21）= 雙層牆，Playwright 過唔到
> 對 `post.smzdm.com/p/anvwm2e0/` 實測：Playwright **啟動正常**（navigate/evaluate 都 work、借到系統 Chrome），亦**破到第 1 層 `probe.js`**；但 smzdm 跟住升級去**第 2 層騰訊 WAF captcha**（`https://ssl.captcha.qq.com/TCaptcha.js`、`new TencentCaptcha(...)` → POST `/WafCaptcha`），係**互動式滑塊／點選驗證**，headless 自動化**過唔到**，文章 `title`/`body` 一直空。即係**淨靠 Playwright 抓唔到呢篇 smzdm 全文**。修正之前「smzdm = probe.js 單層」嘅假設。Playwright 本身冇壞，對「只得 probe.js／純 JS render」嘅站仍有效。smzdm 剩低 fallback 要使用者出手：(A) 自己瀏覽器過 captcha → copy／Web Clipper clip 落 `Inbox/clippings/` → 再跑 cleanup→s2hk；(B) 只存 URL pointer + 人手摘要，標明「全文受 captcha 牆未抓」。

> [!warning] Scope 陷阱
> `filesystem` / `fetch` **只 scoped 落 `~/AI/Claude/General`**，所以喺**本 vault** session 用唔到佢哋（呢個 session 只見 `obsidian-vault` + `happy`）。CSV 2026-06-04 記嘅 MCP install 就係呢兩個，當時 scope 落 General。若想喺其他 project 用 → 喺嗰個 project 嘅 `mcpServers` 加，或搬上 user-level top-level `mcpServers`。

## Add 一個 MCP server

```bash
# User-level（全 project）：claude mcp add <name> -s user -- <command> <args...>
# Project-level（當前 project）：claude mcp add <name> -- <command> <args...>
# 或直接改 ~/.claude.json 嘅 mcpServers / projects.<path>.mcpServers
```

依賴提醒：`fetch`（`mcp-server-fetch`）靠 `uvx`（uv）；裝喺 [[Software]]。MCP 文檔：https://modelcontextprotocol.io

## 規矩

- 改動 MCP → update 呢頁 + append `wiki/log.md` + 鏡射 CSV（dual-log）+ 手動 commit（`Meta/` 喺 auto-commit hook scope 外）。
- Server 的**底層工具**（如 `uvx`/`npx`）歸 [[Software]]；呢頁只記 **MCP 註冊＋scope**。

## 相關
- [[extensions]] —— 擴充 hub
- [[Software]] —— MCP 底層 CLI（uv/uvx、node/npx）落腳
