---
type: bookmark
para: resource
domain: pkm
title: "karpathy - LLM Wiki gist"
url: "https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f"
status: active
created: 2026-06-17
updated: 2026-06-17
related:
  - "[[Karpathy LLM Wiki Pattern]]"
  - "[[Bookmarks]]"
tags:
  - bookmark
  - pkm
  - llm-wiki
  - karpathy
  - methodology
  - foundational
---

# karpathy - LLM Wiki gist

- URL: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- 標題：**LLM Wiki**
- 作者：Andrej Karpathy
- 發表：2026-04-04
- Saved date: 2026-06-17
- Topic: 用 LLM 維護個人知識庫嘅 pattern（**本 vault 嘅 foundational source**）
- Status: active

## Why I saved this

呢個係本 vault 整體方法論嘅一手 source —— Karpathy 寫嘅原始 spec。所有後續延伸（DAIR.ai 解說、本 vault `wiki/Karpathy LLM Wiki Pattern.md`、`Meta/docs/OBSIDIAN-SETUP.md`）都係由呢度推演出嚟。

## Summary（一手原文重點）

**核心 idea：** RAG 每次都要 re-derive；唔好。改用 LLM 維護一個**持續累積（compounding）**嘅 wiki —— 新 source 嚟到 LLM 增量更新已有頁、cross-reference、矛盾 flag。Obsidian = IDE、LLM = programmer、wiki = codebase。

**3 層架構（NOT folder tree —— 概念層）：**
1. **Raw sources** — 不可變來源
2. **The wiki** — LLM 寫嘅 markdown 目錄
3. **The schema** — `CLAUDE.md` 或 `AGENTS.md`（行為 spec）

**3 個操作（NOT 4）：**
- **Ingest** — 新 source → LLM 寫 summary、update index、touch 10–15 頁、append log
- **Query** — 對 wiki 提問；**好答案歸檔回 wiki**（compound）
- **Lint** — 健檢矛盾／孤兒頁／缺 cross-ref

**2 個 support files：**
- **`index.md`** — content-oriented catalog
- **`log.md`** — chronological append-only，建議格式 `## [YYYY-MM-DD] ingest | Title`（grep-friendly）

**為何不用 RAG／向量 DB：** index + LLM context window 喺 ~100 source／hundreds of pages 規模下就夠。

**Tips：** Obsidian Web Clipper / `raw/assets/` 下載圖片 / graph view / Marp slides / Dataview / git repo / qmd CLI（搜尋進階用）。

## Key Takeaways

- Karpathy **故意唔畀 explicit folder tree**：「This document is intentionally abstract … exact directory structure ... will depend on your domain」
- 整套靠 LLM「不會 bored」呢個 property（bookkeeping cost 趨近零）
- 同 Vannevar Bush Memex 同一脈絡（1945），Karpathy 補咗「邊個做維護」嘅 missing piece

## My Notes

- 本 vault `wiki/Karpathy LLM Wiki Pattern.md` 已實作；OBSIDIAN-SETUP.md § 一全套都係呢條 gist 嘅延伸
- DAIR.ai 嘅「4 階段」加咗 Compile（**唔係 Karpathy 本人講嘅**）；要追源頭就睇返呢個 gist
- 本 vault 加咗 `hot.md`、`Inbox/`、`Bookmarks/`、`Projects/`、`Meta/` —— 全部係 Karpathy 「intentionally abstract」之上嘅 instantiation，跟 community（kepano／PARA／GTD／LYT）拼出嚟

## Related
- [[Karpathy LLM Wiki Pattern]]
- [[Bookmarks]]
